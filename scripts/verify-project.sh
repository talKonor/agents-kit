#!/usr/bin/env bash
set -euo pipefail
PROJECT_DIR="${1:-.}"
if [ ! -d "$PROJECT_DIR" ]; then
  echo "verify-project: missing directory: $PROJECT_DIR"
  exit 1
fi
PROJECT_DIR=$(cd "$PROJECT_DIR" && pwd)
cd "$PROJECT_DIR"
status=0
check() {
  if [ -e "$1" ]; then
    echo "ok: $1"
  else
    echo "missing: $1"
    status=1
  fi
}
check CLAUDE.md
check .ai/artifacts
check .claude/settings.ai-production-kit.example.json
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ -f .git/hooks/pre-commit ] && grep -q "ai-production-kit:start" .git/hooks/pre-commit; then
    echo "ok: Git pre-commit hook managed block installed"
  else
    echo "warn: Git pre-commit hook managed block not installed"
  fi
else
  echo "warn: not a Git repository"
fi
exit "$status"
