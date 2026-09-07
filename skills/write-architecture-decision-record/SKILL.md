---
name: write-architecture-decision-record
description: "Use when an architectural or technical decision needs a durable Architecture Decision Record. Trigger for ADRs, architecture decisions, technical tradeoffs, accepted/proposed/deprecated decisions, design rationale, or documenting consequences of choices that affect future engineering work."
---
# Write Architecture Decision Record

Use this skill to document a technical decision and its consequences. The record should make future readers understand why the decision was made, not just what was chosen.

## Process
1. Identify the decision being recorded and why it matters now.
2. Capture the relevant context and constraints.
3. List realistic options considered, including doing nothing when appropriate.
4. Explain pros, cons, risks, and operational implications for each option.
5. If the human has not decided, leave the decision as pending.
6. Record consequences clearly: what becomes easier, harder, constrained, or risky.

## Architecture Decision Record Format
```markdown
# ADR: [Decision Title]

## Status
Proposed / Accepted / Deprecated / Superseded

## Context
## Options Considered
### Option 1: [Name]
- Pros
- Cons
- Risks
- Operational implications

## Decision
Pending human decision / [Accepted decision]

## Consequences
## Follow-Up Work
## Related Documents
```

## Guardrails
- Do not fabricate consensus or approval.
- Do not hide tradeoffs to make one option look obviously correct.
- If the decision requires product, security, data, infrastructure, or release judgment, say so explicitly.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
