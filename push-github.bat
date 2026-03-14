@echo off
chcp 65001 >nul
title Push ke GitHub - LMS Rizky

echo ============================================
echo        PUSH KE GITHUB - LMS Rizky
echo   https://github.com/rizkylutfi07/lms-rizky2
echo ============================================
echo.

cd /d "C:\Users\rizky\Desktop\lms-rizky2"

echo [1] Cek status perubahan...
echo.
git status
echo.

echo ============================================
set /p LANJUT=Ada perubahan di atas? Lanjut push? (y/n): 
if /i "%LANJUT%" neq "y" (
    echo Dibatalkan.
    pause
    exit /b
)

echo.
echo [2] Menambahkan semua perubahan...
git add .
echo.

echo [3] Masukkan pesan commit:
echo     Contoh: fix: perbaiki deteksi floating window
echo             feat: tambah fitur baru
echo.
set /p PESAN=Pesan commit: 

if "%PESAN%"=="" (
    echo Pesan commit tidak boleh kosong!
    pause
    exit /b
)

echo.
echo [4] Membuat commit...
git commit -m "%PESAN%"
echo.

echo [5] Push ke GitHub (branch: main)...
git push origin main
echo.

if %ERRORLEVEL% equ 0 (
    echo ============================================
    echo   BERHASIL! Kode sudah di-push ke GitHub.
    echo   https://github.com/rizkylutfi07/lms-rizky2
    echo ============================================
) else (
    echo ============================================
    echo   GAGAL push. Kemungkinan penyebab:
    echo   - Belum login GitHub (cek credential)
    echo   - Ada konflik, jalankan: git pull origin main
    echo ============================================
)

echo.
pause
