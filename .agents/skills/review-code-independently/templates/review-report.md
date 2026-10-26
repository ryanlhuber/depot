# Independent review report

**Reviewer:** <name, and model family if one applies> **Role:** Independent review
**Revision reviewed:** <commit hash or other immutable identifier>
**Verdict:** PASS | FAIL

## Acceptance criteria
| Criterion | Status | Evidence |
| --- | --- | --- |
| <criterion text> | Met / Not met / Cannot verify | <file:line, test name, or reproduction> |

## Findings (most severe first)
| ID | Severity | Title | Evidence | Confidence | Recommended fix |
| --- | --- | --- | --- | --- | --- |
| R1 | Minor / Moderate / Major | <title> | <file:line or reproduction> | High / Med / Low | <short fix> |

Severity: Minor = no behavior or security impact. Moderate = contained functional problem, missing validation, broken test, unmet criterion, accessibility defect. Major = security, data loss, architectural failure, major regression, broken core behavior. Confidence is independent of severity.

## Tests
Run: <commands and results>
Not run, and why: <list>

## Remaining uncertainty
<What could not be established.>

A PASS must state: "No blocking findings remain."
