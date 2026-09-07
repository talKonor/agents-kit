#!/usr/bin/env bash
set -euo pipefail

# Require release checklist before release/deploy commands. Advisory by default.

cmd="${CLAUDE_TOOL_COMMAND:-${COMMAND:-$*}}"
cmd_lc=$(printf '%s' "$cmd" | tr '[:upper:]' '[:lower:]')

if [ -z "$cmd_lc" ]; then
  echo "require-release-checklist: no command provided; nothing to check"
  exit 0
fi

if ! [[ "$cmd_lc" =~ (deploy|release|gh[[:space:]]+workflow[[:space:]]+run|vercel[[:space:]]+deploy|netlify[[:space:]]+deploy|fly[[:space:]]+deploy) ]]; then
  echo "require-release-checklist: command does not look like release/deploy"
  exit 0
fi

checklist_found=$(find .ai/artifacts -type f \( -name 'release-checklist.md' -o -name 'post-deploy-verification.md' \) 2>/dev/null | head -1 || true)

if [ -n "$checklist_found" ] || [ "${RELEASE_CHECKLIST_CONFIRMED:-0}" = "1" ]; then
  echo "require-release-checklist: release evidence found"
  exit 0
fi

echo "require-release-checklist: release/deploy-like command without release checklist evidence"
echo "Create .ai/artifacts/<task-id>/release-checklist.md before proceeding."

if [ "${ENFORCE:-0}" = "1" ]; then
  exit 1
fi
exit 0
