# SQL insert pattern

Use this pattern when turning generated recipes into SQLite inserts.

## Transaction wrapper

Always wrap the generated file in:

```sql
BEGIN;
-- inserts here
COMMIT;
```

## String escaping

Escape every single quote inside SQL string literals by doubling it.

Example:
- `Grandma's Chicken` becomes `Grandma''s Chicken`

## Insert order

For each recipe, use this order:

1. Insert the recipe row with `INSERT OR IGNORE`
2. Insert all ingredient names with `INSERT OR IGNORE`
3. Insert all tags with `INSERT OR IGNORE`
4. Insert all descriptors with `INSERT OR IGNORE`
5. Insert all steps with `INSERT OR IGNORE`
6. Insert recipe links with `INSERT OR IGNORE` and `SELECT` subqueries

## Recipe insert

```sql
INSERT OR IGNORE INTO recipes (
  title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes
) VALUES (
  'Lemon Butter Chicken with Rice', 'american', 'dinner', 'easy', 35, 0, 'Good default family dinner.'
);
```

## Ingredient insert

```sql
INSERT OR IGNORE INTO ingredients (name) VALUES ('chicken thigh');
```

## Ingredient link insert

```sql
INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1
FROM recipes r, ingredients i
WHERE r.title = 'Lemon Butter Chicken with Rice'
  AND r.cuisine = 'american'
  AND i.name = 'chicken thigh';
```

## Tag insert and link

```sql
INSERT OR IGNORE INTO tags (name) VALUES ('weeknight');

INSERT OR IGNORE INTO recipe_tags (recipe_id, tag_id)
SELECT r.id, t.id
FROM recipes r, tags t
WHERE r.title = 'Lemon Butter Chicken with Rice'
  AND r.cuisine = 'american'
  AND t.name = 'weeknight';
```

## Descriptor insert and link

```sql
INSERT OR IGNORE INTO descriptors (name) VALUES ('bright');

INSERT OR IGNORE INTO recipe_descriptors (recipe_id, descriptor_id)
SELECT r.id, d.id
FROM recipes r, descriptors d
WHERE r.title = 'Lemon Butter Chicken with Rice'
  AND r.cuisine = 'american'
  AND d.name = 'bright';
```

## Step insert

```sql
INSERT OR IGNORE INTO recipe_steps (recipe_id, step_number, instruction)
SELECT r.id, 1, 'Season and sear the chicken until browned.'
FROM recipes r
WHERE r.title = 'Lemon Butter Chicken with Rice'
  AND r.cuisine = 'american';
```
