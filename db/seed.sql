BEGIN;

-- Chinese Recipes (4)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Kung Pao Chicken', 'chinese', 'dinner', 'medium', 40, 2, 'Classic Sichuan stir-fry with peanuts'),
('Mapo Tofu', 'chinese', 'dinner', 'easy', 30, 3, 'Silky tofu in spicy sauce'),
('Dan Dan Noodles', 'chinese', 'lunch', 'medium', 35, 2, 'Noodles with savory sesame sauce'),
('Scallion Pancakes', 'chinese', 'snack', 'involved', 45, 0, 'Flaky layered flatbread');

-- American Recipes (4)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Classic Cheeseburger', 'american', 'dinner', 'medium', 35, 0, 'Juicy beef patty with melted cheese'),
('Buttermilk Pancakes', 'american', 'breakfast', 'easy', 25, 0, 'Fluffy breakfast classic'),
('Mac and Cheese', 'american', 'dinner', 'easy', 40, 0, 'Creamy comfort food favorite'),
('Caesar Salad', 'american', 'lunch', 'easy', 15, 0, 'Crisp romaine with creamy dressing');

-- Italian Recipes (4)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Spaghetti Carbonara', 'italian', 'dinner', 'easy', 25, 0, 'Creamy pasta with pancetta and egg'),
('Margherita Pizza', 'italian', 'dinner', 'involved', 90, 0, 'Classic tomato and mozzarella'),
('Chicken Parmigiana', 'italian', 'dinner', 'medium', 50, 0, 'Breaded chicken with marinara'),
('Tiramisu', 'italian', 'dessert', 'medium', 40, 0, 'Coffee-soaked ladyfingers with mascarpone');

-- Thai Recipes (4)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Pad Thai', 'thai', 'dinner', 'medium', 35, 1, 'Stir-fried rice noodles with tamarind'),
('Green Curry', 'thai', 'dinner', 'medium', 40, 3, 'Coconut curry with Thai basil'),
('Tom Yum Soup', 'thai', 'lunch', 'easy', 25, 3, 'Hot and sour soup with lemongrass'),
('Mango Sticky Rice', 'thai', 'dessert', 'easy', 30, 0, 'Sweet coconut rice with fresh mango');

-- Indian Recipes (4)
INSERT OR IGNORE INTO recipes (title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes) VALUES
('Chicken Tikka Masala', 'indian', 'dinner', 'medium', 50, 2, 'Creamy tomato curry with yogurt'),
('Palak Paneer', 'indian', 'dinner', 'medium', 40, 1, 'Spinach curry with fresh cheese'),
('Chana Masala', 'indian', 'lunch', 'easy', 35, 2, 'Spiced chickpea curry'),
('Vegetable Biryani', 'indian', 'dinner', 'involved', 60, 2, 'Fragrant rice with spiced vegetables');

