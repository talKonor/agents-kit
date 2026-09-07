---
name: git-github-continuous-integration-workflow
description: "Use when work involves branching, committing, pushing, pull request preparation, GitHub Actions workflow edits, CI debugging, or coordinating Git and GitHub operations across roles. Trigger for any change that needs branch discipline, PR review, or CI verification before merging."
---
# Git / GitHub / Continuous Integration Workflow

Use this workflow for branch creation, status/diff review, fetch/pull/rebase planning, commits, feature-branch pushes, pull request preparation, GitHub Actions status, CI failures, and workflow YAML changes.

## Do not use when

- The task is only product/spec/design work.
- The task is a release go/no-go decision. Use Release Workflow.
- The task requires forbidden Git/GitHub operations.

## Role sessions

1. Relevant engineer or `devops-engineer`
2. `code-reviewer` if code or workflow configuration changed
3. `security-engineer` if workflows, permissions, secrets references, or token scopes are involved

## Skills

- `manage-git-and-github-workflow`
- `review-code-change`
- `perform-security-and-privacy-review` when needed
- `verify-before-completion`

## Required artifacts

- `git-and-github-workflow-summary.md`
- `code-review-report.md` when needed
- `security-and-privacy-review.md` when needed

## Allowed operations

Allowed when appropriate:

- inspect status and diffs
- fetch updates
- create feature branches
- commit selected changes
- push feature branches after approval if configured
- prepare pull requests
- inspect CI status and logs
- edit approved GitHub Actions workflow files

## Forbidden operations

Never perform:

- delete branches
- push to `main` or `master`
- force push
- `git reset --hard`
- change GitHub Actions secrets
- modify protected branch settings
- merge pull requests into `main` or `master`
- trigger production deploy workflows

## Human approval gates

Human approval is required for:

- Creating a branch from an unexpected base
- Rebase or conflict resolution
- Pushing a feature branch
- Modifying GitHub Actions workflows
- Triggering non-production workflows

Forbidden operations remain forbidden even with approval.

## Exit criteria

- Branch state is safe and documented.
- Changed files are known.
- CI status is understood.
- No forbidden operation was performed.
- Security review ran when workflow permissions/secrets/actions changed.
