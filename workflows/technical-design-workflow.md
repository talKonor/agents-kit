---
name: technical-design-workflow
description: "Use when an approved product requirement needs technical design before implementation: architecture decisions, system proposal, interface design, data model proposal, rollout plan, or engineering tradeoff analysis. Trigger for non-trivial changes touching architecture, APIs, data, infrastructure, reliability, security, or observability. Do not use when the design is already approved."
---
# Technical Design Workflow

Use this workflow when approved product work has architectural, data, API, infrastructure, scalability, reliability, security, or long-term technical implications.

## Do not use when

- The task is small and implementation is obvious within existing patterns.
- The work is only a copy, style, or documentation update.
- There is no technical decision to record.

## Role sessions

1. `architect`
2. `security-engineer` if security or privacy sensitive
3. `devops-engineer` if infrastructure, deployment, CI/CD, or runtime configuration is affected
4. Human approver

Each review role should run as a separate session when its judgment matters.

## Skills

- `create-technical-specification`
- `write-architecture-decision-record`
- `perform-security-and-privacy-review` when needed
- `verify-before-completion`

## Required artifacts

- `technical-specification.md`
- `architecture-decision-record.md` when an architectural decision is made or proposed
- `security-and-privacy-review.md` when security/privacy is involved

## Process

1. Read the approved product requirements and acceptance criteria.
2. Identify affected systems, APIs, data models, environments, and ownership boundaries.
3. Present options and tradeoffs neutrally.
4. Mark recommendations as pending human approval.
5. Flag downstream review needs instead of silently involving roles.
6. Record decisions, consequences, open questions, and rollback/rollout concerns.
7. Stop for human approval before implementation.

## Human approval gates

The human must approve:

- Technical direction
- Architecture decision record status
- High-impact, irreversible, or expensive-to-reverse choices
- Security, privacy, data, infrastructure, or release tradeoffs

## Exit criteria

- Technical direction is documented.
- Open technical decisions are visible.
- Required specialist reviews are complete or explicitly pending.
- Human approval or pending status is recorded.
