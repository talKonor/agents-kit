---
name: manage-api-contract-change
description: "Use when a change affects API contracts, request or response schemas, endpoint behavior, client-server compatibility, generated clients, validation rules, versioning, or integration contracts. Trigger before implementing or reviewing any frontend/backend/API change that could break consumers."
---
# Manage API Contract Change

Use this skill to keep API contract changes explicit, compatible, documented, tested, and coordinated.

## Process
1. Identify the current contract and the proposed contract.
2. List all known consumers: frontend, backend services, third-party integrations, scripts, tests, docs, generated clients.
3. Classify the change: additive, behavior-preserving, behavior-changing, breaking, or deprecating.
4. Prefer backward-compatible changes. If breaking change is required, document approval, migration path, and release implications.
5. Define validation, error behavior, and compatibility tests.
6. Update documentation and generated clients where applicable.
7. Flag security/privacy implications for exposed fields or identifiers.

## Contract Change Report
```markdown
# API Contract Change

## Current Contract
## Proposed Contract
## Change Classification
## Consumers Affected
## Compatibility Plan
## Tests Required
## Documentation Updates
## Release / Rollback Notes
## Decisions Needed
```

## Guardrails
- Do not change contracts silently as part of implementation.
- Do not remove or repurpose fields without explicit approval.
- Do not expose user/session identifiers or sensitive fields unless specified and reviewed.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
