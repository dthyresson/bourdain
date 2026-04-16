import sqlite3 from 'sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Path to the database file
// Try multiple locations to support different run contexts (CLI, tests, etc.)
function findDbPath(): string {
  const possiblePaths = [
    // From dist/lib/db.js in CLI package
    resolve(__dirname, '../../db/recipes.db'),
    // From src/lib/db.ts during tests
    resolve(__dirname, '../../../db/recipes.db'),
    // From project root
    resolve(process.cwd(), 'db/recipes.db'),
    // Absolute fallback
    '/Users/dthyresson/projects/experiments/recipe-1/db/recipes.db',
  ];
  
  for (const path of possiblePaths) {
    try {
      const fs = require('fs');
      if (fs.existsSync(path)) {
        return path;
      }
    } catch {
      // Continue to next path
    }
  }
  
  // Default to the most likely path
  return possiblePaths[0];
}

const DB_PATH = findDbPath();

export function allAsync<T>(sql: string, params: (string | number)[] = []): Promise<T[]> {
  const db = new sqlite3.Database(DB_PATH);
  return new Promise((resolve, reject) => {
    db.all(sql, params, (err, rows) => {
      db.close();
      if (err) reject(err);
      else resolve(rows as T[]);
    });
  });
}

export function getAsync<T>(sql: string, params: (string | number)[] = []): Promise<T | undefined> {
  const db = new sqlite3.Database(DB_PATH);
  return new Promise((resolve, reject) => {
    db.get(sql, params, (err, row) => {
      db.close();
      if (err) reject(err);
      else resolve(row as T);
    });
  });
}

// Deprecated: no longer needed with per-operation connections
export function closeDb(): void {}

export interface Recipe {
  id: number;
  title: string;
  cuisine: string;
  meal_type: string;
  effort: string;
  estimated_time_minutes: number;
  spice_level: number;
  notes: string | null;
}

export interface Ingredient {
  id: number;
  name: string;
}
