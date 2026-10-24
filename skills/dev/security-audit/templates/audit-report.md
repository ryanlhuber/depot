# Security audit report

**Auditor:** <name, and model family if one applies>
**Scope:** <what was audited and what was explicitly out of scope>
**Revision or snapshot:** <commit hash or other immutable identifier>

## Assets, actors, and entry points
<What the system protects, who interacts with it, and where input enters. Mark each item Supplied or Assumed.>

## Coverage
| Area | Status | Notes |
| --- | --- | --- |
| Authentication | Examined / Not examined | <what was read, or the reason it was not> |
| Authorization | Examined / Not examined | <notes> |
| Input handling at trust boundaries | Examined / Not examined | <notes> |
| Secrets and credentials | Examined / Not examined | <notes> |
| Session and token handling | Examined / Not examined | <notes> |
| Data exposure and retention | Examined / Not examined | <notes> |
| External integrations | Examined / Not examined | <notes> |
| Configuration defaults | Examined / Not examined | <notes> |
| Fail-open paths | Examined / Not examined | <notes> |

## Findings (most severe first)
| ID | Severity | Title | Evidence | Path from entry point to asset | Preconditions | Impact | Exploitability | Confidence | Mitigation | How to verify |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| S1 | Minor / Moderate / Major | <title> | <file:line or local reproduction> | <entry point, then each step, then the asset> | <what must already be true> | <what is lost> | High / Med / Low | High / Med / Low | <specific change> | <test or check> |

Severity: Major = plausible path to unauthorized access, data exposure, or loss of integrity with few preconditions. Moderate = the same harm only under stated preconditions, or a contained impact. Minor = hardening with no demonstrated path. Confidence is independent of severity. Do not include secret values; give location and type.

## Hardening suggestions
<Improvements with no demonstrated path, kept apart from findings.>

## Tools and tests
Run: <commands, tools, and results>
Not run, and why: <list, including any step that needed live access>

## Remaining uncertainty
<Suspicions without a plausible path, and what could not be established.>

A result with no findings states: "No findings in the examined scope."
