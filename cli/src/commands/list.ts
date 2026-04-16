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
  ingredientMatch?: 'all' | 'any';
}

export async function listCommand(options: ListOptions = {}) {
  try {
    let sort: SortOption = options.sort || 'alpha';
    let cuisine: string | undefined = options.cuisine;
    let ingredients: string[] | undefined = options.ingredients;
    let ingredientMatch: 'all' | 'any' = options.ingredientMatch || 'all';

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

      // Filter by ingredients (multiselect with initial search)
      const availableIngredients = await getIngredients();
      
      // First, let user search to narrow down
      const searchTerm = await p.text({
        message: 'Search ingredients to filter list (optional):',
        placeholder: 'e.g., "chicken" or leave empty for all',
        required: false,
      });

      if (p.isCancel(searchTerm)) {
        p.outro(pc.yellow('Cancelled'));
        closeDb();
        return;
      }

      const term = (searchTerm || '').toLowerCase().trim();
      const filteredIngredients = term 
        ? availableIngredients.filter(i => i.includes(term))
        : availableIngredients;

      if (filteredIngredients.length === 0) {
        p.note('No ingredients match your search', 'No matches');
      } else {
        // Use multiselect on the filtered (or full) list
        const ingredientChoices = await p.multiselect({
          message: term 
            ? `Select from ${filteredIngredients.length} matches for "${term}"` 
            : `Select ingredients (${availableIngredients.length} total):`,
          options: filteredIngredients.map(i => ({ 
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
          
          // Ask for match mode if multiple ingredients selected
          if (ingredients.length > 1) {
            const matchMode = await p.select({
              message: 'Match mode for ingredients:',
              options: [
                { value: 'all', label: 'ALL ingredients must be present (AND)' },
                { value: 'any', label: 'ANY ingredient can be present (OR)' },
              ],
            });

            if (p.isCancel(matchMode)) {
              p.outro(pc.yellow('Cancelled'));
              closeDb();
              return;
            }

            ingredientMatch = matchMode as 'all' | 'any';
          }
        }
      }
    }

    // Fetch recipes
    const { default: ora } = await import('ora');
    const spinner = ora({ text: 'Fetching recipes...', color: 'cyan' }).start();
    
    const recipes = await listRecipes({ 
      sort, 
      cuisine, 
      ingredients, 
      ingredientMatch 
    });
    
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
      console.log('\n' + pc.bold(pc.cyan(recipe.title)));
      console.log(`  ${pc.green('Cuisine:')} ${recipe.cuisine}  ${pc.green('Meal:')} ${recipe.meal_type}  ${pc.green('Effort:')} ${recipe.effort}`);
      const spiceDisplay = recipe.spice_level > 0 ? `  ${pc.green('Spice:')} ${'🌶️'.repeat(recipe.spice_level)}${'○'.repeat(3 - recipe.spice_level)}` : '';
      console.log(`  ${pc.magenta('Time:')} ${pc.bold(String(recipe.estimated_time_minutes))} min${spiceDisplay}`);
      
      if (recipe.notes) {
        console.log(`  ${pc.yellow('Notes:')} ${recipe.notes}`);
      }

      // Get ingredients for this recipe
      const recipeIngredients = await getRecipeIngredients(recipe.id);
      if (recipeIngredients.length > 0) {
        console.log(`  ${pc.blue('Ingredients:')} ${recipeIngredients.slice(0, 8).join(', ')}${recipeIngredients.length > 8 ? '...' : ''}`);
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
