-- Query: Ingredient Popularity Analysis
-- Purpose: Counts and ranks ingredients by how often they appear across all recipes.
--          Useful for identifying pantry staples, shopping list priorities,
--          and understanding ingredient distribution in the recipe corpus.

SELECT
    i.name AS ingredient_name,
    COUNT(ri.recipe_id) AS recipe_count,
    RANK() OVER (ORDER BY COUNT(ri.recipe_id) DESC) AS popularity_rank
FROM ingredients i
JOIN recipe_ingredients ri ON i.id = ri.ingredient_id
GROUP BY i.id, i.name
ORDER BY recipe_count DESC, ingredient_name ASC;
