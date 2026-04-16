BEGIN;

-- German Recipes (5)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Sauerbraten', 'german', 'dinner', 'involved', 180, 0, 'Marinated pot roast with sweet and sour gravy'),
('Schnitzel', 'german', 'dinner', 'medium', 35, 0, 'Crispy breaded pork cutlet'),
('Kartoffelsalat', 'german', 'lunch', 'easy', 40, 0, 'Warm German potato salad with bacon'),
('Spätzle', 'german', 'dinner', 'medium', 45, 0, 'Soft egg noodles from Swabia'),
('Apfelstrudel', 'german', 'dessert', 'involved', 90, 0, 'Flaky pastry with spiced apple filling');

-- Ingredients for German recipes
INSERT OR IGNORE INTO ingredients (name) VALUES
('beef roast'),
('red wine vinegar'),
('gingerbread'),
('juniper berry'),
('pork cutlet'),
('bread crumb'),
('lemon'),
('potato'),
('bacon'),
('mustard'),
('beef broth'),
('flour'),
('egg'),
('nutmeg'),
('apple'),
('raisin'),
('cinnamon'),
('puff pastry'),
('butter'),
('onion'),
('garlic'),
('parsley'),
('caraway'),
('allspice'),
('clove'),
('sour cream'),
('chive'),
('dill'),
('white vinegar'),
('sugar'),
('salt'),
('black pepper'),
('vegetable oil'),
('milk');

-- Sauerbraten ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'beef roast';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'red wine vinegar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'water';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'carrot';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'bay leaf';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'juniper berry';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'clove';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'beef broth';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'gingerbread';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'sour cream';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 12 FROM recipes r, ingredients i WHERE r.title = 'Sauerbraten' AND i.name = 'flour';

-- Schnitzel ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'pork cutlet';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'bread crumb';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'vegetable oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'lemon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'parsley';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Schnitzel' AND i.name = 'black pepper';

-- Kartoffelsalat ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'potato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'bacon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'beef broth';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'white vinegar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'mustard';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'black pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Kartoffelsalat' AND i.name = 'parsley';

-- Spätzle ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'nutmeg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'black pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Spätzle' AND i.name = 'parsley';

-- Apfelstrudel ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'apple';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'raisin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'cinnamon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'lemon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'puff pastry';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'bread crumb';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'vanilla';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Apfelstrudel' AND i.name = 'powdered sugar';

-- Recipe Steps for German recipes
-- Sauerbraten steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Marinate beef in vinegar, wine, and spices for 3-5 days' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Remove meat, pat dry, reserve marinade' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Sear meat on all sides in a Dutch oven' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add onions, carrots, and celery, sauté briefly' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Pour in reserved marinade and beef broth' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Simmer covered for 3-4 hours until tender' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 7, 'Strain sauce, thicken with crushed gingerbread' FROM recipes r WHERE r.title = 'Sauerbraten';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 8, 'Slice meat, serve with sauce and potato dumplings' FROM recipes r WHERE r.title = 'Sauerbraten';

-- Schnitzel steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Pound pork cutlets to 1/4 inch thickness' FROM recipes r WHERE r.title = 'Schnitzel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Season cutlets with salt and pepper' FROM recipes r WHERE r.title = 'Schnitzel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Dredge in flour, then egg, then breadcrumbs' FROM recipes r WHERE r.title = 'Schnitzel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Fry in vegetable oil until golden brown' FROM recipes r WHERE r.title = 'Schnitzel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Drain on paper towels, serve with lemon wedges' FROM recipes r WHERE r.title = 'Schnitzel';

-- Kartoffelsalat steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Boil potatoes until tender, then peel and slice' FROM recipes r WHERE r.title = 'Kartoffelsalat';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Fry bacon until crisp, reserve drippings' FROM recipes r WHERE r.title = 'Kartoffelsalat';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Sauté onions in bacon drippings until soft' FROM recipes r WHERE r.title = 'Kartoffelsalat';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add vinegar, broth, mustard, and sugar to pan' FROM recipes r WHERE r.title = 'Kartoffelsalat';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Pour warm dressing over potatoes, toss gently' FROM recipes r WHERE r.title = 'Kartoffelsalat';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Garnish with bacon and fresh parsley' FROM recipes r WHERE r.title = 'Kartoffelsalat';

-- Spätzle steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Mix flour, eggs, milk, nutmeg, salt, and pepper' FROM recipes r WHERE r.title = 'Spätzle';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Beat until smooth and elastic, let rest 30 minutes' FROM recipes r WHERE r.title = 'Spätzle';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Press dough through spätzle maker into boiling water' FROM recipes r WHERE r.title = 'Spätzle';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Cook until they float, then 2 minutes more' FROM recipes r WHERE r.title = 'Spätzle';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Drain and toss with melted butter' FROM recipes r WHERE r.title = 'Spätzle';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Sauté until golden, garnish with parsley' FROM recipes r WHERE r.title = 'Spätzle';

-- Apfelstrudel steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Peel, core, and slice apples thinly' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Toss apples with sugar, cinnamon, raisins, and lemon juice' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Roll out puff pastry into a thin rectangle' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Sprinkle breadcrumbs mixed with butter over pastry' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Spread apple filling along one long edge' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Roll up tightly, tucking in ends' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 7, 'Brush with melted butter, bake at 375°F for 35 minutes' FROM recipes r WHERE r.title = 'Apfelstrudel';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 8, 'Dust with powdered sugar before serving' FROM recipes r WHERE r.title = 'Apfelstrudel';

-- Tags for German recipes
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Sauerbraten' AND t.name = 'beef';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Sauerbraten' AND t.name = 'braised';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Sauerbraten' AND t.name = 'comfort-food';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Schnitzel' AND t.name = 'pork';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Schnitzel' AND t.name = 'fried';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Schnitzel' AND t.name = 'weeknight';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Kartoffelsalat' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Kartoffelsalat' AND t.name = 'side';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Kartoffelsalat' AND t.name = 'quick';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Spätzle' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Spätzle' AND t.name = 'noodle';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Spätzle' AND t.name = 'comfort-food';

-- Descriptors for German recipes
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Sauerbraten' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Sauerbraten' AND d.name = 'comforting';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Schnitzel' AND d.name = 'crispy';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Schnitzel' AND d.name = 'savory';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Kartoffelsalat' AND d.name = 'tangy';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Kartoffelsalat' AND d.name = 'savory';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Spätzle' AND d.name = 'comforting';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Spätzle' AND d.name = 'rich';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Apfelstrudel' AND d.name = 'cozy';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Apfelstrudel' AND d.name = 'indulgent';

COMMIT;
