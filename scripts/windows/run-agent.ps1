param(
  [Parameter(Mandatory=$true)][string]$AgentName,
  [string]$Workdir,
  [switch]$NoInit,
  [switch]$InstallSettings,
  [switch]$Help
)

if ($Help) {
  Write-Host "Usage: run-agent.ps1 -AgentName <agent-file-name> [-Workdir <dir>] [-NoInit] [-InstallSettings]"
  exit 0
}

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$KitRoot = Resolve-Path (Join-Path $ScriptDir "..\..")
$AgentFile = Join-Path $KitRoot "agents\$AgentName.md"

if (!(Test-Path $AgentFile)) {
  Write-Error "run-agent: unknown agent: $AgentName. Expected file: $AgentFile"
  exit 1
}

if ([string]::IsNullOrWhiteSpace($Workdir)) {
  $defaultDir = (Get-Location).Path
  $answer = Read-Host "Working directory for $AgentName [$defaultDir]"
  if ([string]::IsNullOrWhiteSpace($answer)) { $Workdir = $defaultDir } else { $Workdir = $answer }
}

$expanded = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Workdir)
if (!(Test-Path $expanded -PathType Container)) {
  Write-Error "run-agent: directory does not exist: $expanded"
  exit 1
}
$Workdir = (Resolve-Path $expanded).Path

$missing = @()
if (!(Test-Path (Join-Path $Workdir "CLAUDE.md"))) { $missing += "CLAUDE.md" }
if (!(Test-Path (Join-Path $Workdir ".ai\artifacts"))) { $missing += ".ai/artifacts/" }
if (!(Test-Path (Join-Path $Workdir ".claude\settings.ai-production-kit.example.json")) -and !(Test-Path (Join-Path $Workdir ".claude\settings.json"))) { $missing += ".claude/settings.ai-production-kit.example.json" }

if ($missing.Count -gt 0) {
  Write-Host "run-agent: project setup is incomplete in $Workdir"
  foreach ($m in $missing) { Write-Host "  - missing $m" }
  if (!$NoInit) {
    $initAnswer = Read-Host "Initialize this folder with minimal AI production kit project setup now? [y/N]"
    if ($initAnswer -match '^(y|yes)$') {
      $initScript = Join-Path $KitRoot "scripts\windows\init-project.ps1"
      if (Test-Path $initScript) {
        if ($InstallSettings) { & $initScript -ProjectDir $Workdir -InstallClaudeSettings } else { & $initScript -ProjectDir $Workdir }
      } else {
        Write-Warning "Windows init-project.ps1 not found; continuing without initialization"
      }
    } else {
      Write-Host "run-agent: continuing without initialization"
    }
  }
}

if (!(Test-Path (Join-Path $Workdir "CLAUDE.md"))) {
  Write-Warning "no CLAUDE.md found in target folder; project rules may not be loaded"
}

$gitCheck = $false
try { Push-Location $Workdir; git rev-parse --is-inside-work-tree *> $null; if ($LASTEXITCODE -eq 0) { $gitCheck = $true } } catch {} finally { Pop-Location }
if (!$gitCheck) { Write-Warning "target folder is not a Git repository; Git/GitHub workflow features may not work" }

if (!(Get-Command claude -ErrorAction SilentlyContinue)) {
  Write-Error "Claude Code CLI 'claude' was not found in PATH"
  exit 1
}

$bootstrap = @"
You are starting an interactive role-specific Claude Code session.

Role agent: $AgentName
Agent definition file: $AgentFile
Company kit root: $KitRoot
Working directory: $Workdir

First, read and follow the agent definition file. Also follow CLAUDE.md in the working directory when present. Use company skills, templates, and workflows from the kit root when useful:
- $KitRoot\skills
- $KitRoot\templates
- $KitRoot\workflows

Important operating model:
- The human owns judgment and approval.
- You produce artifacts and execution work.
- Do not expand scope without approval.
- Never reveal secrets or credentials.
- Use .ai/artifacts/<task-id>/ for durable workflow artifacts.
- If this task belongs to another agent, say which agent is more appropriate and why.

Start by briefly stating that you are ready in this role and ask for the task or task id.
"@

Set-Location $Workdir
claude $bootstrap
