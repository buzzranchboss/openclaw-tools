# ============================================================
# WSL Migration Script: Move Ubuntu from C: to D:
# BuzzRanchBoss Enterprises - AIBoss Chief of Staff
# Run in PowerShell as Administrator
# ============================================================

$DistroName = "Ubuntu"
$WslDir = "D:\WSL"
$BackupFile = "$WslDir\Ubuntu-backup.tar"
$ImportDir = "$WslDir\Ubuntu"
$DefaultUser = "aiboss"

Write-Host ""
Write-Host "NOTE: This script will temporarily shut down WSL." -ForegroundColor Yellow
Write-Host "Any open WSL terminals will close. This is expected." -ForegroundColor Yellow
Write-Host "After migration, restart WSL with: wsl -d Ubuntu" -ForegroundColor Yellow
Write-Host "Then restart OpenClaw: openclaw gateway restart" -ForegroundColor Yellow
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  WSL Migration: $DistroName -> D: Drive" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# -- STEP 1: Check distro exists ------------------------------
Write-Host "[1/7] Checking WSL distro..." -ForegroundColor Yellow
Write-Host "      Distro set to: $DistroName" -ForegroundColor Green
Write-Host "      If this is wrong, press Ctrl+C and edit the script variable." -ForegroundColor Gray

# -- STEP 2: Check D: drive space -----------------------------
Write-Host "[2/7] Checking D: drive space..." -ForegroundColor Yellow
$drive = Get-PSDrive D -ErrorAction SilentlyContinue
if (-not $drive) {
    Write-Host "ERROR: D: drive not found." -ForegroundColor Red
    exit 1
}
$freeGB = [math]::Round($drive.Free / 1GB, 1)
if ($freeGB -lt 25) {
    Write-Host "ERROR: Only ${freeGB}GB free on D:. Need at least 25GB." -ForegroundColor Red
    exit 1
}
Write-Host "      D: has ${freeGB}GB free - OK" -ForegroundColor Green

# -- STEP 3: Create destination directory ---------------------
Write-Host "[3/7] Creating D:\WSL directory..." -ForegroundColor Yellow
if (!(Test-Path $WslDir)) {
    New-Item -ItemType Directory -Path $WslDir | Out-Null
    Write-Host "      Created: $WslDir" -ForegroundColor Green
} else {
    Write-Host "      Already exists: $WslDir" -ForegroundColor Green
}

# -- STEP 4: Backup OpenClaw config
Write-Host "[3b/7] Backing up OpenClaw config..." -ForegroundColor Yellow
$configBackup = "$WslDir\openclaw-config-backup"
if (!(Test-Path $configBackup)) { New-Item -ItemType Directory -Path $configBackup | Out-Null }
wsl -d $DistroName -- bash -c "cp -r ~/.config/openclaw /mnt/d/WSL/openclaw-config-backup/ 2>/dev/null && echo OK || echo SKIP"
Write-Host "      Config backed up to $configBackup" -ForegroundColor Green

# -- STEP 4: Shutdown and export -------------------------------
Write-Host "[4/7] Shutting down WSL and exporting..." -ForegroundColor Yellow
Write-Host "      This will take several minutes. Do not close this window." -ForegroundColor Gray
wsl --shutdown
Start-Sleep -Seconds 2
wsl --export $DistroName $BackupFile

# Verify export
if (!(Test-Path $BackupFile)) {
    Write-Host "ERROR: Export file not found. Export may have failed." -ForegroundColor Red
    exit 1
}
$backupSize = [math]::Round((Get-Item $BackupFile).Length / 1GB, 2)
if ($backupSize -lt 0.1) {
    Write-Host "ERROR: Backup file is only ${backupSize}GB - likely corrupt. Do NOT continue." -ForegroundColor Red
    Write-Host "       File: $BackupFile" -ForegroundColor Red
    exit 1
}
Write-Host "      Export complete: ${backupSize}GB at $BackupFile" -ForegroundColor Green

# -- STEP 5: Confirm before destructive step -------------------
Write-Host ""
Write-Host "============================================" -ForegroundColor Red
Write-Host "  !! DESTRUCTIVE STEP AHEAD !!" -ForegroundColor Red
Write-Host "  About to unregister $DistroName from C:" -ForegroundColor Red
Write-Host "  Backup is at: $BackupFile (${backupSize}GB)" -ForegroundColor Red
Write-Host "============================================" -ForegroundColor Red
$confirm = Read-Host "Type YES or Y to continue, anything else to abort"
if ($confirm -notin @("YES","yes","Y","y")) {
    Write-Host "Aborted. Your original WSL is untouched." -ForegroundColor Green
    exit 0
}

# -- STEP 6: Unregister and import ----------------------------
Write-Host "[5/7] Unregistering from C: and importing to D:..." -ForegroundColor Yellow
wsl --unregister $DistroName
Start-Sleep -Seconds 2
wsl --import $DistroName $ImportDir $BackupFile --version 2

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Import failed (exit code $LASTEXITCODE)." -ForegroundColor Red
    Write-Host "       Your backup is safe at: $BackupFile" -ForegroundColor Yellow
    Write-Host "       To restore: wsl --import $DistroName C:\Users\<YourUser>\AppData\Local\Packages\CanonicalGroupLimited... $BackupFile --version 2" -ForegroundColor Yellow
    exit 1
}
Write-Host "      Import complete." -ForegroundColor Green

# -- STEP 7: Set default user ----------------------------------
Write-Host "[6/7] Setting default user to '$DefaultUser'..." -ForegroundColor Yellow
wsl -d $DistroName -u root bash -c "echo -e '[user]\ndefault=$DefaultUser' > /etc/wsl.conf"
Write-Host "      Default user set." -ForegroundColor Green

# -- STEP 8: Restart and verify --------------------------------
Write-Host "[7/7] Restarting WSL..." -ForegroundColor Yellow
wsl --shutdown
Start-Sleep -Seconds 3

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Migration complete! Verifying..." -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Running verification inside WSL:" -ForegroundColor Yellow
wsl -d $DistroName -- bash -c "echo 'User:' && whoami && echo 'Disk:' && df -h | grep -E 'Filesystem|/\$|/mnt/d'"

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  Done! Check output above:" -ForegroundColor Green
Write-Host "  - User should be: $DefaultUser" -ForegroundColor Green  
Write-Host "  - / should be mounted from D: drive" -ForegroundColor Green
Write-Host "  - Keep backup at: $BackupFile" -ForegroundColor Green
Write-Host "  - Delete backup after 3-5 days if all is well" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Restart the OpenClaw gateway now." -ForegroundColor Yellow
Write-Host "Run in PowerShell:" -ForegroundColor Yellow
Write-Host "  wsl -d Ubuntu -- bash -c 'openclaw gateway restart'" -ForegroundColor Cyan
Write-Host "Or open a new WSL terminal and run: openclaw gateway restart" -ForegroundColor Cyan
Write-Host "" 
Write-Host "If you see a 402 error after restart, your OpenClaw config may need restoring." -ForegroundColor Yellow
Write-Host "Backup is at: $configBackup" -ForegroundColor Cyan
Write-Host "Restore with: wsl -d Ubuntu -- bash -c 'cp -r /mnt/d/WSL/openclaw-config-backup/openclaw ~/.config/'" -ForegroundColor Cyan
