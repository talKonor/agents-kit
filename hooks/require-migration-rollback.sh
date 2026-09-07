#!/usr/bin/env bash
set -euo pipefail

# Require rollback evidence when migrations/schema changes are present. Advisory by default.

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$repo_root"

changed=$(git diff --name-only HEAD 2>/dev/null || true)
if [ -z "$changed" ]; then
  echo "require-migration-rollback: no changed files"
  exit 0
fi

migration_changed=$(printf '%s\n' "$changed" | grep -Ei '(^|/)(migrations?|db/migrate|schema|alembic|prisma|liquibase|flyway)(/|\.|$)|schema\.(sql|prisma|rb|json)$' || true)

if [ -z "$migration_changed" ]; then
  echo "require-migration-rollback: no migration/schema changes detected"
  exit 0
fi

rollback_found=$(find .ai/artifacts -type f \( -name 'rollback-plan.md' -o -name 'migration-notes.md' \) 2>/dev/null | head -1 || true)

if [ -n "$rollback_found" ] || [ "${MIGRATION_ROLLBACK_CONFIRMED:-0}" = "1" ]; then
  echo "require-migration-rollback: rollback evidence found"
  exit 0
fi

echo "require-migration-rollback: migration/schema change detected without rollback evidence"
echo "Create .ai/artifacts/<task-id>/rollback-plan.md or migration-notes.md before proceeding."

if [ "${ENFORCE:-0}" = "1" ]; then
  exit 1
fi
exit 0
