---
name: write-software-tests
description: "Use when adding or updating automated tests for new behavior, changed behavior, bugs, regressions, API changes, frontend behavior, backend behavior, edge cases, or acceptance criteria. Trigger when implementation changes behavior or when verification evidence is missing."
---
# Write Software Tests

Use this skill to create meaningful tests that verify behavior, not implementation trivia.

## Process
1. Identify the behavior under test and the acceptance criteria it supports.
2. Inspect existing tests to avoid duplication and follow project style.
3. Choose the right level: unit, integration, end-to-end, regression, contract, or smoke test.
4. Write tests with clear names and one reason to fail.
5. Include happy path, boundary/error cases, permission cases, and regressions where relevant.
6. Run the targeted test command. If possible, also run the broader affected test set.
7. Report exact commands and results.

## Testing Standards
- Prefer behavior-oriented assertions.
- Do not write tests that only prove mocks were called unless the interaction itself is the behavior.
- For bug fixes, create a test that would fail before the fix when practical.
- For contract changes, test both valid and invalid payloads.
- For UI changes, test user-visible behavior and important accessibility states where practical.

## Output
Report new/changed tests, what they cover, commands run, pass/fail output, and any remaining unverified areas.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
