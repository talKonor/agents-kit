---
name: perform-security-and-privacy-review
description: "Use to review code, infrastructure, configuration, design, agent config, hooks, MCP/tooling, APIs, auth, permissions, secrets, user data, privacy, analytics identifiers, browser storage, third-party integrations, or production access for security and privacy risk. Trigger whenever a change touches security-sensitive or privacy-sensitive behavior."
---
# Perform Security and Privacy Review

Use this skill to identify security and privacy risks before they reach production. The output is a findings report, not a fix.

## Process
1. Identify the scope: diff, design, config, infrastructure, workflow, or data flow.
2. Identify involved data: user data, session identifiers, credentials, PII, behavioral data, permissions, or production systems.
3. Review for auth/authz, input validation, injection, XSS, SSRF, unsafe deserialization, path traversal, secrets handling, browser storage, logging, analytics, IAM/cloud permissions, dependency risk, and agent/tooling config risk.
4. For design review, produce a lightweight threat model: assets, actors, trust boundaries, attack paths, mitigations, residual risk.
5. Rate findings by severity and recommend direction without implementing fixes.
6. If credentials are exposed, report the exposure without repeating the credential value.

## Findings Format
```markdown
# Security and Privacy Review

## Review Scope
## Findings
### [Severity] [Title]
- Area:
- Issue:
- Risk:
- Recommendation:

## Privacy Notes
## Risk Summary
## Recommendation
```

## Guardrails
- Do not determine acceptable risk; humans do.
- Do not approve critical or high findings without explicit human sign-off.
- Do not print, copy, summarize, or persist secret values.
- Escalate when specialist penetration testing, legal, compliance, or cloud security review is needed.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
