#!/usr/bin/env bash
set -euo pipefail

KIT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$KIT_ROOT"
failures=0
check() {
  local label="$1" path="$2"
  if [ -e "$path" ]; then echo "OK   $label"; else echo "FAIL $label"; failures=$((failures + 1)); fi
}
check_exec() {
  local label="$1" path="$2"
  if [ -x "$path" ]; then echo "OK   $label"; else echo "FAIL $label"; failures=$((failures + 1)); fi
}

check "CLAUDE.md exists" CLAUDE.md
check "agents directory exists" agents
check "skills directory exists" skills
check "templates directory exists" templates
check "hooks directory exists" hooks
check "workflows directory exists" workflows
check "macOS launchers directory exists" launchers/macos
check "Windows launchers directory exists" launchers/windows
check "docs directory exists" docs
check_exec "init-project script executable" scripts/init-project.sh
check_exec "verify-project script executable" scripts/verify-project.sh
check_exec "run-agent script executable" scripts/run-agent.sh
check "Windows run-agent script exists" scripts/windows/run-agent.ps1
check "Windows init-project script exists" scripts/windows/init-project.ps1
check_exec "check-secrets hook executable" hooks/check-secrets.sh
check_exec "dangerous-command hook executable" hooks/block-dangerous-commands.sh
for launcher in product-manager architect frontend-engineer backend-engineer devops-engineer qa-engineer code-reviewer security-engineer release-manager; do
  check_exec "macOS launcher launch-$launcher-agent executable" "launchers/macos/launch-$launcher-agent"
  check "Windows launcher launch-$launcher-agent.ps1 exists" "launchers/windows/launch-$launcher-agent.ps1"
done

if bash hooks/block-dangerous-commands.sh "git reset --hard" >/dev/null 2>&1; then
  echo "FAIL dangerous command hook did not block git reset --hard"
  failures=$((failures + 1))
else
  echo "OK   dangerous command hook blocks git reset --hard"
fi

if [ "$failures" -gt 0 ]; then
  echo "verify-installation: $failures failure(s) found"
  exit 1
fi

echo "verify-installation: passed"
