import * as p from '@clack/prompts';
import pc from 'picocolors';
import { 
  listRecipes, 
  getCuisines, 
  getIngredients, 
  getRecipeIngredients,
  type SortOption 
} from '../lib/recipes.js';
import { closeDb } from '../lib/db.js';

interface ListOptions {
  interactive?: boolean;
  sort?: SortOption;
  cuisine?: string;
  ingredients?: string[];
}

export async function listCommand(options: ListOptions = {}) {
  try {
    let sort: SortOption = options.sort || 'alpha';
    let cuisine: string | undefined = options.cuisine;
    let ingredients: string[] | undefined = options.ingredients;

    // Interactive mode
    if (options.interactive !== false) {
      p.intro(pc.cyan('Recipe List Options'));

      // Sort option
      const sortChoice = await p.select({
        message: 'How would you like to sort the recipes?',
        options: [
          { value: 'alpha', label: 'Alphabetical (A-Z)' },
          { value: 'time', label: 'Cooking Time (shortest first)' },
          { value: 'spice', label: 'Spice Level (hottest first)' },
        ],
      });

      if (p.isCancel(sortChoice)) {
        p.outro(pc.yellow('Cancelled'));
        closeDb();
        return;
      }
      sort = sortChoice as SortOption;

      // Filter by cuisine
      const availableCuisines = await getCuisines();
      const cuisineChoice = await p.select({
        message: 'Filter by cuisine?',
        options: [
          { value: 'all', label: 'All cuisines' },
          ...availableCuisines.map(c => ({ value: c, label: c.charAt(0).toUpperCase() + c.slice(1) })),
        ],
      });

      if (p.isCancel(cuisineChoice)) {
        p.outro(pc.yellow('Cancelled'));
        closeDb();
        return;
      }
      
      if (cuisineChoice !== 'all') {
        cuisine = cuisineChoice as string;
      }

      // Filter by ingredients
      const availableIngredients = await getIngredients();
      const ingredientChoices = await p.multiselect({
        message: 'Filter by ingredients (optional - recipes must contain ALL selected):',
        options: availableIngredients.map(i => ({ 
          value: i, 
          label: i.charAt(0).toUpperCase() + i.slice(1) 
        })),
        required: false,
      });

      if (p.isCancel(ingredientChoices)) {
        p.outro(pc.yellow('Cancelled'));
        closeDb();
        return;
      }

      if (Array.isArray(ingredientChoices) && ingredientChoices.length > 0) {
        ingredients = ingredientChoices as string[];
      }
    }

    // Fetch recipes
    const { default: ora } = await import('ora');
    const spinner = ora({ text: 'Fetching recipes...', color: 'cyan' }).start();
    
    const recipes = await listRecipes({ sort, cuisine, ingredients });
    
    spinner.stop();

    // Display results
    if (recipes.length === 0) {
      p.outro(pc.yellow('No recipes found matching your criteria.'));
      closeDb();
      return;
    }

    console.log('\n' + pc.bold(pc.cyan(`Found ${recipes.length} recipe(s)`)));
    console.log(pc.dim('─'.repeat(60)));

    for (const recipe of recipes) {
      console.log('\n' + pc.bold(pc.white(recipe.title)));
      console.log(pc.dim(`  Cuisine: ${recipe.cuisine} | Meal: ${recipe.meal_type} | Effort: ${recipe.effort}`));
      console.log(pc.dim(`  Time: ${recipe.estimated_time_minutes} min | Spice: ${'🌶️'.repeat(recipe.spice_level)}${'○'.repeat(3 - recipe.spice_level)}`));
      
      if (recipe.notes) {
        console.log(pc.dim(`  Notes: ${recipe.notes}`));
      }

      // Get ingredients for this recipe
      const recipeIngredients = await getRecipeIngredients(recipe.id);
      if (recipeIngredients.length > 0) {
        console.log(pc.dim(`  Ingredients: ${recipeIngredients.slice(0, 8).join(', ')}${recipeIngredients.length > 8 ? '...' : ''}`));
      }
    }

    console.log('\n' + pc.dim('─'.repeat(60)));
    p.outro(pc.green(`✓ Showing ${recipes.length} recipe(s)`));
    
  } catch (error) {
    console.error(pc.red('Error:'), error instanceof Error ? error.message : error);
    process.exit(1);
  } finally {
    closeDb();
  }
}
