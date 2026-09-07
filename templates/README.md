# Templates

These templates define the durable artifacts produced by agents and skills in this production kit.

Use them under `.ai/artifacts/<task-id>/` for real workflow handoffs, reviews, decisions, and release readiness. Do not create loose Markdown files in the repository root.

## Template index

| Template | Use for |
|---|---|
| `product-requirements-document-template.md` | Turning product thinking into a clear PRD draft. |
| `technical-specification-template.md` | Translating approved product requirements into technical design. |
| `architecture-decision-record-template.md` | Capturing architecture decisions and rationale. |
| `implementation-summary-template.md` | Summarizing what was implemented and verified. |
| `quality-assurance-plan-template.md` | Planning QA coverage before or after implementation. |
| `quality-assurance-report-template.md` | Reporting QA results, bugs, coverage, and sign-off criteria. |
| `code-review-report-template.md` | Independent code review findings. |
| `security-and-privacy-review-template.md` | Security/privacy review findings and risk posture. |
| `release-checklist-template.md` | Release readiness assessment. |
| `rollback-plan-template.md` | Rollback procedure and safety checks. |
| `post-deploy-verification-template.md` | Post-deployment validation evidence. |
| `git-and-github-workflow-summary-template.md` | Branch/commit/PR/GitHub Actions workflow summary. |

## Source conventions

These templates are adapted from common industry practices: product requirements documents, architecture decision records, GitHub pull request/review conventions, QA test planning, release readiness checklists, security review reports, and Claude/Superpowers-style agentic workflow discipline.

## Global rules

- Human decisions remain explicit.
- Drafts are not approvals.
- Missing evidence is not pass.
- Secrets and credentials must never be exposed.
- Durable artifacts should live under `.ai/artifacts/<task-id>/`.
