#!/usr/bin/env bash
set -euo pipefail

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$repo_root"

hook_file=".git/hooks/pre-commit"
marker_start="# ai-production-kit:start"
marker_end="# ai-production-kit:end"

if [ ! -f "$hook_file" ]; then
  echo "uninstall-local-hooks: no pre-commit hook found"
  exit 0
fi

if grep -q "$marker_start" "$hook_file"; then
  tmp_file=$(mktemp)
  awk -v start="$marker_start" -v end="$marker_end" '
    $0 ~ start {skip=1; next}
    $0 ~ end {skip=0; next}
    skip != 1 {print}
  ' "$hook_file" > "$tmp_file"
  mv "$tmp_file" "$hook_file"
  chmod +x "$hook_file"
  echo "uninstall-local-hooks: removed ai-production-kit block from pre-commit"
else
  echo "uninstall-local-hooks: pre-commit hook has no ai-production-kit block"
fi
