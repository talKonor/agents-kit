# Installation

## Recommended setup

Install the kit globally once per developer machine:

```bash
./install.sh --global
```

This copies the kit to:

```text
~/.claude/company-ai-production-kit/
```

and installs launchers to:

```text
~/.local/bin/
```

If `~/.local/bin` is not in your `PATH`, add this to your shell profile:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Global installer options

```bash
./install.sh --global
./install.sh --global --prefix ~/.claude/company-ai-production-kit
./install.sh --global --bin-dir ~/.local/bin
./install.sh --global --no-launchers
```

## Launchers

After global install, use:

```bash
launch-backend-engineer-agent
launch-frontend-engineer-agent -C /path/to/project
launch-code-reviewer-agent -C /path/to/project "Review the current diff"
```

If no `-C` is provided, the launcher asks for a working directory. Press Enter to use the current directory.

## Project initialization

Each project repo needs only lightweight local setup:

```text
CLAUDE.md
.ai/artifacts/
.claude/settings.ai-production-kit.example.json
.git/hooks/pre-commit, if the folder is a Git repo
```

A launcher will offer to initialize a project if setup is missing. You can also run:

```bash
company-kit-init /path/to/project
```

or:

```bash
./install.sh --project /path/to/project
```

## Project initialization options

```bash
company-kit-init /path/to/project --install-claude-settings
company-kit-init /path/to/project --force-claude-settings
company-kit-init /path/to/project --enforce-local-checks
company-kit-init /path/to/project --no-git-hooks
```

Default behavior is conservative:

- does not overwrite existing `CLAUDE.md`
- does not overwrite existing `.claude/settings.json`
- installs advisory local hooks by default
- skips Git hooks if the target is not a Git repo

## Verification

Verify project setup:

```bash
company-kit-verify-project /path/to/project
```

## Uninstall local hooks

From inside a project repo:

```bash
scripts/uninstall-local-hooks.sh
```

If the kit is only installed globally, remove the managed block from `.git/hooks/pre-commit` or rerun project init with `--no-git-hooks` for future installs.
