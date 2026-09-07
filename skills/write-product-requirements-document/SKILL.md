---
name: write-product-requirements-document
description: "Use when an idea, business goal, user feedback, metric anomaly, or vague product request needs to become a Product Requirements Document. Triggers for PRD drafting, feature specs, product requirements, user stories, product scope, goals, non-goals, success metrics, acceptance criteria inputs, or product decision preparation. Do not use to make final product decisions."
---
# Write Product Requirements Document

Use this skill to turn product intent into a clear PRD that humans can approve. The output prepares decisions; it does not make them.

## Process
1. Inspect available context first: existing notes, task, conversation, design, customer feedback, metrics, or code/docs if relevant.
2. If the problem is unclear, ask a focused batch of 1-3 questions. Prefer questions that unblock the PRD. Do not run a long interview if a useful draft can be written with explicit assumptions.
3. Draft the PRD using the structure below.
4. Mark assumptions clearly. Do not hide uncertainty inside confident requirements.
5. End with decisions the human must make before the PRD is considered approved.

## PRD Structure
```markdown
# [Feature / Product Area] Product Requirements Document

## Overview
## Problem
## Goals
## Non-Goals
## Users / Personas
## Requirements
## Acceptance Criteria Inputs
## Success Metrics
## Constraints
## Risks and Dependencies
## Open Questions
## Decisions Needed
## Out of Scope / Future Considerations
```

## Guardrails
- Do not decide priority, scope, or product direction unless the human explicitly provides the decision.
- Do not invent user research, metrics, or constraints.
- If multiple product directions are plausible, present options and tradeoffs rather than choosing silently.
- Keep the PRD short enough to review; move details to appendices only when necessary.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
