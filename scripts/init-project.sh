#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: init-project.sh <project-dir> [options]

Initializes the minimum project-local files needed for the Company AI Production Kit.
This script is intentionally conservative: it does not overwrite existing CLAUDE.md
or existing Claude settings unless explicitly forced.

Options:
  --install-claude-settings    Install .claude/settings.json if it does not exist.
  --force-claude-settings      Overwrite .claude/settings.json with the kit example.
  --enforce-local-checks       Make advisory pre-commit checks blocking.
  --no-git-hooks               Do not install local Git pre-commit hook.
  --help                       Show this help.
USAGE
}

if [ $# -lt 1 ]; then usage; exit 1; fi
PROJECT_DIR="$1"; shift
INSTALL_CLAUDE_SETTINGS=0
FORCE_CLAUDE_SETTINGS=0
ENFORCE_LOCAL=0
INSTALL_GIT_HOOKS=1

while [ $# -gt 0 ]; do
  case "$1" in
    --install-claude-settings) INSTALL_CLAUDE_SETTINGS=1 ;;
    --force-claude-settings) FORCE_CLAUDE_SETTINGS=1 ;;
    --enforce-local-checks) ENFORCE_LOCAL=1 ;;
    --no-git-hooks) INSTALL_GIT_HOOKS=0 ;;
    --help) usage; exit 0 ;;
    *) echo "init-project: unknown option: $1"; usage; exit 1 ;;
  esac
  shift
done

KIT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
PROJECT_DIR=$(cd "$PROJECT_DIR" && pwd)
cd "$PROJECT_DIR"

echo "init-project: target: $PROJECT_DIR"

mkdir -p .ai/artifacts .claude

if [ ! -f CLAUDE.md ]; then
  cp "$KIT_ROOT/CLAUDE.md" CLAUDE.md
  cat >> CLAUDE.md <<'EOF_CLAUDE_PROJECT'

---

# Project-Specific Context

Add project-specific architecture, commands, testing instructions, deployment notes,
and conventions here. Keep the global operating policy above unless intentionally updated.
EOF_CLAUDE_PROJECT
  echo "init-project: created CLAUDE.md from company kit base"
else
  echo "init-project: CLAUDE.md already exists; not overwriting"
fi

# Install a project-local Claude settings example that points to the global kit scripts.
cat > .claude/settings.ai-production-kit.example.json <<EOF_SETTINGS
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash '$KIT_ROOT/hooks/block-dangerous-commands.sh' \"\$CLAUDE_TOOL_INPUT\""
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "bash '$KIT_ROOT/hooks/check-secrets.sh'"
          },
          {
            "type": "command",
            "command": "ENFORCE=0 bash '$KIT_ROOT/hooks/require-tests-after-code-change.sh'"
          },
          {
            "type": "command",
            "command": "ENFORCE=0 bash '$KIT_ROOT/hooks/require-migration-rollback.sh'"
          }
        ]
      }
    ]
  }
}
EOF_SETTINGS

echo "init-project: wrote .claude/settings.ai-production-kit.example.json"

if [ "$FORCE_CLAUDE_SETTINGS" = "1" ]; then
  cp .claude/settings.ai-production-kit.example.json .claude/settings.json
  echo "init-project: overwrote .claude/settings.json"
elif [ "$INSTALL_CLAUDE_SETTINGS" = "1" ]; then
  if [ -f .claude/settings.json ]; then
    echo "init-project: .claude/settings.json already exists; not overwriting"
    echo "init-project: merge .claude/settings.ai-production-kit.example.json manually"
  else
    cp .claude/settings.ai-production-kit.example.json .claude/settings.json
    echo "init-project: installed .claude/settings.json"
  fi
fi

# Git hook installation is only possible in Git repositories.
if [ "$INSTALL_GIT_HOOKS" = "1" ]; then
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    repo_root=$(git rev-parse --show-toplevel)
    cd "$repo_root"
    mkdir -p .git/hooks
    hook_file=.git/hooks/pre-commit
    touch "$hook_file"
    chmod +x "$hook_file"

    if grep -q "# ai-production-kit:start" "$hook_file"; then
      tmp_file=$(mktemp)
      awk '
        $0 ~ /# ai-production-kit:start/ {skip=1; next}
        $0 ~ /# ai-production-kit:end/ {skip=0; next}
        skip != 1 {print}
      ' "$hook_file" > "$tmp_file"
      mv "$tmp_file" "$hook_file"
      chmod +x "$hook_file"
    fi

    cat >> "$hook_file" <<EOF_HOOK

# ai-production-kit:start
# Managed by Company AI Production Kit init-project.sh
bash '$KIT_ROOT/hooks/check-secrets.sh'
ENFORCE=${ENFORCE_LOCAL} bash '$KIT_ROOT/hooks/require-tests-after-code-change.sh'
ENFORCE=${ENFORCE_LOCAL} bash '$KIT_ROOT/hooks/require-migration-rollback.sh'
# ai-production-kit:end
EOF_HOOK
    echo "init-project: installed local Git pre-commit hook block (ENFORCE=${ENFORCE_LOCAL})"

    if [ -f .gitignore ] && ! grep -q '^\.ai/artifacts/' .gitignore; then
      cat >> .gitignore <<'EOF_IGNORE'

# AI production kit runtime artifacts
.ai/artifacts/
EOF_IGNORE
      echo "init-project: added .ai/artifacts/ to .gitignore"
    fi
  else
    echo "init-project: warning: target is not a Git repository; skipped Git hooks"
  fi
fi

bash "$KIT_ROOT/scripts/verify-project.sh" "$PROJECT_DIR"
echo "init-project: complete"
