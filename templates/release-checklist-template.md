# Release Checklist: <Version / Release Name>

## Release Status

Ready for human go/no-go review / Ready with risks / Needs human decision / Not ready

## Release Scope

Environment: Staging / Production / Other

Branch / commit / tag:

Included PRs / tasks:

Excluded or deferred work:

## Required Evidence

Missing evidence is `Needs review`, not `Pass`.

## Checklist

### Code

| Check | Status | Evidence / Notes |
|---|---|---|
| All changes reviewed | Pass / Fail / Needs review / N/A |  |
| No known blocking review issues | Pass / Fail / Needs review / N/A |  |
| CI passing | Pass / Fail / Needs review / N/A |  |
| No tests skipped/suppressed without approval | Pass / Fail / Needs review / N/A |  |

### Quality Assurance

| Check | Status | Evidence / Notes |
|---|---|---|
| Acceptance criteria verified | Pass / Fail / Needs review / N/A |  |
| Regression checks completed | Pass / Fail / Needs review / N/A |  |
| Manual QA completed where needed | Pass / Fail / Needs review / N/A |  |

### Migrations and Data

| Check | Status | Evidence / Notes |
|---|---|---|
| Migrations reviewed | Pass / Fail / Needs review / N/A |  |
| Rollback path documented | Pass / Fail / Needs review / N/A |  |
| No destructive data changes without approval | Pass / Fail / Needs review / N/A |  |

### Configuration and Infrastructure

| Check | Status | Evidence / Notes |
|---|---|---|
| Environment config verified without exposing secret values | Pass / Fail / Needs review / N/A |  |
| Infrastructure changes reviewed | Pass / Fail / Needs review / N/A |  |
| IAM / permission changes reviewed | Pass / Fail / Needs review / N/A |  |

### Security and Privacy

| Check | Status | Evidence / Notes |
|---|---|---|
| Security-sensitive changes reviewed | Pass / Fail / Needs review / N/A |  |
| PII/user/session/behavioral data changes reviewed | Pass / Fail / Needs review / N/A |  |

### Observability

| Check | Status | Evidence / Notes |
|---|---|---|
| Logs/metrics/alerts defined where needed | Pass / Fail / Needs review / N/A |  |
| Post-deploy verification defined | Pass / Fail / Needs review / N/A |  |

### Rollback

| Check | Status | Evidence / Notes |
|---|---|---|
| Rollback plan documented | Pass / Fail / Needs review / N/A |  |
| Previous version deployable if needed | Pass / Fail / Needs review / N/A |  |
| Data/config rollback implications understood | Pass / Fail / Needs review / N/A |  |

## Blockers

If none, write: `No blockers found.`

## Risks to Monitor

| Risk | Signal to Watch | Owner |
|---|---|---|
|  |  |  |

## Release Notes

### What Is Changing

### Changes Included

- [type] description — link

Types: feature, fix, chore, refactor, infrastructure, security, documentation

### Breaking Changes

None / Details:

### Migration Notes

None / Details:

## Readiness Assessment

Choose one:

- Ready for human go/no-go review
- Ready with noted risks for human decision
- Needs human decision
- Not ready — blockers present
