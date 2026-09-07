---
name: security-sensitive-change-workflow
description: "Use when a change touches authentication, authorization, secrets, user data, PII, session identifiers, IAM, cloud permissions, third-party integrations, analytics identifiers, or any security or privacy sensitive surface. Trigger before implementing or merging security-sensitive changes."
---
# Security-Sensitive Change Workflow

Use this workflow for changes involving authentication, authorization, permissions, secrets, user data, session identifiers, behavioral tracking, admin tools, webhooks, third-party integrations, infrastructure access, or production access.

## Do not use when

- The change has no security, privacy, permissions, data, infra, or exposure implications.
- The request is only to run a generic code review.

## Role sessions

1. `architect` if design-impacting
2. Relevant engineer: `frontend-engineer`, `backend-engineer`, or `devops-engineer`
3. `security-engineer`
4. `qa-engineer`
5. `code-reviewer`
6. `release-manager`
7. Human approver

## Skills

- `perform-security-and-privacy-review`
- `write-software-tests`
- `write-quality-assurance-plan`
- `review-code-change`
- `prepare-software-release`
- `verify-before-completion`

## Required artifacts

- `security-and-privacy-review.md`
- `quality-assurance-report.md`
- `code-review-report.md`
- `release-checklist.md`
- `rollback-plan.md` when release-bound

## Process

1. Identify the security/privacy surface area.
2. Identify data flows, trust boundaries, permissions, identifiers, logs, and storage.
3. Implement only approved changes.
4. Run security review before release readiness.
5. Add tests for authorization, validation, privacy behavior, and error handling where practical.
6. Record unresolved risk and decisions needed.
7. Stop for human risk acceptance when needed.

## Human approval gates

Human approval is required for:

- Accepting any unresolved high or critical finding
- Adding or changing sensitive data collection
- Permission model changes
- Secret handling changes
- Production access or admin behavior changes

## Exit criteria

- No unresolved critical/high findings unless explicitly accepted by a human.
- Privacy implications are documented.
- Tests or verification evidence exist.
- Release manager has blocker/risk status.
