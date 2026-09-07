---
name: product-discovery-to-requirements-workflow
description: "Use when an idea, business goal, user feedback, metric anomaly, or vague product request needs to be turned into a Product Requirements Document and acceptance criteria. Trigger before technical design or implementation begins. Do not use when product scope is already approved."
---
# Product Discovery to Requirements Workflow

Use this workflow when work starts from an idea, user problem, feedback, business goal, metric signal, or rough opportunity and there is no approved product requirements document yet.

## Do not use when

- A product requirements document and acceptance criteria already exist and are approved.
- The work is only a technical bug fix with known expected behavior.
- The request is only to update docs, release, or review code.

## Role sessions

1. `product-manager`
2. Human approver

Use one Product Manager session. Do not switch into engineer mode during this workflow.

## Skills

- `brainstorm-with-constraints`
- `write-product-requirements-document`
- `write-acceptance-criteria`

## Required artifacts

Write artifacts under `.ai/artifacts/<task-id>/`:

- `product-requirements-document.md`
- `acceptance-criteria.md`
- `product-decision-log.md` when product decisions are made

## Process

1. Clarify the problem, user, goal, constraints, and non-goals.
2. Ask a small focused batch of questions when needed. Do not run an endless interview.
3. Draft a product requirements document with explicit assumptions.
4. Draft acceptance criteria that QA and engineering can verify.
5. List open questions and decisions needed.
6. Stop for human approval before moving to technical design or implementation.

## Human approval gates

The human must approve:

- Problem framing
- Goals and non-goals
- Scope
- Acceptance criteria
- Any priority or product tradeoff

## Exit criteria

- `product-requirements-document.md` exists.
- Acceptance criteria are verifiable.
- Open questions and decisions needed are explicit.
- The human has approved the requirement artifact or marked it as pending.
