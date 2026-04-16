import sqlite3 from 'sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Path to the database file (relative to monorepo root)
// From dist/lib/db.js, we need to go up to the monorepo root
const DB_PATH = resolve(__dirname, '../../db/recipes.db');

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
