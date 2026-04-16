import { allAsync, getAsync, type Recipe } from './db.js';

export type SortOption = 'alpha' | 'time' | 'spice';

export interface ListRecipesOptions {
  sort?: SortOption;
  cuisine?: string;
  ingredients?: string[];
}

export async function getCuisines(): Promise<string[]> {
  const rows = await allAsync<{ cuisine: string }>('SELECT DISTINCT cuisine FROM recipes ORDER BY cuisine');
  return rows.map(r => r.cuisine);
}

export async function getMealTypes(): Promise<string[]> {
  const rows = await allAsync<{ meal_type: string }>('SELECT DISTINCT meal_type FROM recipes ORDER BY meal_type');
  return rows.map(r => r.meal_type);
}

export async function getIngredients(): Promise<string[]> {
  const rows = await allAsync<{ name: string }>('SELECT name FROM ingredients ORDER BY name');
  return rows.map(r => r.name);
}

export async function listRecipes(options: ListRecipesOptions = {}): Promise<Recipe[]> {
  let sql = 'SELECT * FROM recipes';
  const whereConditions: string[] = [];
  const params: (string | number)[] = [];
  
  // Filter by cuisine
  if (options.cuisine) {
    whereConditions.push('cuisine = ?');
    params.push(options.cuisine);
  }
  
  // Filter by ingredients
  if (options.ingredients && options.ingredients.length > 0) {
    const placeholders = options.ingredients.map(() => '?').join(',');
    const ingredientFilter = `id IN (
      SELECT DISTINCT ri.recipe_id 
      FROM recipe_ingredients ri
      JOIN ingredients i ON ri.ingredient_id = i.id
      WHERE i.name IN (${placeholders})
      GROUP BY ri.recipe_id
      HAVING COUNT(DISTINCT i.name) = ${options.ingredients.length}
    )`;
    
    if (whereConditions.length > 0) {
      sql += ' WHERE ' + whereConditions.join(' AND ') + ' AND ' + ingredientFilter;
    } else {
      sql += ' WHERE ' + ingredientFilter;
    }
    params.push(...options.ingredients);
  } else if (whereConditions.length > 0) {
    sql += ' WHERE ' + whereConditions.join(' AND ');
  }
  
  // Sort
  const sort = options.sort || 'alpha';
  switch (sort) {
    case 'alpha':
      sql += ' ORDER BY title COLLATE NOCASE';
      break;
    case 'time':
      sql += ' ORDER BY estimated_time_minutes';
      break;
    case 'spice':
      sql += ' ORDER BY spice_level DESC';
      break;
  }
  
  return allAsync<Recipe>(sql, params);
}

export async function getRecipeIngredients(recipeId: number): Promise<string[]> {
  const rows = await allAsync<{ name: string }>(`
    SELECT i.name 
    FROM ingredients i
    JOIN recipe_ingredients ri ON i.id = ri.ingredient_id
    WHERE ri.recipe_id = ?
    ORDER BY ri.position
  `, [recipeId]);
  return rows.map(r => r.name);
}

export async function getRecipeSteps(recipeId: number): Promise<string[]> {
  const rows = await allAsync<{ instruction: string }>(`
    SELECT instruction 
    FROM recipe_steps
    WHERE recipe_id = ?
    ORDER BY step_number
  `, [recipeId]);
  return rows.map(r => r.instruction);
}

export interface RandomRecipeOptions {
  cuisine?: string;
  mealType?: string;
}

export async function getRandomRecipe(options: RandomRecipeOptions = {}): Promise<Recipe | undefined> {
  let sql = 'SELECT * FROM recipes';
  const whereConditions: string[] = [];
  const params: (string | number)[] = [];
  
  if (options.cuisine) {
    whereConditions.push('cuisine = ?');
    params.push(options.cuisine);
  }
  
  if (options.mealType) {
    whereConditions.push('meal_type = ?');
    params.push(options.mealType);
  }
  
  if (whereConditions.length > 0) {
    sql += ' WHERE ' + whereConditions.join(' AND ');
  }
  
  // Use SQLite's RANDOM() function to get a random recipe
  sql += ' ORDER BY RANDOM() LIMIT 1';
  
  return getAsync<Recipe>(sql, params);
}
