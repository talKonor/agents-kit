#!/usr/bin/env bash
set -euo pipefail

# Block mutating git commands when currently on main/master.

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
cmd="${CLAUDE_TOOL_COMMAND:-${COMMAND:-$*}}"
cmd_lc=$(printf '%s' "$cmd" | tr '[:upper:]' '[:lower:]')

if [[ "$branch" != "main" && "$branch" != "master" ]]; then
  echo "protect-main-branch-actions: current branch is $branch; passed"
  exit 0
fi

if [ -z "$cmd_lc" ]; then
  echo "protect-main-branch-actions: on $branch. Avoid mutating work on protected branches."
  exit 0
fi

if [[ "$cmd_lc" =~ git[[:space:]]+(commit|push|merge|rebase|reset|checkout|switch|add|restore|rm|mv) ]]; then
  echo "protect-main-branch-actions: blocked mutating git command on $branch"
  echo "Create a feature branch first."
  exit 1
fi

echo "protect-main-branch-actions: passed"
