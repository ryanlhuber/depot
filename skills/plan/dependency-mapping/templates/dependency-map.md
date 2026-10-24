# Dependency map

**Items covered:** <set name and count>

## Dependencies
| Item | Needs | Kind | Reason |
| --- | --- | --- | --- |
| W2 | W1 | Hard / Soft | <why it needs it> |

## Build order
1. <ID: title> <why it comes at this point>
2. <ID: title> <why>

**Critical path:** <IDs in order, and why this path sets the minimum sequence>
**Can start now:** <IDs>
**Can run in parallel:** <groups of IDs>

## External dependencies
| Need | Owner | Affects | What is needed from them |
| --- | --- | --- | --- |
| <external decision, access, or lead time> | <person or role> | <IDs> | <specific ask> |

## Cycles
- <items involved> Resolved by: re-slice / interface first / reorder, or Reported as a blocker: <why it cannot be broken>

## Single points of failure
- <item that many others wait on, and what would reduce the risk>
