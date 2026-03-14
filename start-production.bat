@echo off
REM ============================================
REM LMS Production Startup Script
REM ============================================
cd /d "%~dp0"

echo ============================================
echo    LMS Production Startup
echo ============================================
echo.

REM --- START POSTGRESQL (DOCKER) ---
echo [1/3] Menjalankan PostgreSQL via Docker...
docker compose up -d >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Gagal menjalankan Docker. Pastikan Docker Desktop sudah terbuka.
    pause
    exit /b 1
)
echo     Menunggu PostgreSQL siap...
:WAIT_PG
timeout /t 2 /nobreak >nul
powershell -NoProfile -Command "try { $t = New-Object Net.Sockets.TcpClient('localhost',5433); $t.Close(); exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% NEQ 0 goto WAIT_PG
echo     OK - PostgreSQL berjalan di port 5433.
echo.

REM --- START API ---
echo [2/3] Menjalankan API (NestJS - port 3001)...
start "LMS - API" cmd /k "cd /d "%~dp0apps\api" && copy /Y .env.production .env >nul && npm run start:prod"
echo     API sedang starting di http://localhost:3001
echo     (tunggu ~5 detik sampai siap)
echo.
timeout /t 5 /nobreak >nul

REM --- START FRONTEND ---
echo [3/3] Menjalankan Frontend (Next.js - port 3000)...
start "LMS - Frontend" cmd /k "cd /d "%~dp0apps\front" && npm run start"
echo     Frontend sedang starting di http://localhost:3000
echo.
timeout /t 3 /nobreak >nul

echo ============================================
echo  Semua service berhasil dijalankan!
echo.
echo  Lokal  : http://localhost:3000
echo  LAN    : http://192.168.1.11:3000
echo  Online : https://lms.smkpgribanyuputih.cloud
echo ============================================
echo.
pause
