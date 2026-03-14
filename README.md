# OpenClaw Tools

Useful scripts and tools for OpenClaw users, built from real-world experience.

## Scripts

### migrate-wsl-to-d.ps1
Safely migrates your WSL Ubuntu installation from C: drive to D: drive.

**Features:**
- Pre-flight disk space check
- Backs up OpenClaw config before shutdown
- Verifies export size before any destructive steps
- Requires YES confirmation before unregistering
- Sets default user after import
- Shows gateway restart and config restore instructions

**Usage:**
```powershell
powershell -ExecutionPolicy Bypass -File migrate-wsl-to-d.ps1
```

Read the [full migration story on r/openclaw](https://www.reddit.com/r/openclaw).

---
More tools coming. Built by [BuzzRanchBoss](https://github.com/buzzranchboss).
