BEGIN;

-- Scandinavian Recipes (3)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Swedish Meatballs', 'scandinavian', 'dinner', 'medium', 45, 0, 'Classic comfort food with creamy gravy'),
('Gravlax', 'scandinavian', 'lunch', 'easy', 20, 0, 'Cured salmon with dill, served cold'),
('Danish Smorrebrod', 'scandinavian', 'lunch', 'easy', 15, 0, 'Open-faced rye bread sandwiches');

-- Ingredients for Scandinavian recipes
INSERT OR IGNORE INTO ingredients (name) VALUES
('beef'), ('pork'), ('breadcrumbs'), ('allspice'), ('nutmeg'), ('beef stock'),
('sour cream'), ('lingonberry'), ('dill'), ('salmon'), ('salt'), ('sugar'),
('rye bread'), ('butter'), ('herring'), ('cucumber'), ('radish'), ('egg'),
('pickle'), ('mustard'), ('potato');

-- Swedish Meatballs ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'beef';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'pork';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'breadcrumbs';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'allspice';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'nutmeg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'beef stock';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'sour cream';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Swedish Meatballs' AND i.name = 'lingonberry';

-- Gravlax ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'salmon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'dill';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'black pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'mustard';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Gravlax' AND i.name = 'rye bread';

-- Danish Smorrebrod ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'rye bread';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'herring';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'cucumber';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'radish';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'dill';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'lemon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Danish Smorrebrod' AND i.name = 'mustard';

-- Recipe Steps
-- Kung Pao Chicken
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Marinate chicken in soy sauce and cornstarch' FROM recipes r WHERE r.title = 'Kung Pao Chicken';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Prepare sauce with soy sauce, vinegar, sugar, and cornstarch' FROM recipes r WHERE r.title = 'Kung Pao Chicken';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Stir-fry dried chilies and Sichuan peppercorns' FROM recipes r WHERE r.title = 'Kung Pao Chicken';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add chicken and stir-fry until golden' FROM recipes r WHERE r.title = 'Kung Pao Chicken';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Add sauce, peanuts, and scallions' FROM recipes r WHERE r.title = 'Kung Pao Chicken';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Toss until coated and serve hot' FROM recipes r WHERE r.title = 'Kung Pao Chicken';

-- Mapo Tofu
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Blanch tofu in salted boiling water' FROM recipes r WHERE r.title = 'Mapo Tofu';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Fry ground pork with doubanjiang' FROM recipes r WHERE r.title = 'Mapo Tofu';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Add garlic, ginger, and Sichuan peppercorns' FROM recipes r WHERE r.title = 'Mapo Tofu';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Pour in stock and simmer' FROM recipes r WHERE r.title = 'Mapo Tofu';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Gently add tofu and simmer' FROM recipes r WHERE r.title = 'Mapo Tofu';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Thicken with cornstarch slurry and serve' FROM recipes r WHERE r.title = 'Mapo Tofu';

-- Dan Dan Noodles
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Cook noodles according to package' FROM recipes r WHERE r.title = 'Dan Dan Noodles';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Brown ground pork with soy sauce' FROM recipes r WHERE r.title = 'Dan Dan Noodles';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Mix sauce with sesame paste, soy sauce, vinegar, and chili oil' FROM recipes r WHERE r.title = 'Dan Dan Noodles';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Toss noodles with sauce and pork' FROM recipes r WHERE r.title = 'Dan Dan Noodles';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Top with scallions and peanuts' FROM recipes r WHERE r.title = 'Dan Dan Noodles';

-- Scallion Pancakes
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Mix flour with hot water to form dough' FROM recipes r WHERE r.title = 'Scallion Pancakes';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Knead until smooth and rest for 30 minutes' FROM recipes r WHERE r.title = 'Scallion Pancakes';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Roll dough thin and brush with sesame oil' FROM recipes r WHERE r.title = 'Scallion Pancakes';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Sprinkle with scallions and roll into log' FROM recipes r WHERE r.title = 'Scallion Pancakes';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Coil log and roll flat again' FROM recipes r WHERE r.title = 'Scallion Pancakes';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Pan-fry until golden and crispy' FROM recipes r WHERE r.title = 'Scallion Pancakes';

-- Recipe Steps for Scandinavian recipes
-- Swedish Meatballs
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Soak breadcrumbs in milk until softened' FROM recipes r WHERE r.title = 'Swedish Meatballs';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Mix ground beef and pork with soaked breadcrumbs, egg, and spices' FROM recipes r WHERE r.title = 'Swedish Meatballs';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Form into small balls and chill for 30 minutes' FROM recipes r WHERE r.title = 'Swedish Meatballs';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Pan-fry meatballs until browned on all sides' FROM recipes r WHERE r.title = 'Swedish Meatballs';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Make gravy with beef stock, cream, and pan drippings' FROM recipes r WHERE r.title = 'Swedish Meatballs';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Simmer meatballs in gravy and serve with lingonberry' FROM recipes r WHERE r.title = 'Swedish Meatballs';

-- Gravlax
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Mix salt, sugar, and crushed white peppercorns' FROM recipes r WHERE r.title = 'Gravlax';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Place salmon fillet skin-side down on plastic wrap' FROM recipes r WHERE r.title = 'Gravlax';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Rub salt-sugar mixture generously over salmon' FROM recipes r WHERE r.title = 'Gravlax';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Cover with fresh dill and wrap tightly' FROM recipes r WHERE r.title = 'Gravlax';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Refrigerate with weight on top for 48 hours' FROM recipes r WHERE r.title = 'Gravlax';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Slice thinly and serve with mustard sauce' FROM recipes r WHERE r.title = 'Gravlax';

-- Danish Smorrebrod
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Butter rye bread slices generously' FROM recipes r WHERE r.title = 'Danish Smorrebrod';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Layer pickled herring with onion rings' FROM recipes r WHERE r.title = 'Danish Smorrebrod';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Add sliced hard-boiled egg on top' FROM recipes r WHERE r.title = 'Danish Smorrebrod';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Garnish with fresh dill and capers' FROM recipes r WHERE r.title = 'Danish Smorrebrod';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Drizzle with lemon juice and serve immediately' FROM recipes r WHERE r.title = 'Danish Smorrebrod';

-- Recipe Tags for Scandinavian recipes
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Swedish Meatballs' AND t.name = 'beef';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Swedish Meatballs' AND t.name = 'comfort-food';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Swedish Meatballs' AND t.name = 'dinner-party';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Gravlax' AND t.name = 'seafood';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Gravlax' AND t.name = 'quick';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Danish Smorrebrod' AND t.name = 'seafood';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Danish Smorrebrod' AND t.name = 'quick';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Danish Smorrebrod' AND t.name = 'weeknight';

-- Recipe Descriptors for Scandinavian recipes
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Swedish Meatballs' AND d.name = 'comforting';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Swedish Meatballs' AND d.name = 'savory';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Swedish Meatballs' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Gravlax' AND d.name = 'fresh';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Gravlax' AND d.name = 'bright';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Gravlax' AND d.name = 'savory';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Danish Smorrebrod' AND d.name = 'fresh';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Danish Smorrebrod' AND d.name = 'bright';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Danish Smorrebrod' AND d.name = 'savory';

COMMIT;
