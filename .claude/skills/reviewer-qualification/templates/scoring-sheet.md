# Reviewer qualification scoring sheet

**Domain:** <domain> **Seeded change:** <identifier> **Date:** <date>
**Candidate:** <name> **Version:** <model or tool version, or person>
**Review skill used:** <skill> **Report file:** <file name>

| Measure | Record |
| --- | --- |
| Real defects found (of 4) | |
| Real defects missed (which ones) | |
| Harmless nit reported as a defect? | Yes / No |
| Unsupported findings (no reproducible evidence) | |
| Followed the report format? | Yes / No |
| Quality of evidence | Strong / Mixed / Weak |
| Severity classified correctly? | Yes / Partly / No |

## Decision
Rule: qualifies with at least 3 of 4 defects found, no more than 1 unsupported finding, and the report format followed.

- [ ] Qualified for <domain> at <version>
- [ ] Not qualified
- [ ] Borderline (3 of 4 with 1 unsupported, or 2 of 4): rerun once on a different seeded change before deciding

Decided by: <name> Rationale: <one or two lines>

These thresholds are screening criteria, not a guarantee of review quality. Qualification does not carry to other domains or versions.
