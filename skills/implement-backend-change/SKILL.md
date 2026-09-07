---
name: implement-backend-change
description: "Use for scoped and approved backend implementation work: APIs, services, data models, background jobs, integrations, validations, authorization-aware behavior, backend tests, and backend bug fixes. Trigger after scope is approved and before production-affecting backend code changes."
---
# Implement Backend Change

Use this skill to implement approved backend work while preserving contracts, data safety, authorization boundaries, and production reliability.

## Process
1. Restate the task in one sentence.
2. Identify affected modules, APIs, services, jobs, data models, integrations, and tests.
3. Check existing patterns before writing code.
4. Stop for approval before high-risk work: migrations, auth/permission changes, contract changes, destructive actions, production-affecting behavior, or infrastructure implications.
5. Implement the smallest clear change that satisfies the task.
6. Add or update tests for new and changed behavior, including error and boundary cases where relevant.
7. Verify with relevant commands before claiming completion.
8. Summarize changed files, behavior, tests, verification, and follow-ups.

## Backend Checks
- API/request/response compatibility.
- Input validation at system boundaries.
- Data consistency, transactions, concurrency, and idempotency for writes/jobs.
- Error handling and observability without exposing sensitive data.
- Existing auth and authorization boundaries.

## Stop Conditions
Stop if the expected API/data contract does not match the existing system, if a migration is needed but not approved, or if the change creates security/privacy/release risk not covered by the task.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
