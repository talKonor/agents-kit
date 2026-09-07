---
name: database-migration-workflow
description: "Use for database schema changes, data migrations, backfills, destructive data changes, storage changes, indexes, constraints, rollback paths, or migration release planning. Trigger before writing or running any migration and whenever existing data or schema may be affected."
---
# Database Migration Workflow

Use this workflow for schema migrations, data migrations, destructive data changes, storage changes, persistent data model changes, or changes affecting existing data.

## Do not use when

- There is no database, schema, persistent storage, or data migration impact.
- The change is an internal query optimization with no schema/data effect.

## Role sessions

1. `architect` when data model or migration strategy is non-trivial
2. `backend-engineer`
3. `security-engineer` when sensitive/user data is involved
4. `qa-engineer`
5. `code-reviewer`
6. `release-manager`
7. Human approver

## Skills

- `manage-database-migration`
- `create-technical-specification` when needed
- `write-software-tests`
- `perform-security-and-privacy-review` when needed
- `prepare-software-release`
- `verify-before-completion`

## Required artifacts

- `database-migration-plan.md`
- `rollback-plan.md`
- `implementation-summary.md`
- `quality-assurance-report.md`
- `security-and-privacy-review.md` when needed
- `release-checklist.md`

## Process

1. Describe the current schema/data state and target state.
2. Identify whether the migration is additive, reversible, destructive, or data-transforming.
3. Define rollback strategy before implementation.
4. Identify data safety, idempotency, locking, downtime, and backfill risks.
5. Implement migration in the smallest safe increment.
6. Add tests or verification steps.
7. Define staging verification and production monitoring.
8. Run release readiness review.

## Human approval gates

Human approval is required for:

- Any destructive or irreversible migration
- Migrations affecting user data or production data
- Rollback limitations
- Downtime or availability risk
- Running migration in production

## Exit criteria

- Migration plan exists.
- Rollback path is documented or limitation is explicit.
- Staging verification is defined.
- Release checklist includes migration steps.
- Human approval is recorded for high-risk data work.
