import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.tsx'],
  format: ['esm'],
  outDir: 'dist',
  clean: true,
  bundle: true,
  platform: 'node',
  target: 'node20',
  external: ['react-devtools-core'],
  splitting: false,
  onSuccess: async () => {
    const fs = await import('fs');
    const path = await import('path');
    const filePath = path.join(process.cwd(), 'dist', 'index.js');
    const content = fs.readFileSync(filePath, 'utf-8');
    if (!content.startsWith('#!')) {
      fs.writeFileSync(filePath, '#!/usr/bin/env node\n' + content);
      fs.chmodSync(filePath, 0o755);
    }
  },
});