Perfect! Aplikasi sudah berjalan di background!

# Cek status
sudo systemctl status lms

# Lihat log real-time
journalctl -u lms -f

# Lihat log tersimpan
tail -f ~/Desktop/lms-rizky-main/lms.log

# Restart service
sudo systemctl restart lms

# Stop service
sudo systemctl stop lms

# Disable auto-start (jika mau)
sudo systemctl disable lms


✅ Status Service:
Frontend: Running di http://localhost:3000
API: Running di http://localhost:3001
Status: Active (running) dengan 84 tasks
Auto-start: Enabled ✅
Perintah Penting:
Sekarang aplikasi akan otomatis jalan setiap kali komputer boot! 🎉

Tidak perlu buka terminal lagi, tinggal restart komputer dan LMS sudah running sendiri di background.