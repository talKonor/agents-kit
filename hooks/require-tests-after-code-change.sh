#!/usr/bin/env bash
set -euo pipefail

# Check for test evidence after code changes. Advisory by default. Set ENFORCE=1 to block.

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$repo_root"

changed=$(git diff --name-only HEAD 2>/dev/null || true)
if [ -z "$changed" ]; then
  echo "require-tests-after-code-change: no changed files"
  exit 0
fi

code_changed=$(printf '%s\n' "$changed" | grep -E '\.(py|js|jsx|ts|tsx|go|java|kt|rb|php|cs|rs|swift)$' | grep -Ev '(^|/)(test|tests|spec|__tests__)/|\.(test|spec)\.' || true)
test_changed=$(printf '%s\n' "$changed" | grep -E '(^|/)(test|tests|spec|__tests__)/|\.(test|spec)\.' || true)

if [ -z "$code_changed" ]; then
  echo "require-tests-after-code-change: no application code changes detected"
  exit 0
fi

if [ -n "$test_changed" ] || [ -f ".ai/test-verification.txt" ]; then
  echo "require-tests-after-code-change: test evidence found"
  exit 0
fi

msg="require-tests-after-code-change: code changed but no test file changes or .ai/test-verification.txt found"
echo "$msg"
echo "Add/update tests, or document why tests were not changed and what verification was run."

if [ "${ENFORCE:-0}" = "1" ]; then
  exit 1
fi
exit 0
