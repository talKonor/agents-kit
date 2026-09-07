---
name: bug-fix-debugging-workflow
description: "Use when a bug, test failure, build failure, production issue, integration problem, performance problem, or unexpected behavior needs to be debugged and fixed. Trigger for root cause investigation, reproduction, hypothesis testing, minimal fix, and verification. Do not use for new feature work or approved scoped implementation."
---
# Bug Fix / Debugging Workflow

Use this workflow when behavior is broken, unclear, flaky, failing in CI, or reported by users/QA/production signals.

## Do not use when

- The work is a known planned feature.
- The expected behavior is not defined. Clarify acceptance criteria first.
- The fix requires an architecture decision before debugging can begin.

## Role sessions

1. Relevant engineer: `frontend-engineer`, `backend-engineer`, or `devops-engineer`
2. `qa-engineer`
3. `code-reviewer`
4. `release-manager` if the fix is shipping urgently

## Skills

- `systematically-debug-issue`
- `write-software-tests`
- `verify-before-completion`
- `review-code-change`
- `prepare-software-release` when shipping

## Required artifacts

- `debugging-notes.md`
- `implementation-summary.md`
- `quality-assurance-report.md`
- `code-review-report.md`
- `release-checklist.md` when shipping

## Process

1. Reproduce the issue or document why reproduction is not possible.
2. Collect evidence before changing code.
3. Form a hypothesis and test it.
4. Identify root cause before implementing a fix.
5. Make the smallest safe fix.
6. Add or update a regression test where practical.
7. Verify the fix and record evidence.
8. Run independent QA and code review.

## Human approval gates

Human approval is required for:

- Behavior changes beyond the bug fix
- Risky production hotfixes
- Fixes that change contracts, migrations, or infrastructure
- Shipping without complete verification

## Exit criteria

- Root cause is documented or explicitly unknown.
- Minimal fix is implemented.
- Regression coverage exists or the gap is documented.
- Verification evidence is recorded.
- Review blockers are resolved or escalated.
