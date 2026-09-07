---
name: break-down-product-work-into-tasks
description: "Use when an approved product requirement, technical specification, feature, or project needs to be decomposed into actionable engineering tasks. Trigger for task breakdown, delivery planning, sequencing, dependency mapping, ticket creation, implementation slices, or turning PRD/spec work into scoped tasks."
---
# Break Down Product Work Into Tasks

Use this skill to turn approved product or technical work into small, scoped tasks that can be implemented, reviewed, and verified independently.

## Process
1. Confirm the source requirement or specification is approved enough to decompose.
2. Identify major work areas and dependencies.
3. Slice work into tasks that produce independently reviewable progress.
4. Keep each task scoped to a coherent change. Avoid giant mixed frontend/backend/data/release tasks unless the coupling is unavoidable.
5. For each task, include scope, acceptance criteria, likely owner role, dependencies, risks, and verification.
6. Flag any task that needs architecture, security, database migration, release, or product decision before implementation.

## Task Format
```markdown
### TASK-[id]: [Task Title]
**Owner role:** frontend-engineer / backend-engineer / devops-engineer / product-manager / architect / qa-engineer / security-engineer / release-manager
**Scope:**
**Out of scope:**
**Inputs:**
**Acceptance criteria:**
**Dependencies:**
**Risks / decisions needed:**
**Verification:**
```

## Guardrails
- Do not prioritize tasks unless explicitly asked; sequencing is not the same as business priority.
- Do not hide uncertain work inside implementation tasks. Make uncertainty visible.
- Do not create tasks with vague verbs like "improve", "handle", or "support" without defining the outcome.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
