BEGIN;

-- Mexican Recipes (5)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Chicken Mole', 'mexican', 'dinner', 'involved', 120, 2, 'Complex sauce with chocolate and chilies'),
('Tacos al Pastor', 'mexican', 'dinner', 'medium', 60, 2, 'Marinated pork with pineapple'),
('Chiles Rellenos', 'mexican', 'dinner', 'medium', 75, 1, 'Stuffed poblano peppers with cheese'),
('Guacamole', 'mexican', 'snack', 'easy', 15, 1, 'Fresh avocado dip with lime and cilantro'),
('Churros', 'mexican', 'dessert', 'medium', 45, 0, 'Crispy fried dough with cinnamon sugar');

-- Ingredients for Mexican recipes
INSERT OR IGNORE INTO ingredients (name) VALUES
('chicken thigh'),
('dried ancho chili'),
('dried pasilla chili'),
('mulato chili'),
('mexican chocolate'),
('tomato'),
('onion'),
('garlic'),
('almond'),
('raisin'),
('sesame seed'),
('cinnamon'),
('clove'),
('coriander'),
('chicken broth'),
('pork shoulder'),
('pineapple'),
('achiote paste'),
('orange juice'),
('white vinegar'),
('corn tortilla'),
('cilantro'),
('poblano pepper'),
('monterey jack cheese'),
('egg'),
('flour'),
('avocado'),
('lime'),
('jalapeño'),
('salt'),
('vegetable oil'),
('sugar'),
('water'),
('all-purpose flour'),
('butter'),
('cinnamon sugar'),
('dulce de leche'),
('black pepper'),
('cumin'),
('oregano'),
('thyme'),
('bay leaf'),
('chipotle chili'),
('guajillo chili');

-- Chicken Mole ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'chicken thigh';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'dried ancho chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'dried pasilla chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'mulato chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'mexican chocolate';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'almond';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'raisin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'sesame seed';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 12 FROM recipes r, ingredients i WHERE r.title = 'Chicken Mole' AND i.name = 'chicken broth';

-- Tacos al Pastor ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'pork shoulder';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'pineapple';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'achiote paste';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'guajillo chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'chipotle chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'orange juice';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'white vinegar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'oregano';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'corn tortilla';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 12 FROM recipes r, ingredients i WHERE r.title = 'Tacos al Pastor' AND i.name = 'cilantro';

-- Chiles Rellenos ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'poblano pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'monterey jack cheese';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'oregano';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Chiles Rellenos' AND i.name = 'vegetable oil';

-- Guacamole ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'avocado';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'lime';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'jalapeño';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'cilantro';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Guacamole' AND i.name = 'cumin';

-- Churros ingredients
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'water';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'vanilla';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'cinnamon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'vegetable oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Churros' AND i.name = 'dulce de leche';

-- Recipe Steps for Mexican recipes
-- Chicken Mole steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Toast dried chilies, remove stems and seeds' FROM recipes r WHERE r.title = 'Chicken Mole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Soak chilies in hot water for 30 minutes' FROM recipes r WHERE r.title = 'Chicken Mole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Toast almonds, sesame seeds, and spices' FROM recipes r WHERE r.title = 'Chicken Mole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Blend chilies, nuts, spices, and tomatoes' FROM recipes r WHERE r.title = 'Chicken Mole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Brown chicken, then add mole sauce and broth' FROM recipes r WHERE r.title = 'Chicken Mole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Simmer for 45 minutes, add chocolate, adjust seasoning' FROM recipes r WHERE r.title = 'Chicken Mole';

-- Tacos al Pastor steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Slice pork thinly against the grain' FROM recipes r WHERE r.title = 'Tacos al Pastor';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Blend achiote, chilies, spices, and citrus for marinade' FROM recipes r WHERE r.title = 'Tacos al Pastor';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Marinate pork for at least 4 hours or overnight' FROM recipes r WHERE r.title = 'Tacos al Pastor';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Cook pork on a hot griddle with pineapple slices' FROM recipes r WHERE r.title = 'Tacos al Pastor';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Chop pork and pineapple together' FROM recipes r WHERE r.title = 'Tacos al Pastor';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Serve on warm tortillas with onion and cilantro' FROM recipes r WHERE r.title = 'Tacos al Pastor';

-- Chiles Rellenos steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Roast poblano peppers over open flame until charred' FROM recipes r WHERE r.title = 'Chiles Rellenos';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Place in covered bowl to steam, then peel off skin' FROM recipes r WHERE r.title = 'Chiles Rellenos';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Make a slit and remove seeds carefully' FROM recipes r WHERE r.title = 'Chiles Rellenos';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Stuff peppers with cheese mixture' FROM recipes r WHERE r.title = 'Chiles Rellenos';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Dredge in flour, dip in egg batter, fry until golden' FROM recipes r WHERE r.title = 'Chiles Rellenos';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Serve with tomato sauce' FROM recipes r WHERE r.title = 'Chiles Rellenos';

-- Guacamole steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Cut avocados in half, remove pits, scoop flesh into bowl' FROM recipes r WHERE r.title = 'Guacamole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Mash avocados with lime juice immediately' FROM recipes r WHERE r.title = 'Guacamole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Finely dice onion, tomato, and jalapeño' FROM recipes r WHERE r.title = 'Guacamole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add vegetables to avocado mixture' FROM recipes r WHERE r.title = 'Guacamole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Mince garlic and cilantro, add to bowl' FROM recipes r WHERE r.title = 'Guacamole';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Season with salt and cumin, mix well, serve immediately' FROM recipes r WHERE r.title = 'Guacamole';

-- Churros steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Combine water, butter, sugar, and salt in saucepan' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Bring to boil, then remove from heat' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Add flour all at once, stir vigorously until smooth' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Let dough cool slightly, then beat in eggs one at a time' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Add vanilla, transfer dough to piping bag with star tip' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Pipe 6-inch strips into hot oil, fry until golden' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 7, 'Drain on paper towels, roll in cinnamon sugar' FROM recipes r WHERE r.title = 'Churros';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 8, 'Serve warm with dulce de leche for dipping' FROM recipes r WHERE r.title = 'Churros';

-- Tags for Mexican recipes
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chicken Mole' AND t.name = 'chicken';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chicken Mole' AND t.name = 'braised';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chicken Mole' AND t.name = 'comfort-food';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Tacos al Pastor' AND t.name = 'pork';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Tacos al Pastor' AND t.name = 'grilled';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Tacos al Pastor' AND t.name = 'weeknight';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chiles Rellenos' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chiles Rellenos' AND t.name = 'fried';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chiles Rellenos' AND t.name = 'comfort-food';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Guacamole' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Guacamole' AND t.name = 'quick';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Guacamole' AND t.name = 'snack';

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Churros' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Churros' AND t.name = 'fried';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Churros' AND t.name = 'dessert';

-- Descriptors for Mexican recipes
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chicken Mole' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chicken Mole' AND d.name = 'complex';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Tacos al Pastor' AND d.name = 'bright';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Tacos al Pastor' AND d.name = 'savory';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chiles Rellenos' AND d.name = 'indulgent';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chiles Rellenos' AND d.name = 'comforting';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Guacamole' AND d.name = 'fresh';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Guacamole' AND d.name = 'bright';

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Churros' AND d.name = 'indulgent';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Churros' AND d.name = 'cozy';

COMMIT;
