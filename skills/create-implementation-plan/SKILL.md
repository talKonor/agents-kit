---
name: create-implementation-plan
description: "Use when a scoped task, ticket, or specification needs a concrete implementation plan before code changes. Trigger before touching code for multi-step work, non-trivial refactors, API/data changes, frontend/backend implementation, or any task that needs file-level steps, tests, and verification planned."
---
# Create Implementation Plan

Use this skill after a task or specification is approved and before implementation begins. The plan should be detailed enough that an engineer can execute without inventing scope.

## Process
1. Read the task/specification and acceptance criteria.
2. Inspect the relevant code/docs to understand existing patterns.
3. Map files/modules likely to be created or changed.
4. Break the implementation into small steps with verification points.
5. Include tests before or alongside implementation steps when behavior changes.
6. Identify approval gates before risky work.
7. Save or present the plan for human approval when the work is non-trivial or risky.

## Plan Format
```markdown
# [Task] Implementation Plan

## Goal
## Assumptions
## Affected Areas
## Plan
- [ ] Step 1: [specific action]
- [ ] Step 2: [specific action]

## Tests and Verification
## Risks and Approval Gates
## Follow-Up Not Included
```

## Quality Bar
- Use exact file paths when known.
- Do not write placeholders like "add tests" without naming the behavior to test.
- Do not include unrelated cleanup.
- If the task is too large, recommend splitting it before implementation.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
