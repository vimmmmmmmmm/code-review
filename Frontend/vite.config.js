import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,  // ✅ Expose frontend to local network
    port: 5173,  // ⚡ Change port if needed
  }
});
