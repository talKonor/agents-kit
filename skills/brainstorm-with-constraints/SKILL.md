---
name: brainstorm-with-constraints
description: "Use before product or technical work is specified when the user has a rough idea, problem, opportunity, feedback, design direction, or ambiguous request and needs structured options, tradeoffs, assumptions, and a decision-ready direction. Trigger before writing PRDs, specs, or implementation plans when intent is not yet clear."
---
# Brainstorm With Constraints

Use this skill to structure early thinking without letting the model take ownership of product or architecture decisions.

## Process
1. Inspect relevant context if available: product notes, code, docs, feedback, metrics, or previous decisions.
2. Clarify the problem, user, desired outcome, constraints, and non-goals. Ask a focused batch of 1-3 questions when needed.
3. Propose 2-3 viable approaches with tradeoffs.
4. Identify assumptions, risks, dependencies, and what must be decided by the human.
5. Recommend a direction only if asked; label it as a recommendation pending human approval.
6. Once the human chooses direction, transition to the relevant artifact skill: product requirements, technical specification, task breakdown, or implementation plan.

## Output Format
```markdown
# Brainstorming Summary

## Problem Framing
## Constraints
## Options
## Tradeoffs
## Assumptions
## Risks
## Decision Needed
## Suggested Next Artifact
```

## Guardrails
- Do not write code.
- Do not treat brainstorming output as approved scope.
- Do not bury product or architecture decisions inside wording choices.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
