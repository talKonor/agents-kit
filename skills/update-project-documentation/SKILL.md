---
name: update-project-documentation
description: "Use when code, APIs, behavior, configuration, workflows, runbooks, setup steps, release process, or architecture changes require documentation updates. Trigger after implementation or review when README, API docs, technical docs, runbooks, onboarding docs, or decision records may drift from the product/codebase."
---
# Update Project Documentation

Use this skill to keep documentation aligned with the actual product and codebase.

## Process
1. Identify what changed and which documents may be affected.
2. Inspect existing documentation before creating new docs.
3. Update the smallest set of documents that users, engineers, operators, or future agents will rely on.
4. Prefer updating existing docs over adding duplicate docs.
5. Keep docs factual: what changed, how to use it, how to operate it, how to verify it.
6. If documentation depends on an unresolved decision, mark it pending rather than pretending it is final.

## Documentation Targets
- README or setup instructions.
- API/contract documentation.
- Technical specs or architecture notes.
- Runbooks and operational procedures.
- QA/release verification instructions.
- Decision records.

## Guardrails
- Do not document behavior that was not implemented or approved.
- Do not include secret values, credentials, private URLs, or sensitive operational details.
- Do not create new documentation locations without checking existing conventions.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
