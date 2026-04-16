-- Query: List Recipes Sorted
-- Purpose: Lists all recipes with key details, sorted by cuisine and title.
--          Useful for browsing the recipe collection and finding recipes by cuisine type.

SELECT
    r.id AS recipe_id,
    r.title AS recipe_title,
    r.cuisine AS cuisine_type,
    r.meal_type AS meal_category,
    r.effort AS effort_level,
    r.estimated_time_minutes AS cook_time_minutes,
    r.spice_level AS spice_heat_level,
    COUNT(ri.ingredient_id) AS ingredient_count
FROM recipes r
LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
GROUP BY r.id, r.title, r.cuisine, r.meal_type, r.effort, r.estimated_time_minutes, r.spice_level
ORDER BY r.cuisine ASC, r.title ASC;
