---
name: verify-before-completion
description: "Use before claiming any work is complete, fixed, passing, ready, verified, done, reviewed, or safe. Trigger before final status updates, PR creation, commits, releases, handoffs, or moving to the next task when evidence is required."
---
# Verify Before Completion

Use this skill to ensure completion claims are backed by fresh evidence.

## Rule
No completion claim without fresh verification evidence.

## Process
1. Identify the claim you are about to make.
2. Identify the command, checklist, review, or evidence that proves the claim.
3. Run or inspect the full relevant verification evidence.
4. Read the output carefully: exit code, failures, skipped tests, warnings, missing evidence.
5. Report the actual status with evidence.
6. If verification is incomplete, say exactly what is unverified.

## Claim Requirements
- "Tests pass" requires actual test output.
- "Build passes" requires build output.
- "Bug fixed" requires reproducing the original symptom or a regression test.
- "Requirements met" requires criteria-by-criteria verification.
- "Ready for release" requires release checklist evidence.

## Output Format
```markdown
# Verification Summary

## Claim
## Evidence Checked
## Result
## Remaining Unverified Areas
## Next Step
```

## Guardrails
- Do not use words like done, fixed, ready, passing, complete, or verified without evidence.
- Do not rely only on another agent's success report.
- Do not treat partial checks as full verification.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
