---
name: systematically-debug-issue
description: "Use when debugging any bug, test failure, build failure, production issue, unexpected behavior, integration problem, performance problem, flaky behavior, or failed fix attempt. Trigger before proposing fixes when the root cause is not yet proven."
---
# Systematically Debug Issue

Use this skill to debug by evidence, not guessing. The goal is root cause first, fix second.

## Process
1. Read the error, logs, test output, or observed behavior carefully.
2. Reproduce the issue or state exactly why it cannot be reproduced yet.
3. Check recent changes, environment differences, dependencies, and configuration.
4. Trace the failing behavior through component boundaries until the failing layer is identified.
5. Compare against similar working code or known-good behavior.
6. Form one specific hypothesis and test it with the smallest safe check.
7. Once root cause is proven, create or identify a failing test where practical.
8. Implement a minimal fix only after root cause is understood.
9. Verify the fix and report evidence.

## Stop Conditions
- If three fix attempts fail, stop and question the design or architecture before trying another fix.
- If the issue is not reproducible, gather more evidence instead of guessing.
- If the proposed fix is a symptom patch, stop and return to root cause investigation.

## Debug Report Format
```markdown
# Debug Report

## Symptom
## Reproduction
## Evidence Collected
## Root Cause
## Fix Strategy
## Verification
## Remaining Risk
```

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
