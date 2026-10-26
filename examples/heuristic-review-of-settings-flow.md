# Example: heuristic review of a settings flow

Demonstrates [Run Heuristic Evaluation](../skills/ux/run-heuristic-evaluation/SKILL.md) with its [finding report template](../skills/ux/run-heuristic-evaluation/templates/finding-report.md). The app and screens are fictional. This example is illustrative and is not canonical guidance.

## Input

A description of the "Account settings" screen in a fictional note-taking app, and two primary tasks: change the display name, and delete all notes in a notebook. The screen has an editable name field, a "Save" button, and a "Reset notebook" button directly beside it with the same size and weight. "Reset notebook" deletes all notes in the notebook immediately, with no confirmation or undo. After saving a name change, the only feedback is that the button briefly dims.

## Heuristic usability evaluation

**Scope:** change display name; delete all notes in a notebook. **Heuristic set:** general usability principles (none were specified).
**Not covered:** onboarding, sync, and sharing.

### Findings (most severe first)
| ID | Task and location | Observation | Heuristic | Classification | Impact | Severity | Confidence | Recommended action |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| H1 | Delete notes, "Reset notebook" button | Destroys all notes immediately, with no confirmation and no undo. | Error prevention; user control and recovery | Heuristic concern | Permanent data loss from one accidental tap | High | Medium | Add a confirmation that names what will be deleted, or provide undo for a period; validate which fits the data model. |
| H2 | Delete notes, button layout | "Reset notebook" sits next to "Save" with identical size and weight. | Error prevention; consistency | Heuristic concern | Raises the chance of H1 by a mis-tap (inferred from adjacency and equal emphasis; no device or usage data was supplied) | High | Medium | Separate the destructive action from the primary action and give it distinct, lower emphasis. |
| H3 | Change name, save feedback | Saving is signaled only by a brief button dim. | Visibility of system status | Heuristic concern | The user may not know whether the name saved and may repeat or abandon the task | Medium | Medium | Show a persistent confirmation, such as an inline message, that the change was saved. |
| H4 | Delete notes, label | "Reset notebook" does not say that notes are deleted. | Match with the user's language | Heuristic concern | The user may expect settings to reset, not data to be removed | Medium | Low | Use plain wording such as "Delete all notes". Confirm with users how they read "reset". |

Severity reflects frequency, impact on task completion, and persistence. Confidence is independent of severity. H1 and H2 are rated high severity with medium confidence because the screen description is the only evidence; no one has used the flow.

### Strengths worth preserving
- None can be established. The description says only that the name field is editable, so nothing about its labeling or default value is claimed.

### Needs validation with representative users
| ID | Why a heuristic review cannot settle it | Suggested validation |
| --- | --- | --- |
| H1, H2 | Whether users mis-tap in practice depends on real devices and habits. | Include "delete all notes" as a task in a short moderated test and observe near-misses. |
| H4 | How users read "reset" is a matter of their vocabulary. | Ask participants what they expect "Reset notebook" to do before they use it. |

### Coverage
Tasks walked: 2 of 2. Tasks not walked: none in scope.
