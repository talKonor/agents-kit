---
name: write-acceptance-criteria
description: "Use when a PRD, feature spec, task, user story, bug, or product requirement needs verifiable acceptance criteria. Triggers include done criteria, acceptance tests, QA-ready requirements, definition of done, behavior verification, or turning ambiguous requirements into checkable outcomes."
---
# Write Acceptance Criteria

Use this skill to turn requirements into criteria that engineering, quality assurance, review, and release can verify.

## Process
1. Read the requirement, PRD, user story, or task.
2. Extract the intended behavior and user-visible outcome.
3. Separate functional criteria from non-functional criteria.
4. Write criteria as observable outcomes, not implementation details.
5. Add negative/error cases where relevant.
6. Flag ambiguity instead of writing criteria for behavior that has not been decided.

## Acceptance Criteria Format
```markdown
# Acceptance Criteria: [Feature / Task]

## In Scope
- [ ] Given [context], when [action], then [observable result].

## Error and Edge Cases
- [ ] Given [failure/edge condition], when [action], then [safe expected result].

## Non-Functional Criteria
- [ ] Performance / reliability / accessibility / privacy / observability criteria where relevant.

## Not Yet Decided
- [Questions that require human decision]
```

## Quality Bar
- Each criterion must be testable by automated test, manual QA, code review, or release verification.
- Avoid vague words like "fast", "intuitive", "robust", or "better" unless paired with a measurable or observable standard.
- Do not add requirements that are not in the source material unless clearly labeled as suggestions.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