-- Ingredients
INSERT OR IGNORE INTO ingredients (name) VALUES
-- Common pantry
('garlic'), ('onion'), ('ginger'), ('lemon'), ('lime'), ('tomato'), ('yogurt'), ('rice'),
('chili'), ('cilantro'), ('basil'), ('soy sauce'), ('olive oil'), ('butter'), ('carrot'), ('potato'),
-- Proteins
('chicken'), ('tofu'), ('beef'), ('pork'), ('shrimp'), ('egg'), ('pancetta'), ('mozzarella'),
('parmesan'), ('paneer'), ('chickpea'),
-- Noodles & Starches
('noodle'), ('spaghetti'), ('rice noodle'), ('bread'), ('pita'),
-- Vegetables
('scallion'), ('green onion'), ('spinach'), ('broccoli'), ('bell pepper'), ('mushroom'), ('cabbage'),
('bok choy'), ('eggplant'), ('cauliflower'), ('pea'), ('corn'),
-- Aromatics & Spices
('cumin'), ('coriander'), ('turmeric'), ('cinnamon'), ('star anise'), ('sichuan peppercorn'),
('lemongrass'), ('galangal'), ('kaffir lime leaf'), ('curry paste'), ('curry powder'), ('garam masala'),
('cardamom'), ('clove'), ('bay leaf'), ('thyme'), ('oregano'), ('red pepper flake'),
-- Sauces & Condiments
('fish sauce'), ('oyster sauce'), ('hoisin sauce'), ('sesame oil'), ('rice vinegar'),
('balsamic vinegar'), ('tomato paste'), ('coconut milk'), ('tamarind'), ('miso'),
-- Dairy
('milk'), ('cream'), ('cheese'), ('sour cream'), ('mascarpone'),
-- Nuts & Seeds
('peanut'), ('cashew'), ('almond'), ('sesame seed'), ('coconut'),
-- Fruits
('mango'), ('pineapple'), ('apple'), ('banana'), ('coconut'),
-- Other
('sugar'), ('brown sugar'), ('honey'), ('maple syrup'), ('flour'), ('cornstarch'),
('baking powder'), ('baking soda'), ('yeast'), ('stock'), ('broth'), ('wine'),
('coffee'), ('tea'), ('chocolate'), ('vanilla'), ('ladyfinger'), ('nori'), ('seaweed');

-- Recipe Ingredients (simplified - linking a subset for brevity)
-- Kung Pao Chicken
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'chicken';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'peanut';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'soy sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Kung Pao Chicken' AND i.name = 'ginger';

-- Mapo Tofu
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'tofu';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'sichuan peppercorn';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'soy sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Mapo Tofu' AND i.name = 'ginger';

-- Dan Dan Noodles
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'noodle';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'pork';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'sesame oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'soy sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Dan Dan Noodles' AND i.name = 'scallion';

-- Scallion Pancakes
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Scallion Pancakes' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Scallion Pancakes' AND i.name = 'scallion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Scallion Pancakes' AND i.name = 'sesame oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Scallion Pancakes' AND i.name = 'salt';

-- American Recipes
-- Classic Cheeseburger
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'beef';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'cheese';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'bread';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'lettuce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Classic Cheeseburger' AND i.name = 'onion';

-- Buttermilk Pancakes
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'baking powder';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Buttermilk Pancakes' AND i.name = 'maple syrup';

-- Mac and Cheese
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Mac and Cheese' AND i.name = 'macaroni';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Mac and Cheese' AND i.name = 'cheese';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Mac and Cheese' AND i.name = 'milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Mac and Cheese' AND i.name = 'butter';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Mac and Cheese' AND i.name = 'flour';

-- Caesar Salad
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'romaine lettuce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'parmesan';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'crouton';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'lemon';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'olive oil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Caesar Salad' AND i.name = 'egg';

-- Italian Recipes
-- Spaghetti Carbonara
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Spaghetti Carbonara' AND i.name = 'spaghetti';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Spaghetti Carbonara' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Spaghetti Carbonara' AND i.name = 'pancetta';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Spaghetti Carbonara' AND i.name = 'parmesan';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Spaghetti Carbonara' AND i.name = 'black pepper';

-- Margherita Pizza
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'yeast';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'mozzarella';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'basil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Margherita Pizza' AND i.name = 'olive oil';

-- Chicken Parmigiana
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'chicken';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'flour';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'bread crumb';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'mozzarella';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'parmesan';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Chicken Parmigiana' AND i.name = 'basil';

-- Tiramisu
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'ladyfinger';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'coffee';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'mascarpone';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Tiramisu' AND i.name = 'cocoa powder';

-- Thai Recipes
-- Pad Thai
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'rice noodle';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'shrimp';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'egg';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'tamarind';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'fish sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'palm sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Pad Thai' AND i.name = 'lime';

-- Green Curry
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'chicken';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'coconut milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'curry paste';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'thai basil';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'bamboo shoot';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'bell pepper';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'fish sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Green Curry' AND i.name = 'palm sugar';

