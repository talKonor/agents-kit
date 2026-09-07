---
name: create-or-improve-skill
description: "Use when creating, rewriting, reviewing, improving, testing, or standardizing a skill in this repository. Trigger for SKILL.md authoring, skill descriptions, skill folder structure, references/scripts/assets decisions, eval prompts, description trigger quality, or converting a repeated workflow into a reusable skill."
---
# Create Or Improve Skill

Use this skill to create or improve skills in the repository using Claude-style skill conventions.

## Process
1. Capture intent from the conversation and existing workflow before asking new questions.
2. Clarify: expected input, expected output, trigger conditions, tools/connectors, examples, edge cases, and whether scripts/references/assets are useful.
3. Write a strong `description` in frontmatter. The description is the primary trigger mechanism; it must say what the skill does and when to use it.
4. Keep `SKILL.md` operational and lean. Move long examples, templates, or domain details into `references/` when useful.
5. Prefer imperative instructions and explain why important rules exist.
6. Add 2-3 realistic test prompts for future validation when the skill is non-trivial.
7. Review the skill for surprise, unsafe behavior, over-broad triggering, and vague outputs.

## Skill Structure
```text
skill-name/
  SKILL.md
  references/   # optional
  scripts/      # optional
  assets/       # optional
```

## SKILL.md Requirements
```yaml
---
name: skill-name
description: "clear trigger + what this skill does + when to use it"
---
```

## Guardrails
- Do not create misleading, hidden, or unsafe skills.
- Do not add scripts unless deterministic execution improves reliability.
- Do not stuff all knowledge into `SKILL.md`; use progressive disclosure.

## Repository Rules
Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion.
