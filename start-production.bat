@echo off
REM ============================================
REM LMS Production Startup Script
REM ============================================
REM This script starts all services needed for production

echo ============================================
echo    LMS Self-Hosting Production Startup
echo ============================================
echo.

REM Check if PostgreSQL is running
echo [1/4] Checking PostgreSQL...
pg_isready -h localhost -p 5433 >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: PostgreSQL is not running on port 5433!
    echo Please start PostgreSQL first.
    pause
    exit /b 1
)
echo PostgreSQL is running.
echo.

REM Navigate to project directory
cd /d "%~dp0"

REM Build the project
echo [2/4] Building project...
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)
echo Build completed successfully.
echo.

REM Start API in a new window
echo [3/4] Starting NestJS API...
start "LMS API" cmd /c "cd apps\api && copy /Y .env.production .env && npm run start:prod"
timeout /t 5 /nobreak >nul
echo API started on http://localhost:3001
echo.

REM Start Frontend in a new window
echo [4/4] Starting Next.js Frontend...
start "LMS Frontend" cmd /c "cd apps\front && copy .env.production.example .env.production 2>nul && npm run start"
timeout /t 5 /nobreak >nul
echo Frontend started on http://localhost:3000
echo.

echo ============================================
echo All services started successfully!
echo.
echo Next steps:
echo 1. Start Cloudflare Tunnel in a new terminal:
echo    cloudflared tunnel run lms-tunnel
echo.
echo 2. Access your site at:
echo    https://localhost
echo ============================================
echo.
echo Press any key to exit this window...
pause >nul
