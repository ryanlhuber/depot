# Adversarial review report

**Reviewer:** <name, and model family if one applies> **Role:** Adversarial review
**Revision reviewed:** <commit hash or other immutable identifier>
**Saw other review output:** yes | no <if yes, say what, and confirm it was not relied on>
**Verdict:** PASS | FAIL

## Acceptance criteria
| Criterion | Status | Evidence |
| --- | --- | --- |
| <criterion text> | Met / Not met / Cannot verify | <file:line, test name, or reproduction> |

## Findings (most severe first)
| ID | Severity | Title | Evidence | Confidence | Recommended fix |
| --- | --- | --- | --- | --- | --- |
| A1 | Minor / Moderate / Major | <title> | <file:line or reproduction> | High / Med / Low | <short fix> |

Severity: Minor = no behavior or security impact. Moderate = contained functional problem, missing validation, broken test, unmet criterion, accessibility defect. Major = security, data loss, architectural failure, major regression, broken core behavior. Confidence is independent of severity.

## Attacks attempted that found nothing
- <boundary, malformed input, concurrency, error path, compatibility, security case tried>

## Tests
Run: <commands and results>
Not run, and why: <list>

## Remaining uncertainty
<Concerns that could not be supported with evidence. These are not findings.>

A PASS must state: "No blocking findings remain."
