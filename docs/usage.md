# Usage

## Operating model

Use role-specific Claude sessions. The human remains the producer/approver. Agents produce artifacts and execution work.

## Start an agent session

```bash
launch-product-manager-agent
launch-architect-agent -C /path/to/project
launch-backend-engineer-agent -C /path/to/project "Implement TASK-142 according to the spec"
launch-code-reviewer-agent -C /path/to/project "Review the current diff"
```

If the project is missing local setup, the launcher will offer to initialize it.

## Multiple instances

You may run multiple instances of the same agent. For parallel tasks, prefer separate branches or worktrees and separate artifact folders.

Example:

```bash
launch-backend-engineer-agent -C ../task-142-worktree
launch-backend-engineer-agent -C ../task-143-worktree
```

## Artifacts

Durable workflow artifacts belong under:

```text
.ai/artifacts/<task-id>/
```

Examples:

```text
product-requirements-document.md
technical-specification.md
implementation-summary.md
quality-assurance-report.md
code-review-report.md
security-and-privacy-review.md
release-checklist.md
rollback-plan.md
```

## Workflows

Use `workflows/` as playbooks. They define which role session to run, which skills to use, which artifact to produce, and where human approval is required.

## Safety

Never reveal secrets or credentials. Do not run forbidden Git/GitHub operations. Do not expand scope without approval. Missing evidence is not pass.
