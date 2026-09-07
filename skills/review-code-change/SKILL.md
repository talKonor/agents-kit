---
name: review-code-change
description: "Use to independently review code changes, diffs, pull requests, implementation summaries, or changed files before approval or merge. Trigger after implementation and before human approval when correctness, tests, scope, maintainability, regressions, architecture fit, security-sensitive patterns, or production risk must be assessed."
---
# Review Code Change

Use this skill to review a code change critically and independently. The reviewer is not the implementer.

## Process
1. Identify the review scope: diff, PR, branch, files, or implementation summary.
2. Identify the intended task/spec and acceptance criteria.
3. Inspect the changed code and relevant surrounding context.
4. Review correctness, scope, tests, maintainability, contracts, observability, security-sensitive patterns, and release implications.
5. Run only safe non-mutating verification commands when useful.
6. Separate blocking issues from non-blocking improvements.
7. Flag specialist review needed instead of pretending to cover everything.

## Safe Command Policy
Use commands only in check-only or read-only mode: tests, type checks, lint checks, `git diff`, `git status`, and grep-like inspection. Do not run formatters, fixers, package installers, migrations, code generators, snapshot updates, dependency update commands, deploy commands, or commands that mutate files, data, infrastructure, environments, or production systems.

## Review Report Format
```markdown
# Code Review

## Review Scope
## Summary
## Blocking Issues
## Non-Blocking Issues
## Missing Tests
## Specialist Review Needed
## Verification
## Recommendation
```

## Guardrails
- Do not implement fixes.
- Do not approve changes with unresolved blocking issues.
- Do not treat passing tests as proof the change is correct.
- Do not bury blocking issues under style comments.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
