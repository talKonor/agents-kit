# Skills

This directory contains the reusable workflows used by agents in this repository.

## How Skills Work

Skills are the **how**. Agents are the **interface**.

- Agents in `agents/*.md` define a role (backend-engineer, security-engineer, etc.) and list which skills they can use.
- Skills in `skills/*/SKILL.md` define a specific workflow (implement a backend change, review code, write tests, etc.).
- Claude reads each skill's `description` to know when to invoke it. Agents do not need to specify when — only what is available.

## Conventions

- One folder per skill
- `SKILL.md` is the required entrypoint
- YAML frontmatter with `name` and `description`
- Concise operational instructions
- Strong trigger descriptions
- Human approval gates where decisions matter
- Verification before completion
- Global repository policy lives in `CLAUDE.md`; skills delegate to it rather than restating it

## Skill Index

### Core production skills

- `write-product-requirements-document`
- `write-acceptance-criteria`
- `create-technical-specification`
- `write-architecture-decision-record`
- `break-down-product-work-into-tasks`
- `create-implementation-plan`
- `implement-frontend-change`
- `implement-backend-change`
- `manage-api-contract-change`
- `manage-database-migration`
- `write-software-tests`
- `write-quality-assurance-plan`
- `review-code-change`
- `perform-security-and-privacy-review`
- `update-project-documentation`
- `prepare-software-release`
- `manage-git-and-github-workflow`

### Methodology / meta skills

- `brainstorm-with-constraints`
- `create-or-improve-skill`
- `systematically-debug-issue`
- `verify-before-completion`

## Maintenance

These skills are not final. Test them against real work and improve based on observed failures, repeated manual work, and human feedback.
