# Architecture review report

**Reviewer:** <name, and model family if one applies>
**Scope:** <system, subsystem, or design reviewed, and what was out of scope>
**Revision or document version:** <commit hash or other immutable identifier>

## Drivers
| Driver | Source |
| --- | --- |
| <goal, constraint, or planned change> | Supplied / Assumed (confirm) |

## Structure summary
<Components, dependency direction, data ownership, and integration points, in a few lines. Note any place where documents and code disagree.>

## Findings (most severe first)
| ID | Severity | Class | Title | Driver affected | Evidence | Cost of leaving it | Smallest fix | Alternatives and tradeoffs | Confidence | How to verify |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A1 | Minor / Moderate / Major | Defect / Costly tradeoff | <title> | <driver> | <file, module, or document, plus the change or failure scenario> | <what it costs if unchanged> | <smallest structural change> | <options and what each gives up> | High / Med / Low | <what would show the fix worked> |

Severity: Major = blocks or endangers a driver now or on planned work. Moderate = a measurable recurring cost. Minor = local and low cost. Keep observation, inference, and recommendation apart in the evidence and fix columns. Confidence is independent of severity.

## Decisions needed from others
<Product, security, or ownership decisions the findings depend on. State each; do not decide it.>

## Recommended order
<Findings ordered by cost of delay and dependency, with the reason for any dependency.>

## Not examined
<Areas or evidence not covered, and why.>

## Remaining uncertainty
<What could not be established, and which assumed drivers would change the findings if they are wrong.>
