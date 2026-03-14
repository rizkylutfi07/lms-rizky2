# Panduan Push ke GitHub

**Repository:** https://github.com/rizkylutfi07/lms-rizky2  
**Branch utama:** `main`

---

## Cara Cepat (Pakai File .bat)

Klik dua kali file **`push-github.bat`** di folder ini, lalu ikuti instruksinya.

---

## Cara Manual (Command Line)

### 1. Buka terminal di folder project
```
cd C:\Users\rizky\Desktop\lms-rizky2
```

### 2. Cek status perubahan
```
git status
```

### 3. Tambahkan semua perubahan
```
git add .
```
Atau tambahkan file tertentu saja:
```
git add apps/front/app/...
```

### 4. Commit dengan pesan deskriptif
```
git commit -m "feat: tambahkan deteksi floating window anti-cheat"
```

### 5. Push ke GitHub
```
git push origin main
```

---

## Contoh Pesan Commit yang Baik

| Prefix | Digunakan untuk |
|--------|----------------|
| `feat:` | Fitur baru |
| `fix:` | Perbaikan bug |
| `chore:` | Update konfigurasi/dependency |
| `refactor:` | Refactor kode (tanpa fitur baru) |
| `docs:` | Update dokumentasi |

Contoh:
```
git commit -m "fix: perbaiki deteksi floating window di Android"
git commit -m "feat: tambah fitur kelompok soal (wacana referensi)"
git commit -m "chore: update NEXT_PUBLIC_API_URL untuk akses LAN"
```

---

## Jika Ada Konflik

```
git pull origin main --rebase
# selesaikan konflik, lalu:
git add .
git rebase --continue
git push origin main
```

---

## Cek Riwayat Commit

```
git log --oneline -10
```

---

## File yang Sebaiknya TIDAK di-push (.gitignore)

Pastikan file-file ini ada di `.gitignore`:
- `node_modules/`
- `.env.local`
- `.env`
- `apps/api/uploads/`
- `.next/`
- `dist/`
