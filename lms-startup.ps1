# ============================================================
#  LMS Auto-Startup Script (dijalankan via Task Scheduler)
#  Urutan: Docker → tunggu PostgreSQL → PM2 resurrect
# ============================================================

$logFile = "C:\Users\rizky\Desktop\lms-rizky2\logs\startup.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

function Log($msg) {
    $line = "[$timestamp] $msg"
    Write-Output $line
    Add-Content -Path $logFile -Value $line
}

Log "=== LMS Startup dimulai ==="

# --- 1. Pastikan folder logs ada ---
$logsDir = "C:\Users\rizky\Desktop\lms-rizky2\logs"
if (-not (Test-Path $logsDir)) { New-Item -ItemType Directory -Path $logsDir | Out-Null }

# --- 2. Tunggu Docker Desktop siap (max 120 detik) ---
Log "Menunggu Docker Desktop siap..."
$dockerWait = 0
while ($dockerWait -lt 120) {
    $result = & docker info 2>&1
    if ($LASTEXITCODE -eq 0) {
        Log "Docker siap."
        break
    }
    Start-Sleep -Seconds 3
    $dockerWait += 3
}
if ($dockerWait -ge 120) {
    Log "TIMEOUT: Docker tidak siap dalam 120 detik."
    exit 1
}

# --- 3. Jalankan Docker Compose (PostgreSQL) ---
Log "Menjalankan PostgreSQL via Docker Compose..."
Set-Location "C:\Users\rizky\Desktop\lms-rizky2"
& docker compose up -d 2>&1 | ForEach-Object { Log $_ }

# --- 4. Tunggu PostgreSQL siap di port 5433 ---
Log "Menunggu PostgreSQL siap di port 5433..."
$pgWait = 0
while ($pgWait -lt 60) {
    try {
        $tcp = New-Object Net.Sockets.TcpClient
        $tcp.Connect("localhost", 5433)
        $tcp.Close()
        Log "PostgreSQL siap di port 5433."
        break
    } catch {
        Start-Sleep -Seconds 2
        $pgWait += 2
    }
}
if ($pgWait -ge 60) {
    Log "TIMEOUT: PostgreSQL tidak siap dalam 60 detik."
}

# --- 5. Tambahan delay agar PG benar-benar siap menerima koneksi ---
Start-Sleep -Seconds 5

# --- 6. Resurrect PM2 (jalankan kembali semua proses yang tersimpan) ---
Log "Menjalankan PM2 resurrect..."
$npmPath = (Get-Command node -ErrorAction SilentlyContinue).Source
if ($npmPath) {
    $nodeDir = Split-Path $npmPath
    $env:PATH = "$nodeDir;$env:PATH"
}

& pm2 resurrect 2>&1 | ForEach-Object { Log $_ }
Start-Sleep -Seconds 3

# Verifikasi
$pm2Status = & pm2 jlist 2>&1 | ConvertFrom-Json
$running = ($pm2Status | Where-Object { $_.pm2_env.status -eq "online" }).Count
Log "PM2 proses online: $running"
Log "=== LMS Startup selesai ==="
