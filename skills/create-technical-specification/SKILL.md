---
name: create-technical-specification
description: "Use after product scope is approved and a technical design, technical specification, system proposal, interface design, data model proposal, rollout plan, or engineering tradeoff analysis is needed. Trigger for non-trivial changes touching architecture, APIs, data, infrastructure, reliability, security, observability, or cross-component behavior."
---
# Create Technical Specification

Use this skill to convert approved product intent into a technical specification that can be reviewed before implementation.

## Process
1. Confirm the product scope or accepted requirement exists. If not, ask for the missing product decision.
2. Inspect the current codebase/docs enough to understand existing patterns and constraints.
3. Identify affected systems, APIs, data models, components, infrastructure, and operational surfaces.
4. Present the proposed design with tradeoffs and risks.
5. Mark any recommendation as pending human approval.
6. Stop before implementation unless the human explicitly approves moving forward.

## Technical Specification Structure
```markdown
# [Feature / Change] Technical Specification

## Context
## Goals and Non-Goals
## Current System
## Proposed Design
## Interfaces and Contracts
## Data Model / Data Flow
## Migration and Rollout Plan
## Testing Strategy
## Observability
## Security and Privacy Considerations
## Operational / Release Considerations
## Alternatives Considered
## Risks
## Decisions Needed
```

## Guardrails
- Do not treat a technical proposal as approved.
- Do not introduce new services, dependencies, infrastructure, or architecture patterns without calling them out.
- If the design touches security, infrastructure, release, or data migration risk, flag the specialist review needed.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
