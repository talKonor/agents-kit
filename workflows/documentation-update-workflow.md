---
name: documentation-update-workflow
description: "Use when code, APIs, behavior, configuration, workflows, runbooks, setup steps, release process, or architecture changes require documentation updates. Trigger when documentation may drift from the product or codebase. Do not use as a substitute for implementation work."
---
# Documentation Update Workflow

Use this workflow when code, APIs, configuration, architecture, release process, setup steps, runbooks, or user/product behavior changes require documentation updates.

## Do not use when

- The documentation change defines product behavior that has not been approved.
- The docs are only a byproduct of a larger feature workflow and already covered there.

## Role sessions

1. Relevant role session: `product-manager`, `architect`, `frontend-engineer`, `backend-engineer`, `devops-engineer`, or `release-manager`
2. `code-reviewer` if docs accompany code changes
3. Human approver when docs define policy, product behavior, or operational procedure

## Skills

- `update-project-documentation`
- `verify-before-completion`
- `review-code-change` when docs are part of a PR

## Required artifacts

- `documentation-update-summary.md`

## Process

1. Identify what changed and which docs are affected.
2. Update docs to match current behavior, not desired future behavior.
3. Remove or flag stale instructions.
4. Keep docs actionable and specific.
5. Record what documentation was updated and what remains missing.
6. Ask for human approval if the docs define policy, product behavior, release process, or operational runbooks.

## Human approval gates

Human approval is required for:

- Product behavior documentation
- Policy/process documentation
- Operational runbooks
- Public or customer-facing documentation

## Exit criteria

- Docs match current behavior.
- Stale docs are removed or flagged.
- Missing docs are recorded.
- Human-approved docs are marked as approved when required.
