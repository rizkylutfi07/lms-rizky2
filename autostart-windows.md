# Auto-Start LMS di Windows

Panduan agar LMS berjalan otomatis setiap kali Windows dinyalakan — tanpa perlu buka terminal.

---

## Cara Kerja

| Komponen | Cara Auto-Start |
|---|---|
| PostgreSQL (Docker) | `restart: unless-stopped` → auto-start bersama Docker Desktop |
| Docker Desktop | Setting bawaan Windows: *Start on login* |
| API (NestJS) | PM2 — di-*resurrect* otomatis saat login |
| Frontend (Next.js) | PM2 — di-*resurrect* otomatis saat login |

---

## Setup (Lakukan Sekali Saja)

### Langkah 1 — Jalankan Script Setup

> **Klik kanan** `setup-autostart.bat` → **Run as administrator**

Script ini akan:
- Install PM2 + pm2-windows-startup secara global
- Daftarkan PM2 ke Windows startup
- Siapkan file `.env` untuk API
- Mulai semua service lewat PM2
- Simpan state PM2 agar restore otomatis saat boot

### Langkah 2 — Aktifkan Docker Desktop Auto-Start (Manual)

1. Buka **Docker Desktop**
2. Klik ikon Docker di system tray (pojok kanan bawah)
3. Pilih **Settings** → **General**
4. Centang: ✅ **"Start Docker Desktop when you log in"**
5. Klik **Apply & Restart**

---

## Perintah Harian

```bash
# Lihat status semua service
pm2 status

# Lihat log real-time
pm2 logs

# Lihat log API saja
pm2 logs lms-api

# Lihat log Frontend saja
pm2 logs lms-frontend

# Restart semua
pm2 restart all

# Restart hanya API
pm2 restart lms-api

# Stop semua
pm2 stop all

# Start ulang semua
pm2 start ecosystem.config.cjs
pm2 save
```

---

## Log Files

Log tersimpan otomatis di folder `logs/` di root project:

| File | Isi |
|---|---|
| `logs/api-out.log` | Output normal API |
| `logs/api-error.log` | Error API |
| `logs/front-out.log` | Output normal Frontend |
| `logs/front-error.log` | Error Frontend |

---

## Troubleshooting

### API tidak bisa connect ke database saat startup

**Normal** — API mungkin start lebih awal dari Docker selesai ready. PM2 sudah dikonfigurasi untuk retry otomatis (`max_restarts: 30`, `restart_delay: 8s`). Tunggu 1-2 menit, API akan connect sendiri.

### pm2 tidak dikenali di terminal

Buka terminal baru atau restart terminal. Jika masih gagal:
```bash
npm install -g pm2 pm2-windows-startup
pm2-startup install
```

### Aplikasi tidak jalan setelah restart Windows

Pastikan:
1. Docker Desktop sudah setting auto-start (Langkah 2 di atas)
2. PM2 state sudah disimpan: `pm2 save`
3. pm2-windows-startup sudah terpasang: `pm2-startup install`

### Ingin Non-aktifkan Auto-Start

```bash
# Hapus dari startup Windows
pm2-startup uninstall

# Atau stop semua service
pm2 stop all
pm2 save
```

---

## Akses Aplikasi

| Tujuan | URL |
|---|---|
| Lokal | http://localhost:3000 |
| Dari perangkat lain (LAN) | http://192.168.1.11:3000 |
| Online | https://lms.smkpgribanyuputih.cloud |
