---
name: feature-implementation-workflow
description: "Use when an approved product requirement, task, or technical specification needs to be implemented as code. Trigger for feature work, scoped code changes, new endpoints, new UI, or implementing approved specs that need engineer to QA to code review sequencing. Do not use when scope is undefined, technical design is unresolved, or the work is a production incident."
---
# Feature Implementation Workflow

Use this workflow when there is an approved product requirement, task, or technical specification and the team needs to implement product or code changes.

## Do not use when

- The problem is not understood yet. Use Product Discovery first.
- The technical direction is unresolved. Use Technical Design first.
- The work is a production incident. Use Bug Fix / Debugging first.

## Role sessions

1. `frontend-engineer`, `backend-engineer`, and/or `devops-engineer` based on scope
2. `qa-engineer`
3. `code-reviewer`
4. `security-engineer` if the change is sensitive
5. `release-manager` if release-bound
6. Human approver

For serious work, do not use the same Claude session for implementation and independent review.

## Skills

- `create-implementation-plan`
- `implement-frontend-change`
- `implement-backend-change`
- `manage-git-and-github-workflow` when branch/commit/PR work is needed
- `write-software-tests`
- `write-quality-assurance-plan`
- `review-code-change`
- `perform-security-and-privacy-review` when needed
- `verify-before-completion`

## Required artifacts

- `implementation-summary.md`
- `quality-assurance-report.md`
- `code-review-report.md`
- `security-and-privacy-review.md` when needed
- `git-and-github-workflow-summary.md` when branch/PR work is performed

## Process

1. Engineer session reads approved requirements/specification.
2. Engineer produces a short implementation plan before editing.
3. Human approves scope changes or high-risk work before implementation.
4. Engineer implements only the scoped change.
5. Engineer writes or updates tests and records verification evidence.
6. QA session verifies behavior against acceptance criteria.
7. Code reviewer session reviews independently.
8. Security review runs if the change touches auth, permissions, user data, secrets, infra, or tracking identifiers.
9. Release manager prepares release readiness if the change is shipping.

## Human approval gates

Human approval is required for:

- Scope expansion
- New dependencies
- New patterns or architecture changes
- Security/privacy tradeoffs
- Migration or infrastructure changes
- Release go/no-go

## Exit criteria

- Implementation summary exists.
- Tests and verification evidence are recorded.
- QA has no unresolved blockers or documents them clearly.
- Code review has no unresolved blocking issues.
- Security review is complete when required.
