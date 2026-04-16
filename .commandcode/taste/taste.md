# Taste (Continuously Learned by [CommandCode][cmd])

[cmd]: https://commandcode.ai/

# Project Organization
- Update README.md as the project builds and evolves. Confidence: 0.85
- Always store all database-related assets (database file, schema, references, scripts) in the `db/` directory. Confidence: 0.90
- Name the main database file `recipes.db` (stored in the `db/` directory). Confidence: 0.85
- Organize monorepo with separate directories for each component: `db/`, `cli/`, `tui/`, `web/`. Confidence: 0.85
- Use consistent naming across all interfaces (CLI, TUI, web) based on the project name in README. Confidence: 0.80

# SQL Style
- Write SQL keywords in uppercase (SELECT, FROM, WHERE, etc.). Confidence: 0.85
- Use snake_case lowercase for column names and table names. Confidence: 0.85
- Include SQL comments explaining the purpose of each query. Confidence: 0.85

# cli
See [cli/taste.md](cli/taste.md)
