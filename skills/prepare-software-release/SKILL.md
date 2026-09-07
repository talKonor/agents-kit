---
name: prepare-software-release
description: "Use when preparing a staging or production release, release candidate, deploy readiness review, release notes, rollback plan, blocker list, migration/config/security checklist, or post-deploy verification plan. Trigger before deployment or when deciding if a set of changes is ready for human go/no-go review."
---
# Prepare Software Release

Use this skill to assemble release readiness evidence so humans can decide whether to ship.

## Process
1. Identify release scope: PRs, commits, tasks, diff, branch, version, and target environment.
2. Collect evidence: CI, tests, QA, code review, security review, migration review, staging checks.
3. Classify changes: feature, fix, refactor, docs, infra, security, migration, config, API contract.
4. Check release blockers, risks, rollback plan, and post-deploy verification.
5. Mark missing evidence as `Needs review`, never as pass.
6. Produce release notes and readiness assessment. Do not deploy.

## Release Artifact Format
```markdown
# Release Readiness

## Release Scope
## Checklist Status
## Blockers
## Risks to Monitor
## Release Notes
## Migration / Configuration Notes
## Rollback Plan
## Post-Deploy Verification
## Readiness Assessment
```

## Guardrails
- Do not make go/no-go decisions.
- Do not deploy or run production-mutating commands.
- Do not mark readiness as pass when evidence is missing.
- Treat migrations, infrastructure, security/privacy, and production config changes as high risk.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
