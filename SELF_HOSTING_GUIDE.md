# Self-Hosting LMS dengan Cloudflare Tunnel

Panduan lengkap untuk hosting LMS dari komputer lokal menggunakan Cloudflare Tunnel.

## Prerequisites

- [x] Windows 10/11
- [x] Node.js >= 18
- [x] PostgreSQL running di port 5433
- [ ] Domain yang sudah terdaftar di Cloudflare
- [ ] Akun Cloudflare (gratis)

---

## 🚀 Langkah 1: Buat Tunnel di Cloudflare Dashboard

> **💡 Tips**: Cara ini lebih mudah daripada pakai command line!

1. Buka **Cloudflare Dashboard** → https://one.dash.cloudflare.com/
2. Di sidebar kiri, pilih **Networks** → **Tunnels**
3. Klik tombol **Create a tunnel**
4. Pilih **Cloudflared** sebagai connector type
5. Beri nama tunnel (contoh: `lms-tunnel`) → Klik **Save tunnel**

---

## 🖥️ Langkah 2: Install Connector di Windows

Setelah tunnel dibuat, Cloudflare akan menampilkan perintah untuk install connector.

### Pilihan A: Install sebagai Service (Recommended)
1. **Buka PowerShell sebagai Administrator**
2. Copy dan paste perintah yang ditampilkan, contohnya seperti:
   ```powershell
   winget install --id Cloudflare.cloudflared
   cloudflared.exe service install <TOKEN_ANDA>
   ```
   > ⚠️ Gunakan token yang ditampilkan di dashboard Anda, jangan copy contoh ini!

3. Tunggu hingga status tunnel berubah menjadi **HEALTHY** ✅

### Pilihan B: Download Manual (Jika winget tidak tersedia)
1. Download dari: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/
2. Jalankan perintah yang ditampilkan di dashboard

---

## 🌐 Langkah 3: Konfigurasi Public Hostname

Setelah connector terinstall dan status **HEALTHY**:

1. Klik **Next** untuk melanjutkan ke konfigurasi hostname
2. Tambahkan hostname untuk **Frontend**:
   | Field | Value |
   |-------|-------|
   | Subdomain | `lms` |
   | Domain | pilih domain Anda (contoh: `smkpgribanyuputih.cloud`) |
   | Type | `HTTP` |
   | URL | `localhost:3000` |
   
3. Klik **Add a public hostname** untuk menambah hostname **API**:
   | Field | Value |
   |-------|-------|
   | Subdomain | `api` |
   | Domain | pilih domain Anda (contoh: `smkpgribanyuputih.cloud`) |
   | Type | `HTTP` |
   | URL | `localhost:3001` |

4. Klik **Save tunnel**

> 📝 DNS akan otomatis ditambahkan oleh Cloudflare!

---

## ⚙️ Langkah 4: Setup Environment Production

### 4.1 API (apps/api)

Edit file `apps/api/.env.production`:
```env
DATABASE_URL="postgresql://postgres:postgres@localhost:5433/belajar?schema=public"
PORT=3001
FRONTEND_ORIGIN=https://localhost
JWT_SECRET=GANTI-DENGAN-SECRET-YANG-AMAN-MINIMAL-32-KARAKTER
JWT_EXPIRES_IN=2d
```

> ⚠️ **PENTING**: Ganti `JWT_SECRET` dengan nilai random yang aman!

### 4.2 Frontend (apps/front)

```powershell
cd apps\front
copy .env.production.example .env.production
```

Edit `.env.production` dan sesuaikan URL API jika perlu.

---

## 🏃 Langkah 5: Build & Run

### Cara Cepat (Recommended)
```powershell
.\start-production.bat
```

### Cara Manual

**Terminal 1 - Build & Start API:**
```powershell
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

> 💡 Tunnel sudah berjalan otomatis sebagai Windows Service (jika pakai Pilihan A di Langkah 2)

---

## ✅ Langkah 6: Verifikasi

1. Buka browser dan akses:
   - Frontend: https://localhost
   - API: https://localhost:3001

2. Test login dengan akun yang sudah ada

3. Verifikasi semua fitur berjalan normal

---

## 🛠️ Troubleshooting

### Tunnel tidak HEALTHY
- Cek apakah cloudflared service berjalan: `Get-Service cloudflared`
- Restart service: `Restart-Service cloudflared`

### Error: CORS blocked
- Pastikan domain sudah ditambahkan di `main.ts` bagian CORS
- Restart API setelah perubahan

### Error: Connection refused
- Pastikan PostgreSQL berjalan: `pg_isready -h localhost -p 5433`
- Pastikan API (port 3001) dan Frontend (port 3000) sudah running

### Error: 502 Bad Gateway
- URL di Cloudflare Tunnel salah (cek localhost:3000 dan localhost:3001)
- Aplikasi belum running

### Website tidak bisa diakses
- Tunggu 2-5 menit untuk propagasi DNS
- Cek status tunnel di Cloudflare Dashboard → Networks → Tunnels

---

## 📁 File yang Dibuat

| File | Deskripsi |
|------|-----------|
| `apps/api/.env.production` | Environment production untuk API |
| `apps/front/.env.production.example` | Template environment untuk frontend |
| `start-production.bat` | Script untuk memulai semua service |
| `SELF_HOSTING_GUIDE.md` | Dokumentasi ini |

---

## 🔧 Mengelola Tunnel

### Cek Status Tunnel
```powershell
Get-Service cloudflared
cloudflared tunnel list
```

### Restart Tunnel
```powershell
Restart-Service cloudflared
```

### Hapus Tunnel
Hapus dari Cloudflare Dashboard → Networks → Tunnels → pilih tunnel → Delete
