# Bourdain

A multi-interface recipe application with CLI, TUI, and web components.

## Project Structure

Monorepo

```
.
├── README.md          # This file - project overview and documentation
├── db/                # Database layer - all data assets
├── cli/               # Command-line interface
├── tui/               # Terminal user interface
└── web/               # Web application
```

## Database (`db/`)

The database layer is the foundation of the application, storing all recipe data, ingredients, and related metadata.

**All database-related assets live here:**
- `recipes.db` - SQLite database file
- `schema.sql` - Database schema definitions
- `seed.sql` - Seed data scripts
- `queries/` - SQL query references

**Current Database Stats:**
- 20 recipes (4 each: Chinese, American, Italian, Thai, Indian)
- 105 ingredients
- 129 recipe-ingredient links
- 22 tags
- 12 taste descriptors

### Running Queries

Execute SQL queries using the `sqlite3` CLI:

```bash
# List all recipes sorted by cuisine and title
sqlite3 db/recipes.db < db/queries/list_recipes_sorted.sql

# Show most popular ingredients across all recipes
sqlite3 db/recipes.db < db/queries/ingredient_popularity.sql
```

For interactive exploration:

```bash
sqlite3 db/recipes.db

-- Then run queries directly
SELECT * FROM recipes LIMIT 5;
SELECT cuisine, COUNT(*) FROM recipes GROUP BY cuisine;
```

## CLI (`cli/`)

Command-line interface for recipe management. Built with Commander.js and Clack for interactive prompts.

<img width="572" height="626" alt="image" src="https://github.com/user-attachments/assets/4679aaef-b2c8-456f-bd1c-9eb95ba360a7" />


### Installation

```bash
cd cli
pnpm install
pnpm build
```

### Usage

The CLI is available as `bourdain`:

```bash
# Show help and available commands
bourdain --help

# Show version
bourdain --version

# Run without the welcome banner
bourdain --no-banner
```

### Commands

#### `list` (alias: `ls`)

List recipes with optional filtering and sorting.

```bash
# Interactive mode (default) - prompts for sort, cuisine, and ingredients
bourdain list

# List all recipes sorted alphabetically
bourdain list --no-interactive

# Sort by cooking time (shortest first)
bourdain list --no-interactive --sort time

# Sort by spice level (hottest first)
bourdain list --no-interactive --sort spice

# Filter by cuisine
bourdain list --no-interactive --cuisine italian

# Filter by ingredients (recipes must contain ALL listed ingredients)
bourdain list --no-interactive --ingredients "chicken,garlic"
```

**Sort Options:**
- `alpha` - Alphabetical by title (A-Z)
- `time` - Cooking time, shortest first
- `spice` - Spice level, hottest first

#### `random` (alias: `rand`)

Pick a random recipe with optional filters.

```bash
# Interactive mode (default) - prompts for cuisine and meal type filters
bourdain random

# Completely random recipe
bourdain random --no-interactive

# Random recipe from a specific cuisine
bourdain random --no-interactive --cuisine thai

# Random recipe for a specific meal type
bourdain random --no-interactive --meal-type dinner

# Combine filters
bourdain random --no-interactive --cuisine italian --meal-type lunch
```

**Meal Types:** breakfast, lunch, dinner, snack, dessert

### Examples

```bash
# Find a quick weeknight dinner
bourdain random --no-interactive --meal-type dinner

# Browse all Italian recipes
bourdain list --no-interactive --cuisine italian --sort alpha

# Find spicy recipes
bourdain list --no-interactive --sort spice

# What can I make with chicken and garlic?
bourdain list --no-interactive --ingredients "chicken,garlic"
```

### Linking for Global Use

To use `bourdain` from anywhere:

```bash
cd cli
pnpm run link:global

# Now you can run from any directory
bourdain --help
```

To unlink:

```bash
cd cli
pnpm run unlink:global
```

Or use without linking:

```bash
cd cli
pnpm build && node dist/index.js --help
```

## TUI (`tui/`)

<img width="1083" height="717" alt="image" src="https://github.com/user-attachments/assets/47efc8f0-2bbd-4913-86c3-a103b0d2746c" />


Terminal user interface for interactive recipe analytics dashboard. Built with Ink (React for terminals) featuring bar charts and data tables.

### Installation

```bash
cd tui
pnpm install
pnpm build
```

### Usage

The TUI dashboard is available as `bourdain-dashboard`:

```bash
# Launch the interactive dashboard
bourdain-dashboard

# Or run directly
pnpm start
```

### Dashboard Features

The dashboard displays comprehensive recipe analytics:

#### Overview Panel
- **Total Recipes** - Count of all recipes in the database
- **Total Ingredients** - Count of unique ingredients
- **Avg Cook Time** - Average cooking time in minutes
- **Avg Spice Level** - Average spice level (0-3 scale)

#### Visualizations

**Recipes by Cuisine** (Bar Chart)
Shows distribution of recipes across cuisines:
- Chinese (red)
- American (blue)
- Italian (green)
- Thai (yellow)
- Indian (magenta)

**Recipes by Meal Type** (Bar Chart)
Shows recipes categorized by meal:
- Breakfast (yellow)
- Lunch (green)
- Dinner (blue)
- Snack (magenta)
- Dessert (red)

**Recipes by Effort Level** (Bar Chart)
Distribution by difficulty:
- Easy (green)
- Medium (yellow)
- Involved (red)

**Recipes by Spice Level** (Bar Chart)
Distribution by heat level:
- Level 0 (green) - No spice
- Level 1 (yellow) - Mild
- Level 2 (red) - Medium
- Level 3 (magenta) - Hot

#### Top Ingredients Table
Ranked list showing:
- Rank position
- Ingredient name
- Number of recipes containing it
- Visual bar representation

### Navigation

- Press **q** or **ESC** to exit the dashboard
- The dashboard auto-refreshes on load with live data from the SQLite database

### Data Source

The TUI connects directly to `../db/recipes.db` using the SQLite3 driver, querying:
- `recipes` table for recipe metadata
- `ingredients` table for ingredient counts
- `recipe_ingredients` table for popularity rankings

### Examples

```bash
# Launch dashboard to see all metrics
cd tui && pnpm start

# Build and run
pnpm build && node dist/index.js

# Quick overview of your recipe collection
recipe-dashboard
```

### Linking for Global Use

To use `bourdain-dashboard` from anywhere:

```bash
cd tui
pnpm run link:global

# Now you can run from any directory
bourdain-dashboard
```

To unlink:

```bash
cd tui
pnpm run unlink:global
```

Or use without linking:

```bash
cd tui
pnpm build && node dist/index.js
```

### Auto-Refresh

The dashboard automatically refreshes every 5 seconds to show the latest data. You can also press **'r'** at any time to manually refresh.

## Web (`web/`)

Web application for recipe discovery and management.

*Status: Coming soon*
