import * as p from '@clack/prompts';
import pc from 'picocolors';
import { getCuisines, getMealTypes, getRecipeIngredients, getRecipeSteps, getRandomRecipe } from '../lib/recipes.js';
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
    const [ingredients, steps] = await Promise.all([
      getRecipeIngredients(recipe.id),
      getRecipeSteps(recipe.id),
    ]);

    // Display recipe
    console.log('\n' + pc.bold(pc.cyan('━'.repeat(60))));
    console.log(pc.bold(pc.white(recipe.title)));
    console.log(pc.dim('━'.repeat(60)));

    // Recipe metadata
    console.log(pc.dim(`Cuisine: ${recipe.cuisine.charAt(0).toUpperCase() + recipe.cuisine.slice(1)}`));
    console.log(pc.dim(`Meal Type: ${recipe.meal_type.charAt(0).toUpperCase() + recipe.meal_type.slice(1)}`));
    console.log(pc.dim(`Effort: ${recipe.effort.charAt(0).toUpperCase() + recipe.effort.slice(1)}`));
    console.log(pc.dim(`Time: ${recipe.estimated_time_minutes} minutes`));
    console.log(pc.dim(`Spice Level: ${'🌶️'.repeat(recipe.spice_level)}${'○'.repeat(3 - recipe.spice_level)}`));

    if (recipe.notes) {
      console.log(pc.dim(`Notes: ${recipe.notes}`));
    }

    // Ingredients
    console.log('\n' + pc.bold(pc.cyan('Ingredients')));
    console.log(pc.dim('─'.repeat(40)));
    if (ingredients.length > 0) {
      ingredients.forEach((ingredient, index) => {
        console.log(pc.white(`  ${index + 1}. ${ingredient.charAt(0).toUpperCase() + ingredient.slice(1)}`));
      });
    } else {
      console.log(pc.dim('  No ingredients listed'));
    }

    // Cooking Steps
    console.log('\n' + pc.bold(pc.cyan('Cooking Steps')));
    console.log(pc.dim('─'.repeat(40)));
    if (steps.length > 0) {
      steps.forEach((step, index) => {
        console.log(pc.white(`  ${index + 1}. ${step}`));
      });
    } else {
      console.log(pc.dim('  No cooking steps listed'));
    }

    console.log('\n' + pc.dim('━'.repeat(60)));
    p.outro(pc.green('✓ Enjoy your recipe!'));

  } catch (error) {
    console.error(pc.red('Error:'), error instanceof Error ? error.message : error);
    process.exit(1);
  } finally {
    closeDb();
  }
}
