import sqlite3 from 'sqlite3';
import { promisify } from 'util';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export interface RecipeMetrics {
  totalRecipes: number;
  totalIngredients: number;
  avgCookTime: number;
  avgSpiceLevel: number;
}

export interface CuisineCount {
  cuisine: string;
  count: number;
}

export interface MealTypeCount {
  mealType: string;
  count: number;
}

export interface TopIngredient {
  name: string;
  recipeCount: number;
  rank: number;
}

export interface EffortDistribution {
  effort: string;
  count: number;
}

export interface SpiceDistribution {
  spiceLevel: number;
  count: number;
}

const DB_PATH = path.resolve(__dirname, '../../db/recipes.db');

export class RecipeDatabase {
  private db: sqlite3.Database | null = null;

  async connect(): Promise<void> {
    this.db = new sqlite3.Database(DB_PATH);
    // Clear cache to ensure we see latest data from other processes
    await this.query('PRAGMA cache_size = 0', []);
  }

  async close(): Promise<void> {
    if (this.db) {
      await new Promise<void>((resolve, reject) => {
        this.db!.close((err) => {
          if (err) reject(err);
          else resolve();
        });
      });
      this.db = null;
    }
  }

  private async query<T>(sql: string, params: unknown[] = []): Promise<T[]> {
    if (!this.db) throw new Error('Database not connected');
    
    return new Promise<T[]>((resolve, reject) => {
      this.db!.all(sql, params, (err, rows) => {
        if (err) reject(err);
        else resolve(rows as T[]);
      });
    });
  }

  async getMetrics(): Promise<RecipeMetrics> {
    const [recipeCount] = await this.query<{ count: number }>(
      'SELECT COUNT(*) as count FROM recipes'
    );
    const [ingredientCount] = await this.query<{ count: number }>(
      'SELECT COUNT(*) as count FROM ingredients'
    );
    const [avgTime] = await this.query<{ avg: number }>(
      'SELECT AVG(estimated_time_minutes) as avg FROM recipes'
    );
    const [avgSpice] = await this.query<{ avg: number }>(
      'SELECT AVG(spice_level) as avg FROM recipes'
    );

    return {
      totalRecipes: recipeCount?.count || 0,
      totalIngredients: ingredientCount?.count || 0,
      avgCookTime: Math.round(avgTime?.avg || 0),
      avgSpiceLevel: Math.round((avgSpice?.avg || 0) * 10) / 10,
    };
  }

  async getCuisineCounts(): Promise<CuisineCount[]> {
    return this.query<CuisineCount>(`
      SELECT 
        cuisine as cuisine,
        COUNT(*) as count
      FROM recipes
      GROUP BY cuisine
      ORDER BY count DESC, cuisine ASC
    `);
  }

  async getMealTypeCounts(): Promise<MealTypeCount[]> {
    return this.query<MealTypeCount>(`
      SELECT 
        meal_type as mealType,
        COUNT(*) as count
      FROM recipes
      GROUP BY meal_type
      ORDER BY count DESC, meal_type ASC
    `);
  }

  async getTopIngredients(limit: number = 15): Promise<TopIngredient[]> {
    return this.query<TopIngredient>(`
      SELECT
        i.name as name,
        COUNT(ri.recipe_id) as recipeCount,
        RANK() OVER (ORDER BY COUNT(ri.recipe_id) DESC) as rank
      FROM ingredients i
      JOIN recipe_ingredients ri ON i.id = ri.ingredient_id
      GROUP BY i.id, i.name
      ORDER BY recipeCount DESC, name ASC
      LIMIT ${limit}
    `);
  }

  async getEffortDistribution(): Promise<EffortDistribution[]> {
    return this.query<EffortDistribution>(`
      SELECT
        effort as effort,
        COUNT(*) as count
      FROM recipes
      GROUP BY effort
      ORDER BY 
        CASE effort
          WHEN 'easy' THEN 1
          WHEN 'medium' THEN 2
          WHEN 'involved' THEN 3
          ELSE 4
        END
    `);
  }

  async getSpiceDistribution(): Promise<SpiceDistribution[]> {
    return this.query<SpiceDistribution>(`
      SELECT
        spice_level as spiceLevel,
        COUNT(*) as count
      FROM recipes
      GROUP BY spice_level
      ORDER BY spice_level ASC
    `);
  }
}
