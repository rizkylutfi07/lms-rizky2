@echo off
cd /d "%~dp0apps\api"
npm run prisma:studio
pause
