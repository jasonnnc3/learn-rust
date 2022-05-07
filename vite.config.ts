import { defineConfig } from 'vite';
import { resolve } from 'path';

const VITE_DEV_SERVER_PORT = process.env.VITE_DEV_SERVER_PORT ? parseInt(process.env.VITE_DEV_SERVER_PORT) : null;

if (!VITE_DEV_SERVER_PORT) {
  console.error('VITE_DEV_SERVER_PORT is not defined. Did you run the server with `make -j dev`?');
  process.exit(1);
}

// https://vitejs.dev/config/
export default defineConfig({
  clearScreen: false,
  server: {
    port: VITE_DEV_SERVER_PORT,
  },
  resolve: {
    alias: {
      client: resolve(__dirname, 'client'),
    },
  },
});
