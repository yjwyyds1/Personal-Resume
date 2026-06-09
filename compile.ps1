# ============================================================
# Resume PDF Generator
# Usage:
#   .\compile.ps1           →  compile once (resume.pdf)
#   .\compile.ps1 -Watch    →  watch mode, recompile on change
# ============================================================
param([switch]$Watch)

$ErrorActionPreference = "Stop"

# Check if Typst is installed
$typst = Get-Command typst -ErrorAction SilentlyContinue
if (-not $typst) {
  Write-Host "Typst is not installed." -ForegroundColor Yellow
  Write-Host ""
  Write-Host "Install options:" -ForegroundColor Cyan
  Write-Host "  winget install Typst.Typst"
  Write-Host "  scoop install typst"
  Write-Host "  Download from: https://github.com/typst/typst/releases"
  Write-Host ""
  Write-Host "After installation, reopen your terminal and run this script again."
  exit 1
}

Write-Host "Typst version: $(typst --version)" -ForegroundColor Green

# Ensure resume.typ exists (copy from example template if not)
if (-not (Test-Path -LiteralPath "resume.typ")) {
  Write-Host "resume.typ not found. Copying from resume.example.typ ..." -ForegroundColor Yellow
  Copy-Item -LiteralPath "resume.example.typ" -Destination "resume.typ"
  Write-Host "Edit resume.typ with your personal info, then re-run this script." -ForegroundColor Cyan
  exit 0
}

if ($Watch) {
  Write-Host "Watching for changes... (Ctrl+C to stop)" -ForegroundColor Cyan
  typst watch resume.typ resume.pdf
}
else {
  Write-Host "Compiling resume.typ → resume.pdf ..." -ForegroundColor Cyan
  typst compile resume.typ resume.pdf
  if ($LASTEXITCODE -eq 0) {
    Write-Host "Done: resume.pdf" -ForegroundColor Green
  }
}
