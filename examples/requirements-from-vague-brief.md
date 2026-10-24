# Example: requirements from a vague brief

Demonstrates [Requirements Definition](../skills/design/requirements-definition/SKILL.md) with its [requirements set template](../skills/design/requirements-definition/templates/requirements-set.md). The product, people, and numbers are fictional. This example is illustrative and is not canonical guidance.

## Input brief

> We want a fast, easy booking page for our community pool. Parents should be able to reserve lap-swim lanes and kids' lessons. It should work on phones and not need an account. Maybe add reminders. The board wants it to feel friendly.

## Requirements: Riverside Pool booking page

**Source material:** the brief above. No analytics, user research, or technical constraints were supplied.

### Requirements
| ID | Requirement | Priority | Source | How verified |
| --- | --- | --- | --- | --- |
| R1 | A visitor can reserve a lap-swim lane for a chosen date and time slot. | Must | "reserve lap-swim lanes" | Task test: reserve a lane |
| R2 | A visitor can register a child for a lesson session. | Must | "kids' lessons" | Task test: register a child |
| R3 | A visitor can complete a reservation without creating an account. | Must | "not need an account" | Walkthrough: no sign-in step on the path |
| R4 | All reservation and registration tasks are completable on a phone-sized screen. | Must | "work on phones" | Task test at a phone viewport |
| R5 | The system confirms a completed reservation on screen and states the date, time, and lane or session. | Should | Inferred from R1 and R2 | Inspection |

### Constraints
| ID | Constraint | Source |
| --- | --- | --- |
| C1 | No account is required (a constraint on R1 and R2, restated from R3). | Brief |

### Assumptions
| ID | Assumption | Consequence if wrong | Who can confirm |
| --- | --- | --- | --- |
| A1 | A reservation needs a name and a contact method. | Without contact details, cancellations and reminders cannot work. | Pool manager |
| A2 | Parents register children by name and age only. | Lessons may need medical or swim-level information. | Lesson coordinator |

### Open questions
| ID | Question | Decision it blocks | Owner |
| --- | --- | --- | --- |
| Q1 | What does "fast" mean here: page load, number of steps, or time to book? | Whether R1 and R2 get a measurable threshold | Pool manager |
| Q2 | Are reminders in scope for the first release? | Whether a reminder requirement and contact-consent handling are added | Board |
| Q3 | How are cancellations and capacity limits handled? | Reservation rules for R1 and R2 | Pool manager |
| Q4 | Is payment taken on the page? | Scope of R1 and R2 | Board |

### Non-goals
- None stated. Payment and cancellation are open (Q3, Q4), not excluded.

### Source coverage
- "Fast, easy" is not testable as written; it is held as Q1 and not given an invented threshold.
- "Friendly" is a preference. It is not promoted to a requirement and is listed here as something the design stage should interpret with the board.
- "Maybe add reminders" is an open question (Q2), not a requirement.
