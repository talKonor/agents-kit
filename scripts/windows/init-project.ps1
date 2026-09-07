param(
  [Parameter(Mandatory=$true)][string]$ProjectDir,
  [switch]$InstallClaudeSettings,
  [switch]$ForceClaudeSettings,
  [switch]$NoGitHooks
)
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$KitRoot = Resolve-Path (Join-Path $ScriptDir "..\..")
$ProjectDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($ProjectDir)
if (!(Test-Path $ProjectDir -PathType Container)) { throw "Project directory does not exist: $ProjectDir" }

New-Item -ItemType Directory -Force -Path (Join-Path $ProjectDir ".ai\artifacts") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $ProjectDir ".claude") | Out-Null

$claudeMd = Join-Path $ProjectDir "CLAUDE.md"
if (!(Test-Path $claudeMd)) {
  Copy-Item (Join-Path $KitRoot "CLAUDE.md") $claudeMd
  Write-Host "init-project: created CLAUDE.md"
} else { Write-Host "init-project: CLAUDE.md already exists" }

$settingsExample = Join-Path $ProjectDir ".claude\settings.ai-production-kit.example.json"
Copy-Item (Join-Path $KitRoot ".claude\settings.example.json") $settingsExample -Force
Write-Host "init-project: wrote .claude/settings.ai-production-kit.example.json"

$settingsJson = Join-Path $ProjectDir ".claude\settings.json"
if ($ForceClaudeSettings -or ($InstallClaudeSettings -and !(Test-Path $settingsJson))) {
  Copy-Item $settingsExample $settingsJson -Force
  Write-Host "init-project: installed .claude/settings.json"
}

if (!$NoGitHooks -and (Test-Path (Join-Path $ProjectDir ".git"))) {
  $hookDir = Join-Path $ProjectDir ".git\hooks"
  New-Item -ItemType Directory -Force -Path $hookDir | Out-Null
  $preCommit = Join-Path $hookDir "pre-commit"
  $content = @"
#!/usr/bin/env bash
set -e
KIT_ROOT=\"$KitRoot\"
bash \"\$KIT_ROOT/hooks/check-secrets.sh\"
ENFORCE=0 bash \"\$KIT_ROOT/hooks/require-tests-after-code-change.sh\"
ENFORCE=0 bash \"\$KIT_ROOT/hooks/require-migration-rollback.sh\"
"@
  Set-Content -Path $preCommit -Value $content -NoNewline
  Write-Host "init-project: installed .git/hooks/pre-commit"
}
Write-Host "init-project: done"
