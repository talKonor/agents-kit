#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: ./install.sh [mode] [options]

Modes:
  --global                 Install the kit once for the current macOS user. Default mode.
  --project <dir>          Initialize a specific project repo/folder using this kit.

Global options:
  --prefix <dir>           Global kit install path. Default: ~/.claude/company-ai-production-kit
  --bin-dir <dir>          Directory for launcher commands. Default: ~/.local/bin
  --no-launchers           Do not install global launcher commands.

Project options:
  --install-claude-settings    Install .claude/settings.json if it does not exist.
  --force-claude-settings      Overwrite .claude/settings.json with the kit example.
  --enforce-local-checks       Make advisory pre-commit checks blocking.
  --no-git-hooks               Do not install local Git pre-commit hook.

Other:
  --help                  Show this help.

Default behavior:
  ./install.sh installs the kit globally to ~/.claude/company-ai-production-kit
  and installs macOS launcher commands such as launch-backend-engineer-agent.

After global install:
  launch-backend-engineer-agent
  launch-code-reviewer-agent -C /path/to/project
USAGE
}

MODE="global"
PREFIX="$HOME/.claude/company-ai-production-kit"
BIN_DIR="$HOME/.local/bin"
INSTALL_LAUNCHERS=1
PROJECT_DIR=""
PROJECT_ARGS=()

while [ $# -gt 0 ]; do
  case "$1" in
    --global) MODE="global" ;;
    --project)
      MODE="project"
      shift
      [ $# -gt 0 ] || { echo "install: --project requires a directory"; exit 1; }
      PROJECT_DIR="$1"
      ;;
    --prefix)
      shift
      [ $# -gt 0 ] || { echo "install: --prefix requires a directory"; exit 1; }
      PREFIX="$1"
      ;;
    --bin-dir)
      shift
      [ $# -gt 0 ] || { echo "install: --bin-dir requires a directory"; exit 1; }
      BIN_DIR="$1"
      ;;
    --no-launchers) INSTALL_LAUNCHERS=0 ;;
    --install-claude-settings|--force-claude-settings|--enforce-local-checks|--no-git-hooks)
      PROJECT_ARGS+=("$1") ;;
    --help) usage; exit 0 ;;
    *) echo "install: unknown option: $1"; usage; exit 1 ;;
  esac
  shift
done

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

install_global() {
  local prefix="$1" bin_dir="$2"
  mkdir -p "$prefix" "$bin_dir"

  if [ "$(cd "$prefix" && pwd 2>/dev/null || echo '')" = "$SCRIPT_DIR" ]; then
    echo "install: source already equals global prefix: $prefix"
  else
    rm -rf "$prefix.tmp"
    mkdir -p "$prefix.tmp"
    (cd "$SCRIPT_DIR" && tar --exclude='.git' -cf - .) | (cd "$prefix.tmp" && tar -xf -)
    rm -rf "$prefix"
    mv "$prefix.tmp" "$prefix"
  fi

  find "$prefix/hooks" -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \; 2>/dev/null || true
  find "$prefix/scripts" -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \; 2>/dev/null || true
  find "$prefix/launchers/macos" -maxdepth 1 -type f -exec chmod +x {} \; 2>/dev/null || true

  if [ "$INSTALL_LAUNCHERS" = "1" ]; then
    for launcher_path in "$prefix"/launchers/macos/launch-*-agent; do
      [ -f "$launcher_path" ] || continue
      launcher_name=$(basename "$launcher_path")
      cat > "$bin_dir/$launcher_name" <<EOF_LAUNCHER
#!/usr/bin/env bash
set -euo pipefail
exec '$launcher_path' "\$@"
EOF_LAUNCHER
      chmod +x "$bin_dir/$launcher_name"
    done

    cat > "$bin_dir/company-kit-init" <<EOF_INIT
#!/usr/bin/env bash
set -euo pipefail
exec '$prefix/scripts/init-project.sh' "\$@"
EOF_INIT
    chmod +x "$bin_dir/company-kit-init"

    cat > "$bin_dir/company-kit-verify-project" <<EOF_VERIFY
#!/usr/bin/env bash
set -euo pipefail
exec '$prefix/scripts/verify-project.sh' "\$@"
EOF_VERIFY
    chmod +x "$bin_dir/company-kit-verify-project"
  fi

  echo "install: global kit installed at $prefix"
  if [ "$INSTALL_LAUNCHERS" = "1" ]; then
    echo "install: macOS launchers installed in $bin_dir"
    case ":$PATH:" in
      *":$bin_dir:"*) ;;
      *)
        echo "install: warning: $bin_dir is not in PATH"
        echo "install: add this to your shell profile: export PATH=\"$bin_dir:\$PATH\""
        ;;
    esac
  fi
  echo "install: try: launch-backend-engineer-agent"
}

if [ "$MODE" = "project" ]; then
  if [ -z "$PROJECT_DIR" ]; then
    echo "install: --project requires a directory"
    exit 1
  fi
  bash "$SCRIPT_DIR/scripts/init-project.sh" "$PROJECT_DIR" "${PROJECT_ARGS[@]}"
else
  install_global "$PREFIX" "$BIN_DIR"
fi
