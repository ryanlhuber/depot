# Merge checklist

**Change:** <identifier or link> **Head revision:** <commit hash> **Target branch:** <branch, read from configuration>
**Risk:** low | medium | high **Checked:** <date>

Mark each item Met, Not met, or Cannot verify, and give the evidence. Cannot verify counts as not met.

| Item | Status | Evidence |
| --- | --- | --- |
| Required tests pass | | <link or output> |
| Head revision is covered by the reviews: the revision both examined, or a re-review recorded by `review-reconciliation` that names the approved revision, repair revision, and verified scope | | <revisions, and the tier record if used> |
| First review: PASS, bound to that revision | | <report> |
| Second review: PASS, bound to that revision | | <report> |
| Second reviewer did not see the first review's output before its initial report | | <report statement> |
| Builder and both reviewers are independent | | <who, and family if models> |
| No unresolved Moderate or Major finding | | <consolidated findings> |
| Every repair has a tier record and the re-reviews it requires | | <tier record> |
| Both reports attached to the change record together | | <link> |
| Change targets the correct branch | | <branch and where it was read> |
| Required checks and approval rules pass | | <status> |
| High-risk change: human approval recorded | | <who, when, or n/a> |

## Decision
Ready | Not ready

## Blockers (most important first)
1. <blocker> Clears when: <what is needed>

## After the merge (a human merges)
| Item | Status |
| --- | --- |
| The change shows as merged | |
| Post-merge checks pass | |
| The work item is marked done or closed, where a status is kept | |
| The execution record is completed (usage, repair rounds, human time, outcome) | |
