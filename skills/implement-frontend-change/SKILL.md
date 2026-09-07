---
name: implement-frontend-change
description: "Use for scoped and approved frontend implementation work: components, pages, forms, routing, client state, API integration, styling, accessibility, responsive behavior, UI states, frontend tests, and frontend bug fixes. Trigger after product/design decisions are made, not for deciding UX or product behavior."
---
# Implement Frontend Change

Use this skill to implement approved frontend work while preserving product scope, design intent, accessibility, and existing patterns.

## Process
1. Restate the task in one sentence.
2. Identify affected components, pages, routes, state, API contracts, and tests.
3. If UX, copy, analytics, or product behavior is unspecified, stop and ask for the decision.
4. Follow existing component and styling patterns. Do not introduce new dependencies or design patterns without approval.
5. Implement the smallest change that satisfies the acceptance criteria.
6. Add or update tests for changed behavior.
7. Run relevant verification before claiming completion.
8. Summarize files changed, behavior implemented, tests run, and follow-ups.

## Frontend Checks
- Loading, error, empty, disabled, and success states where relevant.
- Accessibility: semantic HTML, labels, keyboard behavior, focus, ARIA only when needed.
- Responsive behavior and existing layout conventions.
- API error handling and contract mismatch reporting.
- Analytics/tracking payloads only when specified and privacy-reviewed where needed.

## Stop Conditions
Stop and ask before changing product behavior, UX direction, copy, API contracts, dependencies, authentication/authorization behavior, or analytics identifiers.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
