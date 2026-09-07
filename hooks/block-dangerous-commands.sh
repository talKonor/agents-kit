#!/usr/bin/env bash
set -euo pipefail

# Block high-risk commands. Pass the command as arguments or set COMMAND / CLAUDE_TOOL_COMMAND.

cmd="${CLAUDE_TOOL_COMMAND:-${COMMAND:-$*}}"
cmd_lc=$(printf '%s' "$cmd" | tr '[:upper:]' '[:lower:]')

if [ -z "$cmd_lc" ]; then
  echo "block-dangerous-commands: no command provided; nothing to check"
  exit 0
fi

block() {
  echo "block-dangerous-commands: blocked dangerous command: $1"
  echo "Reason: $2"
  exit 1
}

[[ "$cmd_lc" =~ git[[:space:]]+reset[[:space:]]+--hard ]] && block "git reset --hard" "destructive working-tree reset is forbidden"
[[ "$cmd_lc" =~ git[[:space:]]+push([^|;]*)(origin[[:space:]]+)?(main|master)([[:space:]]|$) ]] && block "git push to main/master" "pushing directly to protected branches is forbidden"
[[ "$cmd_lc" =~ git[[:space:]]+push([^|;]*)(--force|--force-with-lease|-f)([[:space:]]|$) ]] && block "git force push" "force push is forbidden"
[[ "$cmd_lc" =~ git[[:space:]]+branch[[:space:]]+(-d|-D|--delete) ]] && block "git branch delete" "branch deletion is forbidden"
[[ "$cmd_lc" =~ git[[:space:]]+push([^|;]*)--delete ]] && block "remote branch delete" "remote branch deletion is forbidden"
[[ "$cmd_lc" =~ gh[[:space:]]+secret[[:space:]]+(set|delete|remove) ]] && block "GitHub secret mutation" "changing GitHub secrets is forbidden"
[[ "$cmd_lc" =~ gh[[:space:]]+api([^|;]*)(branches/.*/protection|protected_branches) ]] && block "protected branch settings" "modifying protected branch settings is forbidden"
[[ "$cmd_lc" =~ terraform[[:space:]]+(apply|destroy) ]] && block "terraform apply/destroy" "infrastructure mutation requires a controlled workflow outside this hook"
[[ "$cmd_lc" =~ kubectl[[:space:]]+(delete|drain|cordon|scale) ]] && block "kubectl destructive operation" "cluster mutation is blocked by default"
[[ "$cmd_lc" =~ aws[[:space:]].*(delete|terminate|remove|detach|revoke) ]] && block "AWS destructive operation" "cloud destructive operation is blocked by default"
[[ "$cmd_lc" =~ rm[[:space:]]+-rf[[:space:]]+(/|~|\*) ]] && block "rm -rf high-risk target" "destructive file deletion is forbidden"

# Production deploy/run trigger patterns.
[[ "$cmd_lc" =~ gh[[:space:]]+workflow[[:space:]]+run([^|;]*)(prod|production) ]] && block "production workflow trigger" "production deploy workflows are forbidden from agent execution"
[[ "$cmd_lc" =~ (deploy|release)([^|;]*)(prod|production) ]] && block "production deploy command" "production deploy commands require a controlled human release process"

echo "block-dangerous-commands: passed"
