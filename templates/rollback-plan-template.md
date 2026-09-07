# Rollback Plan: <Release / Change Name>

## Status

Draft / Ready / Executed / Not Applicable

## Scope

What change or release does this rollback cover?

Environment:

Related release checklist:

## Rollback Trigger

Rollback should be considered if:

- 

## Rollback Type

- Code revert
- Configuration revert
- Feature flag disable
- Database rollback
- Infrastructure rollback
- Manual mitigation
- Other:

## Preconditions

Before rollback:

- [ ] Human approval obtained.
- [ ] Blast radius understood.
- [ ] Current state captured: logs, metrics, errors, deployment ID, affected users.
- [ ] Communication owner assigned if users/team are affected.

## Steps

| Step | Action | Owner | Expected Result | Risk |
|---|---|---|---|---|
| 1 |  |  |  |  |

## Data / Migration Considerations

Does rollback require data migration or repair? Yes / No

If yes, describe safe path:

Destructive actions forbidden without explicit human approval:

## Verification After Rollback

| Check | Expected Result | Evidence |
|---|---|---|
|  |  |  |

## Communication

Who needs to know?

What should be communicated?

## Risks and Limitations

- 

## Follow-Up After Rollback

- Incident review needed: Yes / No
- Bug/task to fix root cause:
- Monitoring period:

## Notes

Do not expose secrets, credentials, or sensitive production data in this plan.
