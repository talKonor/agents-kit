---
name: manage-database-migration
description: "Use for database schema changes, data migrations, backfills, destructive data changes, storage changes, indexes, constraints, rollback paths, or migration release planning. Trigger before writing or running any migration and whenever existing data or schema may be affected."
---
# Manage Database Migration

Use this skill to make database changes safe, reviewable, reversible where possible, and release-aware.

## Process
1. Identify what data/schema changes are needed and why.
2. Classify risk: additive, backward-compatible, data-changing, destructive, performance-sensitive, or irreversible.
3. Define the forward migration, rollback strategy, and verification steps.
4. Plan for existing data, backfills, nullability, indexes, constraints, locks, and deployment order.
5. Stop for explicit approval before destructive or irreversible operations.
6. Add tests or dry-run verification where practical.
7. Document release and rollback notes.

## Migration Plan Format
```markdown
# Database Migration Plan

## Purpose
## Current State
## Proposed Change
## Risk Classification
## Forward Migration
## Rollback Plan
## Data Backfill / Existing Data Handling
## Deployment Order
## Verification
## Release Notes
## Approval Needed
```

## Guardrails
- Never run destructive queries without approval and a rollback/blast-radius discussion.
- Never treat migration success as verified without checking the actual migration output and relevant application behavior.
- Do not expose real data or secret values in logs, examples, docs, or reports.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
