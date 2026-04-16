---
name: recipe-seed-generator
description: generate normalized recipe seed data with the current model and store it in a local sqlite database using sqlite3 and sql files. use when the user wants to create a starter recipe corpus, expand an existing recipe database by cuisine and count, initialize a recipe schema, or append more realistic recipes for local apps, cli tools, tui dashboards, or web browsing without relying on external recipe apis or python helpers.
---

# Recipe Seed Generator

## Overview

Generate realistic, normalized recipe records with the current model, then turn them into SQL and apply them to a local SQLite database with `sqlite3`. On first use, initialize the schema from the bundled SQL file. On later runs, append more recipes with `INSERT OR IGNORE` so duplicate `title + cuisine` rows are skipped cleanly.

## Workflow

Follow this sequence:

1. Read the requested cuisines and counts.
2. If the target database does not exist, initialize it with `scripts/init_schema.sql` using `sqlite3 <db_path> < scripts/init_schema.sql`.
3. Generate recipes in small cuisine-specific batches using the JSON contract in `references/recipe-format.md`.
4. Convert the generated records into a temporary SQL file containing only `INSERT OR IGNORE` and linking statements that match the bundled schema.
5. Apply the SQL with `sqlite3 <db_path> < generated_seed.sql`.
6. Query the database with `sqlite3` to report how many recipes, ingredients, and links were added.

## Inputs to Expect

Expect requests like:
- "add 4 each of chinese, american, italian, thai, and indian to ./recipes.db"
- "initialize a recipe db and seed it with 6 thai and 6 italian recipes"
- "append more mediterranean weeknight recipes to my sqlite database"

Ask at most one short follow-up only if a required path is missing and no reasonable default can be chosen. Otherwise use `./recipes.db` in the current working directory.

## Output Contract

Always generate records that match the JSON structure in `references/recipe-format.md` before converting them to SQL.

Use these normalization rules:
- keep `cuisine` in lowercase
- keep recipe titles in title case
- keep ingredient names singular where natural and free of quantities
- keep tags from the allowed vocabulary when possible
- keep taste descriptors from the allowed vocabulary only
- write 3 to 6 concise steps
- target 6 to 12 ingredients per recipe
- make recipes plausible and non-comical
- prefer overlapping pantry ingredients across cuisines so later analytics have useful signal

## Database Behavior

Use `scripts/init_schema.sql` to create the schema if the database is missing.

When generating SQL for inserts:
- use `INSERT OR IGNORE` for `recipes`, `ingredients`, `tags`, and `descriptors`
- treat duplicates by the unique key `title + cuisine`
- insert recipe links with subqueries that look up IDs from names
- wrap the generated SQL file in `BEGIN;` and `COMMIT;`
- escape single quotes correctly in SQL string literals

Do not rely on Python helpers. Prefer direct `sqlite3` commands and SQL files.

## SQL Generation Guidance

Generate by cuisine batch instead of one giant mixed prompt.

For each cuisine batch:
- produce the exact requested count
- avoid duplicate dishes within the batch
- avoid near-duplicate dishes across prior batches in the same run
- reuse common pantry ingredients where natural
- balance proteins, vegetables, noodles/rice/starch, soups/salads/sides/main dishes when possible

Good shared pantry ingredients include:
- garlic
- onion
- ginger
- lemon
- lime
- tomato
- yogurt
- rice
- chili
- cilantro
- basil
- soy sauce
- olive oil
- butter
- carrot
- potato
- chicken
- tofu

## Recommended Run Pattern

1. Initialize the database if needed:
   `sqlite3 ./recipes.db < scripts/init_schema.sql`
2. Generate one JSON file per run, for example `generated_recipes.json`.
3. Convert the JSON into a SQL file named `generated_seed.sql` that matches the bundled schema.
4. Apply it:
   `sqlite3 ./recipes.db < generated_seed.sql`
5. Inspect counts:
   `sqlite3 ./recipes.db "select cuisine, count(*) from recipes group by cuisine order by cuisine;"`

## SQL File Pattern

Every generated SQL file should follow this structure:

```sql
BEGIN;

INSERT OR IGNORE INTO recipes (
  title, cuisine, meal_type, effort, estimated_time_minutes, spice_level, notes
) VALUES (
  'Lemon Butter Chicken with Rice', 'american', 'dinner', 'easy', 35, 0, 'Good default family dinner.'
);

INSERT OR IGNORE INTO ingredients (name) VALUES ('chicken thigh');
INSERT OR IGNORE INTO ingredients (name) VALUES ('butter');
INSERT OR IGNORE INTO ingredients (name) VALUES ('lemon');

INSERT OR IGNORE INTO recipe_ingredients (recipe_id, ingredient_id, position)
SELECT r.id, i.id, 1
FROM recipes r, ingredients i
WHERE r.title = 'Lemon Butter Chicken with Rice'
  AND r.cuisine = 'american'
  AND i.name = 'chicken thigh';

COMMIT;
```

## Reporting Back

After applying the SQL, report:
- database path
- cuisines requested
- number of recipes generated
- number of recipes now present per cuisine
- any duplicates skipped due to `INSERT OR IGNORE`
- any normalization issues you corrected

## Resources

- Schema SQL: `scripts/init_schema.sql`
- Recipe JSON contract: `references/recipe-format.md`
- SQL insert pattern: `references/sql-insert-pattern.md`
