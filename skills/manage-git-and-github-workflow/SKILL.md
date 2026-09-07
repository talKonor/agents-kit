---
name: manage-git-and-github-workflow
description: "Use for safe local Git and GitHub workflow support: git status, diffs, fetching updates, creating feature branches, committing selected changes, pushing feature branches, preparing pull requests, checking pull request status, inspecting GitHub Actions runs or logs, editing approved GitHub Actions workflow files, or debugging GitHub Actions failures. Never use for deleting branches, pushing to main or master, force pushing, git reset --hard, changing GitHub Actions secrets, modifying protected branch settings, merging pull requests, or triggering production deploy workflows."
---

# Manage Git and GitHub Workflow

Use this skill when the task involves local Git operations, GitHub pull request workflow, or GitHub Actions workflow files/status.

## Safety model

Classify the requested operation before running commands.

### Allowed without approval

These are read-only or low-risk operations:

- `git status`
- `git diff`
- `git diff --staged`
- `git log` with reasonable limits
- `git branch --show-current`
- `git fetch`
- `git pull --ff-only` after checking the current branch
- `git switch <existing-branch>` when the target is not `main` or `master`
- `git switch -c <feature-branch>`
- `git add <specific-files>` after showing what will be staged
- `git commit` after summarizing staged changes
- `gh pr view`, `gh pr status`, `gh pr checks`, `gh run list`, `gh run view`
- inspecting GitHub Actions logs or workflow files

### Approval-gated

Ask for explicit human approval before:

- pushing a feature branch
- rebasing a local feature branch
- merging `main` or `master` into a feature branch
- resolving merge conflicts
- editing GitHub Actions workflow files
- triggering a non-production workflow
- committing large, mixed, or ambiguous changes

Before approval, state the exact command or file change, why it is needed, and the expected effect.

### Forbidden

Do not perform these actions, even if asked:

- delete local or remote branches
- push to `main` or `master`
- force push, including `--force` or `--force-with-lease`
- run `git reset --hard`
- change GitHub Actions secrets or secret values
- modify protected branch settings
- merge pull requests
- trigger production deploy workflows
- expose credentials, tokens, private keys, cookies, or secret values

If the user asks for a forbidden action, refuse that action briefly and offer a safe alternative, such as preparing instructions for a human owner.

## Standard workflow

1. Inspect state first.
   - Run `git status` before making changes.
   - Identify the current branch.
   - Check whether there are uncommitted or staged changes.

2. Protect existing work.
   - Do not overwrite, discard, or reset uncommitted work.
   - If unrelated changes exist, ask how to handle them or work around them.
   - Never stage unrelated files silently.

3. Plan the Git operation.
   - State what will be changed locally.
   - State whether GitHub or CI will be affected.
   - State whether approval is required.

4. Execute only safe or approved commands.
   - Prefer specific file paths over broad commands.
   - Prefer feature branches over direct changes to shared branches.
   - Prefer `pull --ff-only` over merge pulls unless the user requests otherwise.

5. Verify and report.
   - Run `git status` after changes.
   - Report branch, staged files, commit hash if created, PR URL if created, and any CI status checked.

## Branch creation

When creating a branch:

1. Check current branch and worktree state.
2. Fetch remote updates.
3. Create a feature branch with a clear name.
4. Do not create branches from a dirty or unknown state unless the user approves.

Use branch names that are short, lowercase, and descriptive, such as:

- `feature/add-impression-tracking`
- `fix/session-id-event-payload`
- `chore/update-release-checklist`

## Committing changes

Before committing:

1. Show a summary of changed files.
2. Stage only files relevant to the task.
3. Review staged diff.
4. Write a clear commit message.
5. Commit only after the staged changes are understood.

Prefer commit messages in this style:

- `feat: add recommendation impression tracking`
- `fix: prevent duplicate impression events`
- `test: cover anonymous session payloads`
- `docs: update release checklist`
- `ci: add backend test workflow`

Do not create commits containing unrelated changes.

## Pull request preparation

When preparing a pull request:

1. Confirm the branch is a feature branch.
2. Confirm there are no unrelated changes.
3. Summarize what changed and why.
4. Include tests and verification evidence.
5. Note risks, follow-ups, and required reviewers.
6. Do not merge the pull request.

Suggested pull request body:

```markdown
## Summary
- ...

## Verification
- ...

## Risks / Notes
- ...

## Follow-ups
- ...
```

## GitHub Actions workflow changes

When editing `.github/workflows/*.yml` or `.github/workflows/*.yaml`:

1. Treat the change as approval-gated.
2. Inspect existing workflow patterns first.
3. Preserve least-privilege permissions.
4. Do not add secrets or print secret values.
5. Avoid broad tokens or unnecessary write permissions.
6. Prefer explicit job permissions.
7. Explain trigger changes, environment effects, caching behavior, and deployment implications.
8. Verify syntax when practical.

Never change GitHub Actions secrets or protected branch settings.

## Debugging GitHub Actions failures

When debugging a failed workflow:

1. Identify the workflow, run, job, and failing step.
2. Read the relevant logs.
3. Separate infrastructure/setup failures from test/build failures.
4. Identify the likely root cause and evidence.
5. Suggest the smallest safe fix.
6. State what should be rerun to verify.

Do not hide flaky or intermittent behavior. Label it clearly.

## Output format

Use this format when reporting results:

```markdown
### Git/GitHub Task
What was requested.

### Repository State
Current branch, relevant changes, and any risks.

### Actions Taken
Commands or file changes performed.

### Verification
What was checked and what passed or failed.

### Next Step
What the human should review, approve, push, or verify next.
```

## Completion rule

Do not say the Git or GitHub task is complete unless you report what was checked afterward. At minimum, include the final branch and `git status` result.

## Repository Rules

Follow `CLAUDE.md`. In particular: preserve human decision authority, do not expand scope silently, do not expose credentials or secret values, write durable artifacts under `.ai/artifacts/<task-id>/` when a handoff artifact is needed, and verify before claiming completion. If `CLAUDE.md` conflicts with the safety rules in this skill, use the stricter rule.
