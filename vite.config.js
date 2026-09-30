import {defineConfig} from 'vite';
export default defineConfig({
 base:'./',
 server:{host:'127.0.0.1',port:5173,strictPort:true,fs:{deny:['**/.git/**','**/original/**','**/analysis/**','**/reference/**','**/.env*']}},
 build:{rollupOptions:{output:{manualChunks:{three:['three']}}}}
});
