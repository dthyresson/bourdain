BEGIN;

-- French Recipes (5)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Coq au Vin', 'french', 'dinner', 'involved', 120, 0, 'Classic braised chicken in red wine'),
('Ratatouille', 'french', 'dinner', 'medium', 60, 0, 'Provençal vegetable stew with herbs'),
('Croque Monsieur', 'french', 'lunch', 'easy', 25, 0, 'Ham and cheese sandwich with béchamel'),
('French Onion Soup', 'french', 'lunch', 'medium', 75, 0, 'Caramelized onions in rich beef broth'),
('Crème Brûlée', 'french', 'dessert', 'medium', 50, 0, 'Creamy custard with caramelized sugar top');

-- Ingredients for French recipes
INSERT OR IGNORE INTO ingredients (name) VALUES
('chicken thigh'),
('red wine'),
('bacon'),
('mushroom'),
('pearl onion'),
('thyme'),
('bay leaf'),
('eggplant'),
('zucchini'),
('bell pepper'),
('tomato'),
('garlic'),
('basil'),
('oregano'),
('ham'),
('gruyere'),
('bread'),
('butter'),
('flour'),
('milk'),
('nutmeg'),
('yellow onion'),
('beef broth'),
('baguette'),
('cream'),
('vanilla'),
('sugar'),
('egg yolk');

-- Coq au Vin ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'chicken thigh';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'red wine';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'bacon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'mushroom';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'pearl onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'thyme';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'bay leaf';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Coq au Vin' AND i.name = 'flour';

-- Ratatouille ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'eggplant';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'zucchini';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'bell pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'olive oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'basil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'thyme';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Ratatouille' AND i.name = 'oregano';

-- Croque Monsieur ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'bread';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'ham';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'gruyere';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'nutmeg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Croque Monsieur' AND i.name = 'dijon mustard';

-- French Onion Soup ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'yellow onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'beef broth';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'red wine';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'thyme';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'bay leaf';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'baguette';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'gruyere';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'French Onion Soup' AND i.name = 'black pepper';

-- Crème Brûlée ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Crème Brûlée' AND i.name = 'cream';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Crème Brûlée' AND i.name = 'vanilla';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Crème Brûlée' AND i.name = 'egg yolk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Crème Brûlée' AND i.name = 'sugar';

-- Recipe Steps for French recipes
-- Coq au Vin steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Marinate chicken in red wine with herbs overnight' FROM recipes r WHERE r.title = 'Coq au Vin';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Brown bacon in a large Dutch oven, then remove' FROM recipes r WHERE r.title = 'Coq au Vin';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Brown marinated chicken pieces in bacon fat' FROM recipes r WHERE r.title = 'Coq au Vin';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add onions, mushrooms, and garlic, sauté until soft' FROM recipes r WHERE r.title = 'Coq au Vin';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Pour in marinade and stock, simmer for 90 minutes' FROM recipes r WHERE r.title = 'Coq au Vin';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Thicken sauce with beurre manié, garnish with bacon' FROM recipes r WHERE r.title = 'Coq au Vin';

-- Ratatouille steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Slice eggplant, zucchini, and bell peppers into rounds' FROM recipes r WHERE r.title = 'Ratatouille';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Sauté onions and garlic in olive oil until soft' FROM recipes r WHERE r.title = 'Ratatouille';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Add tomatoes, herbs, and simmer for 20 minutes' FROM recipes r WHERE r.title = 'Ratatouille';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Arrange sliced vegetables in overlapping pattern' FROM recipes r WHERE r.title = 'Ratatouille';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Bake at 375°F for 45 minutes until tender' FROM recipes r WHERE r.title = 'Ratatouille';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Drizzle with fresh basil oil before serving' FROM recipes r WHERE r.title = 'Ratatouille';

-- Croque Monsieur steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Make béchamel: melt butter, whisk in flour' FROM recipes r WHERE r.title = 'Croque Monsieur';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Gradually add milk, stirring until thickened' FROM recipes r WHERE r.title = 'Croque Monsieur';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Season with nutmeg, salt, and pepper' FROM recipes r WHERE r.title = 'Croque Monsieur';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Butter bread slices, layer ham and Gruyère' FROM recipes r WHERE r.title = 'Croque Monsieur';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Top with béchamel and more cheese' FROM recipes r WHERE r.title = 'Croque Monsieur';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Broil until golden and bubbling' FROM recipes r WHERE r.title = 'Croque Monsieur';

-- French Onion Soup steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Slice onions thinly, cook in butter over low heat' FROM recipes r WHERE r.title = 'French Onion Soup';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Caramelize for 45 minutes, stirring occasionally' FROM recipes r WHERE r.title = 'French Onion Soup';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Add red wine, deglaze the pan' FROM recipes r WHERE r.title = 'French Onion Soup';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Pour in beef broth, add thyme and bay leaf' FROM recipes r WHERE r.title = 'French Onion Soup';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Simmer for 30 minutes, season to taste' FROM recipes r WHERE r.title = 'French Onion Soup';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Top with baguette and Gruyère, broil until melted' FROM recipes r WHERE r.title = 'French Onion Soup';

-- Crème Brûlée steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Heat cream with vanilla until steaming' FROM recipes r WHERE r.title = 'Crème Brûlée';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Whisk egg yolks with sugar until pale' FROM recipes r WHERE r.title = 'Crème Brûlée';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Temper hot cream into yolks gradually' FROM recipes r WHERE r.title = 'Crème Brûlée';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Strain and pour into ramekins' FROM recipes r WHERE r.title = 'Crème Brûlée';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Bake in water bath at 325°F for 35 minutes' FROM recipes r WHERE r.title = 'Crème Brûlée';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Chill, then caramelize sugar with torch before serving' FROM recipes r WHERE r.title = 'Crème Brûlée';

-- Tags for French recipes
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Coq au Vin' AND t.name = 'chicken';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Coq au Vin' AND t.name = 'braised';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Coq au Vin' AND t.name = 'comfort-food';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Ratatouille' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Ratatouille' AND t.name = 'roasted';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Ratatouille' AND t.name = 'weeknight';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Croque Monsieur' AND t.name = 'quick';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Croque Monsieur' AND t.name = 'comfort-food';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'French Onion Soup' AND t.name = 'soup';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'French Onion Soup' AND t.name = 'comfort-food';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'French Onion Soup' AND t.name = 'weeknight';

-- Descriptors for French recipes
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Coq au Vin' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Coq au Vin' AND d.name = 'comforting';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Ratatouille' AND d.name = 'fresh';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Ratatouille' AND d.name = 'herbal';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Croque Monsieur' AND d.name = 'indulgent';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Croque Monsieur' AND d.name = 'savory';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'French Onion Soup' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'French Onion Soup' AND d.name = 'comforting';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Crème Brûlée' AND d.name = 'indulgent';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Crème Brûlée' AND d.name = 'rich';

COMMIT;