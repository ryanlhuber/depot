# Consolidated review findings

**Change:** <identifier or link> **Revision:** <commit hash or other immutable identifier>

## Reports received
| Report | Reviewer | Revision | Saw other review output | Verdict |
| --- | --- | --- | --- | --- |
| <file or id> | <name> | <revision> | yes / no | PASS / FAIL / stale |

## Merged findings (most severe first)
| ID | Severity | Title | Sources | Evidence | Status | Fix |
| --- | --- | --- | --- | --- | --- | --- |
| C1 | Minor / Moderate / Major | <title> | R1, A2 | <file:line or reproduction> | Open / Resolved / Needs decision | <short fix> |

Unique to one reviewer: <finding ids and which reviewer>
Severity disagreements: <finding id, ratings, higher severity kept, for the requester>

## Blocking set
<Unresolved Moderate and Major finding ids, or "none".>

## Fix order
1. <finding ids, with the reason for the order>

## Repair re-review (only after a repair)
Approved revision: <revision> Repair revision: <revision> Verified scope: <files and what changed>
Tier: A | B | C Reason: <why this tier, and why not a lighter one>
Reviews to rerun: <which reviewers, and tests>

## Decisions needed from the requester
- <decision and the finding it affects>
