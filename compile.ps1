# ============================================================
# Resume PDF Generator
# Usage:
#   .\compile.ps1                               →  compile resume.typ → resume.pdf
#   .\compile.ps1 -Watch                        →  watch mode for resume.typ
#   .\compile.ps1 -Template resume-zh.typ       →  compile Chinese resume
#   .\compile.ps1 -Template resume-zh.typ -Watch→  watch mode for Chinese resume
# ============================================================
param([switch]$Watch, [string]$Template = "resume.typ")

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

# Ensure source file exists (copy from example template if not)
if (-not (Test-Path -LiteralPath $Template)) {
  $example = $Template -replace '\.typ$', '.example.typ'
  if (Test-Path -LiteralPath $example) {
    Write-Host "$Template not found. Copying from $example ..." -ForegroundColor Yellow
    Copy-Item -LiteralPath $example -Destination $Template
    Write-Host "Edit $Template with your personal info, then re-run this script." -ForegroundColor Cyan
    exit 0
  }
  else {
    Write-Host "$Template not found and no example template available." -ForegroundColor Red
    exit 1
  }
}

if ($Watch) {
  Write-Host "Watching for changes... (Ctrl+C to stop)" -ForegroundColor Cyan
  typst watch $Template resume.pdf
}
else {
  Write-Host "Compiling $Template → resume.pdf ..." -ForegroundColor Cyan
  typst compile $Template resume.pdf
  if ($LASTEXITCODE -eq 0) {
    Write-Host "Done: resume.pdf" -ForegroundColor Green
  }
}
