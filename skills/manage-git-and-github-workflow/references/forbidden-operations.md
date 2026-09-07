# Forbidden Git and GitHub Operations

These operations are forbidden for this skill. Do not perform them even if a user asks.

- Delete local branches.
- Delete remote branches.
- Push to `main` or `master`.
- Force push with `--force` or `--force-with-lease`.
- Run `git reset --hard`.
- Change GitHub Actions secrets or reveal secret values.
- Modify protected branch settings.
- Merge pull requests.
- Trigger production deploy workflows.

Safe alternatives:

- Prepare instructions for a repository owner.
- Create a feature branch and pull request.
- Inspect settings or workflow files without changing protected configuration.
- Explain the risk and ask the human to use GitHub UI/admin controls.
