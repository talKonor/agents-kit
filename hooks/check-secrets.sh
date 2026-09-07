#!/usr/bin/env bash
set -euo pipefail

# Scan changed files for likely secrets without printing secret values.
# Output only file, line number, and finding type.

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$repo_root"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  mapfile -t files < <(git ls-files -m -o --exclude-standard | grep -Ev '(^|/)(.git|node_modules|dist|build|coverage|.venv|venv)/' || true)
else
  mapfile -t files < <(find . -type f | grep -Ev '(^|/)(.git|node_modules|dist|build|coverage|.venv|venv)/' || true)
fi

if [ ${#files[@]} -eq 0 ]; then
  echo "check-secrets: no changed files to scan"
  exit 0
fi

findings=0

scan_file() {
  local file="$1"
  [ -f "$file" ] || return 0
  # Skip likely binary files.
  if ! grep -Iq . "$file" 2>/dev/null; then
    return 0
  fi

  local line_no=0
  while IFS= read -r line || [ -n "$line" ]; do
    line_no=$((line_no + 1))

    if [[ "$line" =~ (api[_-]?key|secret|token|password|passwd|private[_-]?key|client[_-]?secret)[[:space:]]*[:=][[:space:]]*[\"\']?[^\"\'[:space:]]{12,} ]]; then
      echo "check-secrets: possible credential assignment at ${file}:${line_no}"
      findings=$((findings + 1))
    fi
    if [[ "$line" =~ -----BEGIN[[:space:]]+(RSA[[:space:]]+|EC[[:space:]]+|OPENSSH[[:space:]]+)?PRIVATE[[:space:]]+KEY----- ]]; then
      echo "check-secrets: private key marker at ${file}:${line_no}"
      findings=$((findings + 1))
    fi
    if [[ "$line" =~ AKIA[0-9A-Z]{16} ]]; then
      echo "check-secrets: possible AWS access key id at ${file}:${line_no}"
      findings=$((findings + 1))
    fi
    if [[ "$line" =~ gh[pousr]_[A-Za-z0-9_]{20,} ]]; then
      echo "check-secrets: possible GitHub token at ${file}:${line_no}"
      findings=$((findings + 1))
    fi
    if [[ "$line" =~ xox[baprs]-[A-Za-z0-9-]{20,} ]]; then
      echo "check-secrets: possible Slack token at ${file}:${line_no}"
      findings=$((findings + 1))
    fi
  done < "$file"
}

for f in "${files[@]}"; do
  scan_file "$f"
done

if [ "$findings" -gt 0 ]; then
  echo "check-secrets: blocked. Remove secrets and rotate any exposed credentials. Secret values were not printed."
  exit 1
fi

echo "check-secrets: passed"
