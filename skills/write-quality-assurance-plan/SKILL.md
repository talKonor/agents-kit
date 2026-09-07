---
name: write-quality-assurance-plan
description: "Use when a feature, bug fix, release candidate, or risky change needs a QA plan, test checklist, manual verification plan, regression coverage, edge cases, sign-off criteria, or quality-assurance report. Trigger after implementation or before release when behavior must be verified against acceptance criteria."
---
# Write Quality Assurance Plan

Use this skill to plan and document quality assurance for behavior that must be verified beyond normal code review.

## Process
1. Read the task/spec, acceptance criteria, implementation summary, and existing tests if available.
2. Define the test scope.
3. Map acceptance criteria to automated tests, manual checks, or release verification.
4. Identify edge cases, boundary cases, permissions, failure modes, and regression risks.
5. Include environment-specific checks when relevant.
6. Define sign-off criteria and missing evidence.

## QA Plan Format
```markdown
# Quality Assurance Plan

## Scope
## Acceptance Criteria Coverage
## Automated Tests
## Manual Checks
## Regression Areas
## Risk Areas
## Bugs Found
## Missing Coverage
## Sign-Off Criteria
```

## Guardrails
- Do not mark QA complete when evidence is missing.
- Do not write tests against ambiguous behavior without clarifying expected behavior.
- Do not fix application bugs inside this skill; report them with reproduction steps.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
