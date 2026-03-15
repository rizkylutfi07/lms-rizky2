@echo off
REM ================================================================
REM  LMS - Setup Auto-Start di Windows (JALANKAN SEKALI SAJA)
REM  Setelah ini, aplikasi otomatis jalan setiap kali Windows nyala
REM ================================================================
cd /d "%~dp0"

echo ================================================================
echo    LMS - Setup Auto-Start Windows
echo ================================================================
echo.

REM --- 1. Cek Node.js ---
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js tidak ditemukan! Install Node.js dulu.
    pause
    exit /b 1
)
echo [OK] Node.js ditemukan.

REM --- 2. Cek Docker ---
where docker >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Docker tidak ditemukan! Install Docker Desktop dulu.
    pause
    exit /b 1
)
echo [OK] Docker ditemukan.

REM --- 3. Install PM2 dan pm2-windows-startup ---
echo.
echo [1/5] Menginstall PM2 (process manager)...
call npm install -g pm2 pm2-windows-startup
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Gagal install PM2!
    pause
    exit /b 1
)
echo [OK] PM2 berhasil diinstall.

REM --- 4. Daftarkan PM2 ke Windows Startup ---
echo.
echo [2/5] Mendaftarkan PM2 ke Windows Startup...
call pm2-startup install
echo [OK] PM2 terdaftar di startup Windows.

REM --- 5. Salin file .env untuk API ---
echo.
echo [3/5] Menyiapkan file konfigurasi API...
if exist "apps\api\.env.production" (
    copy /Y "apps\api\.env.production" "apps\api\.env" >nul
    echo [OK] .env.production disalin ke .env
) else (
    echo [WARNING] File apps\api\.env.production tidak ditemukan, .env tetap dipakai.
)

REM --- 6. Buat folder logs ---
if not exist "logs" mkdir logs
echo [OK] Folder logs siap.

REM --- 7. Jalankan Docker (PostgreSQL) ---
echo.
echo [4/5] Menjalankan PostgreSQL via Docker...
docker compose up -d
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Gagal menjalankan Docker! Pastikan Docker Desktop sudah terbuka.
    pause
    exit /b 1
)

echo     Menunggu PostgreSQL siap (maks 60 detik)...
set /a ATTEMPTS=0
:WAIT_PG
set /a ATTEMPTS+=1
if %ATTEMPTS% GTR 30 (
    echo [WARNING] PostgreSQL belum merespons setelah 60 detik, lanjut saja...
    goto START_PM2
)
timeout /t 2 /nobreak >nul
powershell -NoProfile -Command "try { $t = New-Object Net.Sockets.TcpClient('localhost',5433); $t.Close(); exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% NEQ 0 goto WAIT_PG
echo [OK] PostgreSQL siap.

:START_PM2
REM --- 8. Jalankan aplikasi dengan PM2 ---
echo.
echo [5/5] Menjalankan aplikasi dengan PM2...
call pm2 start ecosystem.config.cjs
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Gagal menjalankan PM2!
    pause
    exit /b 1
)

REM --- 9. Simpan state PM2 (agar otomatis restore saat startup) ---
call pm2 save
echo [OK] State PM2 disimpan.

echo.
echo ================================================================
echo  SETUP SELESAI!
echo.
echo  Langkah terakhir yang WAJIB dilakukan manual:
echo.
echo  1. Buka Docker Desktop
echo  2. Klik ikon Docker di system tray (pojok kanan bawah)
echo  3. Pilih Settings ^> General
echo  4. Centang: "Start Docker Desktop when you log in"
echo  5. Klik Apply ^& Restart
echo.
echo  Setelah itu, setiap kali Windows nyala semua akan jalan otomatis!
echo.
echo  Cek status: pm2 status
echo  Lihat log : pm2 logs
echo  Stop semua: pm2 stop all
echo ================================================================
pause
