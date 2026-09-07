---
name: api-contract-change-workflow
description: "Use when a change affects API contracts, request or response schemas, endpoint behavior, client-server compatibility, generated clients, validation rules, versioning, or integration contracts. Trigger before implementing or reviewing any change that could break API consumers."
---
# API Contract Change Workflow

Use this workflow when changing request schemas, response schemas, endpoint behavior, client/server contracts, webhook payloads, event contracts, or shared interface definitions.

## Do not use when

- The change is purely internal and does not affect a public/shared interface.
- The contract is unchanged and only implementation details changed.

## Role sessions

1. `architect` for non-trivial or breaking contract changes
2. `backend-engineer`
3. `frontend-engineer` if clients/UI are affected
4. `qa-engineer`
5. `code-reviewer`
6. `security-engineer` if auth, PII, identifiers, or exposure are affected
7. `release-manager`

## Skills

- `manage-api-contract-change`
- `create-technical-specification` when needed
- `implement-backend-change`
- `implement-frontend-change` when needed
- `write-software-tests`
- `update-project-documentation`
- `perform-security-and-privacy-review` when needed
- `prepare-software-release`

## Required artifacts

- `api-contract-change-summary.md`
- `technical-specification.md` when needed
- `implementation-summary.md`
- `quality-assurance-report.md`
- `code-review-report.md`
- `release-checklist.md`

## Process

1. Identify the current contract and proposed contract.
2. Classify the change as backward-compatible, additive, or breaking.
3. Identify all affected consumers and producers.
4. Define migration or compatibility strategy.
5. Update implementation, tests, and documentation.
6. Verify frontend/backend/client compatibility.
7. Review release risk and rollback options.

## Human approval gates

Human approval is required for:

- Breaking changes
- Consumer migration plans
- Removing fields or changing semantics
- Public API exposure changes
- Release timing and communication

## Exit criteria

- Contract compatibility is documented.
- Affected clients are updated or migration path is documented.
- Tests cover contract behavior.
- Documentation and release notes are updated.
