# Hooks

These hooks are conservative guardrails for local Claude Code / agentic development workflows.
They are intentionally small shell scripts so they can be reviewed, versioned, and adapted.

## Included hooks

- `check-secrets.sh` — scans changed files for likely secrets without printing secret values.
- `block-dangerous-commands.sh` — blocks high-risk commands such as force push, reset hard, destructive infrastructure commands, and secret mutation commands.
- `protect-main-branch-actions.sh` — blocks commits/pushes/mutations from `main` or `master`.
- `require-tests-after-code-change.sh` — checks whether code changes have nearby test evidence. Advisory by default, enforceable with `ENFORCE=1`.
- `require-migration-rollback.sh` — requires rollback evidence for migration/schema changes. Advisory by default, enforceable with `ENFORCE=1`.
- `require-release-checklist.sh` — requires release checklist evidence before release/deploy commands. Advisory by default, enforceable with `ENFORCE=1`.

## Safety policy

Hooks must never print secret values. If a hook detects a secret-like value, it should print only file path, line number, and finding type.

## Usage model

These scripts can be wired into Claude Code hooks, Git hooks, CI checks, or run manually.
They are not a replacement for CI, branch protection, secret scanning, or human approval.

## Advisory vs enforced checks

Some hooks are advisory by default to avoid blocking early experimentation.
Set `ENFORCE=1` to make those hooks fail when evidence is missing.

Example:

```bash
ENFORCE=1 hooks/require-tests-after-code-change.sh
```

## Claude Code settings example

See `examples/claude-hooks-settings-example.json` for a starting point. Review and adapt before using.
