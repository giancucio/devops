Write-Host "Running local validation checks..."

if (Get-Command terraform -ErrorAction SilentlyContinue) {
  Write-Host "Running terraform fmt..."
  Get-ChildItem -Recurse -Filter *.tf | ForEach-Object { terraform fmt $_.FullName -check }
} else {
  Write-Host "Terraform not installed, skipping terraform checks."
}

Write-Host "Check shell scripts with shellcheck (if installed)."
