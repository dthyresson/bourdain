import pc from 'picocolors';
import type { Recipe } from './db.js';

export interface RecipeDetails {
  recipe: Recipe;
  ingredients: string[];
  steps: string[];
  tags: string[];
  descriptors: string[];
}

/**
 * Display a recipe with all its details in a formatted output
 */
export function displayRecipe(details: RecipeDetails): void {
  const { recipe, ingredients, steps, tags, descriptors } = details;

  console.log('\n' + pc.bold(pc.cyan('━'.repeat(60))));
  console.log(pc.bold(pc.white(recipe.title)));
  console.log(pc.dim('━'.repeat(60)));

  // Recipe metadata
  console.log(pc.dim(`Cuisine: ${recipe.cuisine.charAt(0).toUpperCase() + recipe.cuisine.slice(1)}`));
  console.log(pc.dim(`Meal Type: ${recipe.meal_type.charAt(0).toUpperCase() + recipe.meal_type.slice(1)}`));
  console.log(pc.dim(`Effort: ${recipe.effort.charAt(0).toUpperCase() + recipe.effort.slice(1)}`));
  console.log(pc.dim(`Time: ${recipe.estimated_time_minutes} minutes`));
  if (recipe.spice_level > 0) {
    console.log(pc.dim(`Spice Level: ${'🌶️'.repeat(recipe.spice_level)}${'○'.repeat(3 - recipe.spice_level)}`));
  }

  // Descriptors
  if (descriptors.length > 0) {
    const formattedDescriptors = descriptors.map(d => {
      const formatted = d.charAt(0).toUpperCase() + d.slice(1);
      return d === 'spicy' ? `${formatted} 🌶️` : formatted;
    });
    console.log(pc.dim(`Descriptors: ${formattedDescriptors.join(', ')}`));
  }

  // Tags
  if (tags.length > 0) {
    console.log(pc.dim(`Tags: ${tags.map(t => t.charAt(0).toUpperCase() + t.slice(1)).join(', ')}`));
  }

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
}
