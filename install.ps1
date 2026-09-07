param(
  [switch]$Global = $true,
  [string]$Prefix = "$env:USERPROFILE\.claude\company-ai-production-kit",
  [string]$BinDir = "$env:USERPROFILE\bin",
  [switch]$NoLaunchers
)
$ErrorActionPreference = "Stop"
$Source = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Item -ItemType Directory -Force -Path $Prefix | Out-Null
New-Item -ItemType Directory -Force -Path $BinDir | Out-Null

if ((Resolve-Path $Prefix).Path -ne (Resolve-Path $Source).Path) {
  if (Test-Path $Prefix) { Remove-Item -Recurse -Force $Prefix }
  Copy-Item -Recurse -Force $Source $Prefix
}

if (!$NoLaunchers) {
  $launcherSource = Join-Path $Prefix "launchers\windows"
  Get-ChildItem $launcherSource -Filter "launch-*-agent.ps1" | ForEach-Object {
    Copy-Item $_.FullName (Join-Path $BinDir $_.Name) -Force
  }
  Write-Host "install: Windows launchers installed in $BinDir"
  Write-Host "install: add this folder to PATH if needed."
}
Write-Host "install: global kit installed at $Prefix"
Write-Host "install: try: launch-backend-engineer-agent.ps1"
