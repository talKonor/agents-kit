#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: run-agent.sh <agent-file-name> [options]

Options:
  -C, --workdir <dir>       Working directory to start Claude in.
  --no-init                 Do not offer to initialize missing project setup.
  --install-settings        When initializing, install .claude/settings.json if missing.
  --help                    Show this help.

Examples:
  run-agent.sh backend-engineer
  run-agent.sh backend-engineer -C ~/code/my-app

This starts an interactive Claude session for the selected role. It does not accept a one-off prompt.
USAGE
}

if [ $# -lt 1 ]; then usage; exit 1; fi
AGENT_NAME="$1"; shift
KIT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
AGENT_FILE="$KIT_ROOT/agents/${AGENT_NAME}.md"
WORKDIR=""
OFFER_INIT=1
INSTALL_SETTINGS=0

while [ $# -gt 0 ]; do
  case "$1" in
    -C|--workdir)
      shift
      [ $# -gt 0 ] || { echo "run-agent: missing workdir value"; exit 1; }
      WORKDIR="$1"
      ;;
    --no-init) OFFER_INIT=0 ;;
    --install-settings) INSTALL_SETTINGS=1 ;;
    --help) usage; exit 0 ;;
    *) echo "run-agent: unexpected argument: $1"; echo "run-agent: launchers start interactive sessions and do not accept prompts"; usage; exit 1 ;;
  esac
  shift
done

if [ ! -f "$AGENT_FILE" ]; then
  echo "run-agent: unknown agent: $AGENT_NAME"
  echo "Expected file: $AGENT_FILE"
  exit 1
fi

if [ -z "$WORKDIR" ]; then
  default_dir=$(pwd)
  printf "Working directory for %s [%s]: " "$AGENT_NAME" "$default_dir"
  read -r answer || true
  WORKDIR="${answer:-$default_dir}"
fi

case "$WORKDIR" in
  ~) WORKDIR="$HOME" ;;
  ~/*) WORKDIR="$HOME/${WORKDIR#~/}" ;;
esac

if [ ! -d "$WORKDIR" ]; then
  echo "run-agent: directory does not exist: $WORKDIR"
  exit 1
fi
WORKDIR=$(cd "$WORKDIR" && pwd)

missing=()
[ -f "$WORKDIR/CLAUDE.md" ] || missing+=("CLAUDE.md")
[ -d "$WORKDIR/.ai/artifacts" ] || missing+=(".ai/artifacts/")
[ -f "$WORKDIR/.claude/settings.ai-production-kit.example.json" ] || [ -f "$WORKDIR/.claude/settings.json" ] || missing+=(".claude/settings.ai-production-kit.example.json")

if [ ${#missing[@]} -gt 0 ]; then
  echo "run-agent: project setup is incomplete in $WORKDIR"
  printf '  - missing %s\n' "${missing[@]}"
  if [ "$OFFER_INIT" = "1" ]; then
    printf "Initialize this folder with minimal AI production kit project setup now? [y/N]: "
    read -r init_answer || true
    case "$init_answer" in
      y|Y|yes|YES)
        init_args=("$WORKDIR")
        [ "$INSTALL_SETTINGS" = "1" ] && init_args+=("--install-claude-settings")
        bash "$KIT_ROOT/scripts/init-project.sh" "${init_args[@]}"
        ;;
      *) echo "run-agent: continuing without initialization" ;;
    esac
  fi
fi

if [ ! -f "$WORKDIR/CLAUDE.md" ]; then
  echo "run-agent: warning: no CLAUDE.md found in target folder; project rules may not be loaded"
fi
if ! git -C "$WORKDIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "run-agent: warning: target folder is not a Git repository; Git/GitHub workflow features may not work"
fi

if ! command -v claude >/dev/null 2>&1; then
  echo "run-agent: Claude Code CLI 'claude' was not found in PATH"
  echo "run-agent: install Claude Code or set up PATH, then retry"
  exit 1
fi

BOOTSTRAP=$(mktemp)
cat > "$BOOTSTRAP" <<EOF_BOOTSTRAP
You are starting an interactive role-specific Claude Code session.

Role agent: $AGENT_NAME
Agent definition file: $AGENT_FILE
Company kit root: $KIT_ROOT
Working directory: $WORKDIR

First, read and follow the agent definition file. Also follow CLAUDE.md in the working directory when present. Use company skills, templates, and workflows from the kit root when useful:
- $KIT_ROOT/skills
- $KIT_ROOT/templates
- $KIT_ROOT/workflows

Important operating model:
- The human owns judgment and approval.
- You produce artifacts and execution work.
- Do not expand scope without approval.
- Never reveal secrets or credentials.
- Use .ai/artifacts/<task-id>/ for durable workflow artifacts.
- If this task belongs to another agent, say which agent is more appropriate and why.

Start by briefly stating that you are ready in this role and ask for the task or task id.
EOF_BOOTSTRAP

cd "$WORKDIR"
claude "$(cat "$BOOTSTRAP")"
rm -f "$BOOTSTRAP"
