
npm run build
cd apps\api
copy .env.production .env
npm run start:prod
```

**Terminal 2 - Start Frontend:**
```powershell
cd apps\front
npm run start
```