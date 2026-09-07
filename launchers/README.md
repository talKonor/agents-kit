# Launchers

Launchers start an interactive Claude Code session for one role-specific agent.

They do not accept one-off prompts. Run a launcher, choose a working directory, then talk to Claude in the terminal session.

## macOS

Install globally with:

```bash
./install.sh --global
```

Commands installed to `~/.local/bin` by default:

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
```

Usage:

```bash
launch-backend-engineer-agent
launch-backend-engineer-agent -C /path/to/project
```

## Windows

Install globally with PowerShell:

```powershell
.\install.ps1
```

Commands are copied to `%USERPROFILE%\bin` by default:

```text
launch-product-manager-agent.ps1
launch-architect-agent.ps1
launch-frontend-engineer-agent.ps1
launch-backend-engineer-agent.ps1
launch-devops-engineer-agent.ps1
launch-qa-engineer-agent.ps1
launch-code-reviewer-agent.ps1
launch-security-engineer-agent.ps1
launch-release-manager-agent.ps1
```

Usage:

```powershell
launch-backend-engineer-agent.ps1
launch-backend-engineer-agent.ps1 -Workdir C:\code\project
```

## Project initialization

If the selected working directory is missing project setup, the launcher offers to initialize it. Initialization adds only local project files such as `CLAUDE.md`, `.ai/artifacts/`, `.claude/settings.ai-production-kit.example.json`, and Git hooks when applicable.
