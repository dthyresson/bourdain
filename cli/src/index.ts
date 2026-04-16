#!/usr/bin/env node

import { Command } from 'commander';
import pc from 'picocolors';
import { showBanner } from './lib/banner.js';
import { listCommand } from './commands/list.js';
import { randomCommand } from './commands/random.js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Read version from package.json
const packageJson = JSON.parse(readFileSync(join(__dirname, '../package.json'), 'utf-8'));
const version = packageJson.version;

const program = new Command();

program
  .name('bourdain')
  .description('A CLI for exploring the recipe database')
  .version(version, '-v, --version', 'Display version number')
  .option('-n, --no-banner', 'Hide the welcome banner')
  .action(() => {
    const opts = program.opts();
    if (opts.banner) {
      showBanner();
    }
    program.help();
  });

program
  .command('list')
  .alias('ls')
  .description('List recipes with optional filtering and sorting')
  .option('-s, --sort <type>', 'Sort by: alpha, time, or spice', 'alpha')
  .option('-c, --cuisine <cuisine>', 'Filter by cuisine')
  .option('-i, --ingredients <ingredients>', 'Filter by ingredients (comma-separated)')
  .option('--no-interactive', 'Skip interactive prompts and use only CLI options')
  .action(async (options) => {
    const opts: {
      interactive?: boolean;
      sort?: 'alpha' | 'time' | 'spice';
      cuisine?: string;
      ingredients?: string[];
    } = {
      interactive: options.interactive !== false,
    };

    if (options.sort) {
      const sortMap: Record<string, 'alpha' | 'time' | 'spice'> = {
        alpha: 'alpha',
        time: 'time',
        spice: 'spice',
      };
      if (sortMap[options.sort]) {
        opts.sort = sortMap[options.sort];
      }
    }

    if (options.cuisine) {
      opts.cuisine = options.cuisine;
    }

    if (options.ingredients) {
      opts.ingredients = options.ingredients.split(',').map((i: string) => i.trim().toLowerCase());
    }

    await listCommand(opts);
  });

program
  .command('random')
  .alias('rand')
  .description('Pick a random recipe')
  .option('-c, --cuisine <cuisine>', 'Filter by cuisine')
  .option('-m, --meal-type <type>', 'Filter by meal type (breakfast, lunch, dinner, snack, dessert)')
  .option('--no-interactive', 'Skip interactive prompts and use only CLI options')
  .action(async (options) => {
    const opts: {
      interactive?: boolean;
      cuisine?: string;
      mealType?: string;
    } = {
      interactive: options.interactive !== false,
      cuisine: options.cuisine,
      mealType: options.mealType,
    };

    await randomCommand(opts);
  });

program.parse();
