import * as p from '@clack/prompts';
import pc from 'picocolors';
import { getCuisines, getMealTypes, getRecipeIngredients, getRecipeSteps, getRandomRecipe, getRecipeTags, getRecipeDescriptors } from '../lib/recipes.js';
import { displayRecipe } from '../lib/display.js';
import { closeDb } from '../lib/db.js';

interface RandomOptions {
  interactive?: boolean;
  cuisine?: string;
  mealType?: string;
}

export async function randomCommand(options: RandomOptions = {}) {
  try {
    let cuisine: string | undefined = options.cuisine;
    let mealType: string | undefined = options.mealType;

    // Interactive mode
    if (options.interactive !== false && !cuisine && !mealType) {
      p.intro(pc.cyan('Random Recipe Picker'));

      // Cuisine filter
      const availableCuisines = await getCuisines();
      const cuisineChoice = await p.select({
        message: 'Filter by cuisine?',
        options: [
          { value: 'all', label: 'Any cuisine' },
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

      // Meal type filter
      const availableMealTypes = await getMealTypes();
      const mealTypeChoice = await p.select({
        message: 'Filter by meal type?',
        options: [
          { value: 'all', label: 'Any meal type' },
          ...availableMealTypes.map(m => ({ value: m, label: m.charAt(0).toUpperCase() + m.slice(1) })),
        ],
      });

      if (p.isCancel(mealTypeChoice)) {
        p.outro(pc.yellow('Cancelled'));
        closeDb();
        return;
      }

      if (mealTypeChoice !== 'all') {
        mealType = mealTypeChoice as string;
      }
    }

    // Fetch random recipe
    const { default: ora } = await import('ora');
    const spinner = ora({ text: 'Picking a random recipe...', color: 'cyan' }).start();

    const recipe = await getRandomRecipe({ cuisine, mealType });

    spinner.stop();

    if (!recipe) {
      p.outro(pc.yellow('No recipes found matching your criteria.'));
      closeDb();
      return;
    }

    // Get full recipe details
    const [ingredients, steps, tags, descriptors] = await Promise.all([
      getRecipeIngredients(recipe.id),
      getRecipeSteps(recipe.id),
      getRecipeTags(recipe.id),
      getRecipeDescriptors(recipe.id),
    ]);

    // Display recipe using the shared display function
    displayRecipe({ recipe, ingredients, steps, tags, descriptors });

    p.outro(pc.green('✓ Enjoy your recipe!'));

  } catch (error) {
    console.error(pc.red('Error:'), error instanceof Error ? error.message : error);
    process.exit(1);
  } finally {
    closeDb();
  }
}
