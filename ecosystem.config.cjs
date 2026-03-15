const path = require('path');
const ROOT = __dirname;

module.exports = {
  apps: [
    {
      name: 'lms-api',
      cwd: path.join(ROOT, 'apps', 'api'),
      script: 'dist/src/main.js',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      restart_delay: 8000,   // tunggu 8 detik sebelum restart (beri waktu Docker/PG ready)
      max_restarts: 30,
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      out_file: path.join(ROOT, 'logs', 'api-out.log'),
      error_file: path.join(ROOT, 'logs', 'api-error.log'),
    },
    {
      name: 'lms-frontend',
      cwd: path.join(ROOT, 'apps', 'front'),
      script: 'node_modules/next/dist/bin/next',
      args: 'start',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      restart_delay: 5000,
      max_restarts: 20,
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      out_file: path.join(ROOT, 'logs', 'front-out.log'),
      error_file: path.join(ROOT, 'logs', 'front-error.log'),
    },
  ],
};
