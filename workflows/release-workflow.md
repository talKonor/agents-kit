---
name: release-workflow
description: "Use when preparing a staging or production release, release candidate, deploy readiness review, release notes, rollback plan, blocker list, or post-deploy verification plan. Trigger before deployment or when deciding if a set of changes is ready for human go/no-go review. Do not use to make the go/no-go decision itself."
---
# Release Workflow

Use this workflow before staging or production release, or when preparing a release candidate.

## Do not use when

- The work is still under implementation.
- QA or review evidence does not exist and the task is not explicitly a release readiness assessment.
- The user is asking for deployment execution rather than release readiness.

## Role sessions

1. `release-manager`
2. `qa-engineer` if QA evidence is missing or incomplete
3. `security-engineer` if sensitive changes are included
4. `devops-engineer` if deployment, infrastructure, environment, or CI/CD changes are included
5. Human go/no-go approver

## Skills

- `prepare-software-release`
- `verify-before-completion`
- `perform-security-and-privacy-review` when needed
- `update-project-documentation` when needed
- `manage-git-and-github-workflow` for PR/branch/status checks only

## Required artifacts

- `release-checklist.md`
- `release-notes.md`
- `rollback-plan.md`
- `post-deploy-verification.md`

## Process

1. Identify release scope, environment, and included changes.
2. Check CI, tests, QA, code review, security review, docs, migrations, configuration, infrastructure, and rollback evidence.
3. Mark missing evidence as Needs review, not Pass.
4. Produce release notes and known risks.
5. Produce rollback and post-deploy verification plans.
6. Stop for human go/no-go.

## Human approval gates

Only the human can approve:

- Staging release
- Production release
- Accepting unresolved release risks
- Shipping with missing evidence
- Any rollback limitation

## Exit criteria

- Release checklist is complete.
- Blockers are explicit.
- Rollback plan exists.
- Post-deploy verification plan exists.
- Human go/no-go decision is recorded.
