# Workflows

Workflows are the operating playbooks for the AI production kit.

Agents are roles. Skills are reusable capabilities. Templates define artifact formats. Hooks enforce guardrails. Workflows define how work moves through the system.

## Core operating model

- The human is the producer and approver.
- Role-specific Claude sessions should be used for serious work.
- Do not treat one Claude session as every role unless the task is small and low risk.
- Use durable artifacts under `.ai/artifacts/<task-id>/` for handoff between role sessions.
- Missing evidence is not pass.
- Product, architecture, security, release, and risk decisions remain human decisions.

## Workflow list

1. `product-discovery-to-requirements-workflow.md`
2. `technical-design-workflow.md`
3. `feature-implementation-workflow.md`
4. `bug-fix-debugging-workflow.md`
5. `api-contract-change-workflow.md`
6. `database-migration-workflow.md`
7. `git-github-continuous-integration-workflow.md`
8. `documentation-update-workflow.md`
9. `security-sensitive-change-workflow.md`
10. `release-workflow.md`

## How to use a workflow

1. Pick the workflow that matches the work type.
2. Create or reuse a task artifact folder: `.ai/artifacts/<task-id>/`.
3. Run the first listed role session.
4. Produce the required artifact.
5. Stop at human approval gates.
6. Continue with the next role session only after the exit criteria are met.

## Source patterns used

These workflows adapt patterns from:

- Claude Code plugin conventions: feature development, code review, PR review, security guidance, hooks, agents, and skills.
- Superpowers methodology: brainstorming, planning before execution, systematic debugging, code review, and verification before completion.
- BMad Method: scale-adaptive structured workflows, specialized agents, and lifecycle coverage from brainstorming to deployment.
- GitHub workflow practice: pull requests, CI, GitHub Actions, code review, branch discipline, and release readiness.

We do not copy those systems wholesale. We adapt the useful workflow discipline into this company's human-approved production process.
