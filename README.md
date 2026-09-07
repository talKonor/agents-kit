# Company AI Production Kit

Installable AI production workflow package for running role-specific Claude sessions with shared company agents, skills, templates, workflows, hooks, and project bootstrap scripts.

This package is intentionally conservative: humans own judgment and approval; agents and skills produce artifacts, code, tests, reviews, and release material under explicit scope and verification rules.
# The Core Principle
Humans lead. Agents produce. Humans decide.
Every agent in the kit is a producer, not a decision-maker. Agents write the artifacts; people choose which agent to run, when to run it, and whether to approve its output. This separation is enforced consistently across every role, skill, workflow, and safety hook in the repository.
## Contents

```text
CLAUDE.md                 # global operating policy / base project policy
agents/                   # role personas
skills/                   # Claude-style SKILL.md workflows
workflows/                # playbooks connecting roles, skills, artifacts, gates
templates/                # durable artifact templates
hooks/                    # local guardrail scripts
launchers/                # role launcher entrypoints
scripts/                  # init, verify, and launcher support scripts
install.sh                # global or project installer
docs/                     # installation and usage docs
```

## Global-first installation model

Install the kit once globally:

```bash
./install.sh --global
```

Default global location:

```text
~/.claude/company-ai-production-kit/
```

Default launcher location:

```text
~/.local/bin/
```

Installed launchers:

```text
launch-product-manager-agent
launch-architect-agent
launch-frontend-engineer-agent
launch-backend-engineer-agent
launch-devops-engineer-agent
launch-qa-engineer-agent
launch-code-reviewer-agent
launch-security-engineer-agent
launch-release-manager-agent
company-kit-init
company-kit-verify-project
```

Example:

```bash
launch-backend-engineer-agent -C /path/to/project "Implement TASK-142 according to the spec"
```

If the selected project folder is missing project-local setup, the launcher offers to initialize it by calling `scripts/init-project.sh`.

## Project-local setup

The global kit stays global. Each project only needs minimal local setup:

```text
CLAUDE.md
.ai/artifacts/
.claude/settings.ai-production-kit.example.json
.git/hooks/pre-commit   # only for Git repos, optional
```

Initialize a project manually:

```bash
company-kit-init /path/to/project
```

or from the extracted kit:

```bash
./install.sh --project /path/to/project
```

## Current scope

- Agents are ready for local use as role personas.
- Skills are operational drafts written in Claude/Superpowers-inspired style.
- Workflows are included as playbooks.
- Templates are included for durable artifacts.
- Hooks are included and can be installed locally through project init.
- Launchers are included and can bootstrap target project folders when needed.
- Project-specific examples are not included yet.

## Important safety note

This kit intentionally forbids risky Git/GitHub operations such as deleting branches, pushing to main/master, force pushing, `git reset --hard`, changing GitHub Actions secrets, modifying protected branch settings, merging pull requests, or triggering production deploy workflows.
