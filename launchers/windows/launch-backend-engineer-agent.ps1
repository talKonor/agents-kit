param(
  [string]$Workdir,
  [switch]$NoInit,
  [switch]$InstallSettings,
  [switch]$Help
)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$KitRoot = Resolve-Path (Join-Path $ScriptDir "..\..")
$RunAgent = Join-Path $KitRoot "scripts\windows\run-agent.ps1"
$argsList = @("-AgentName", "backend-engineer")
if ($Workdir) { $argsList += @("-Workdir", $Workdir) }
if ($NoInit) { $argsList += "-NoInit" }
if ($InstallSettings) { $argsList += "-InstallSettings" }
if ($Help) { $argsList += "-Help" }
& $RunAgent @argsList