-- Tom Yum Soup
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'shrimp';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'lemongrass';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'galangal';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'kaffir lime leaf';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'chili';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'fish sauce';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'lime';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Tom Yum Soup' AND i.name = 'mushroom';

-- Mango Sticky Rice
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'mango';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'sticky rice';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'coconut milk';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'sugar';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'salt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Mango Sticky Rice' AND i.name = 'sesame seed';

-- Indian Recipes
-- Chicken Tikka Masala
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'chicken';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'yogurt';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'cream';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'garam masala';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'coriander';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'turmeric';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'ginger';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 12 FROM recipes r, ingredients i WHERE r.title = 'Chicken Tikka Masala' AND i.name = 'chili';

-- Palak Paneer
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'paneer';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'spinach';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'ginger';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'coriander';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'garam masala';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Palak Paneer' AND i.name = 'cream';

-- Chana Masala
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'chickpea';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'tomato';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'ginger';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'coriander';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'turmeric';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'garam masala';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Chana Masala' AND i.name = 'chili';

-- Vegetable Biryani
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'rice';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 2 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'cauliflower';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 3 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'carrot';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 4 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'pea';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 5 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'onion';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 6 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'garlic';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 7 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'ginger';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 8 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'cumin';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 9 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'coriander';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 10 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'turmeric';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 11 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'garam masala';
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 12 FROM recipes r, ingredients i WHERE r.title = 'Vegetable Biryani' AND i.name = 'saffron';

-- Recipe Steps
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Marinate chicken in yogurt and spices for 30 minutes' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 2, 'Grill or broil chicken until charred and cooked through' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 3, 'Sauté onions, garlic, and ginger in butter' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 4, 'Add tomatoes and spices, simmer until thickened' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 5, 'Stir in cream and add grilled chicken' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 6, 'Simmer gently and serve with rice or naan' FROM recipes r WHERE r.title = 'Chicken Tikka Masala';

-- Tags
INSERT OR IGNORE INTO tags (name) VALUES
('chicken'), ('tofu'), ('beef'), ('pork'), ('seafood'), ('vegetarian'),
('noodle'), ('rice'), ('soup'), ('salad'), ('curry'), ('stir-fry'),
('roasted'), ('grilled'), ('braised'), ('fried'), ('baked'),
('weeknight'), ('dinner-party'), ('meal-prep'), ('comfort-food'), ('quick');

-- Recipe Tags (sample)
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Kung Pao Chicken' AND t.name = 'chicken';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Kung Pao Chicken' AND t.name = 'stir-fry';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Mapo Tofu' AND t.name = 'tofu';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Mapo Tofu' AND t.name = 'comfort-food';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chicken Tikka Masala' AND t.name = 'chicken';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Chicken Tikka Masala' AND t.name = 'curry';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Palak Paneer' AND t.name = 'vegetarian';
INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id FROM recipes r, tags t WHERE r.title = 'Palak Paneer' AND t.name = 'curry';

-- Descriptors
INSERT OR IGNORE INTO descriptors (name) VALUES
('cozy'), ('bright'), ('restrained'), ('indulgent'), ('savory'), ('fresh'),
('rich'), ('spicy'), ('herbal'), ('smoky'), ('tangy'), ('comforting');

-- Recipe Descriptors (sample)
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Kung Pao Chicken' AND d.name = 'spicy';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Kung Pao Chicken' AND d.name = 'savory';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Mapo Tofu' AND d.name = 'spicy';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Mapo Tofu' AND d.name = 'comforting';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chicken Tikka Masala' AND d.name = 'rich';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Chicken Tikka Masala' AND d.name = 'comforting';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Palak Paneer' AND d.name = 'savory';
INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id FROM recipes r, descriptors d WHERE r.title = 'Palak Paneer' AND d.name = 'comforting';

COMMIT;