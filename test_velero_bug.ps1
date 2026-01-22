# 1. Check for secret file
if (!(Test-Path "fake-credentials")) {
    New-Item fake-credentials -ItemType File
}

# 2. Start Velero install test
Write-Host "--- TEST START: BUG #3861 ---"
.\velero.exe install `
  --provider aws `
  --plugins velero/velero-plugin-for-aws:v1.10.1 `
  --bucket bucket-not-found `
  --secret-file ./fake-credentials `
  --use-volume-snapshots=false `
  --wait

# 3. Final message
Write-Host "--- TEST FINISHED ---"