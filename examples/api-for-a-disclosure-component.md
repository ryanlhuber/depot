# Example: API for a disclosure component

Demonstrates [Component API Design](../skills/frontend/component-api-design/SKILL.md) with its [component API specification template](../skills/frontend/component-api-design/templates/component-api-spec.md). The product, call sites, and requirements are fictional. This example is not canonical guidance.

## Input

> Riverside Pool's site has three hand-built "show more" sections: a lesson FAQ, a lane-rules panel on the booking page, and a pricing notes block. Each works a little differently. We want one shared Disclosure component. Support: the FAQ lists several items where more than one can be open; the lane rules are one panel the booking page sometimes opens itself when a booking fails.

## Disclosure: specification

### Purpose and non-goals
Shows and hides a block of related content under a visible heading. It does not animate on its own terms, fetch content, or group several disclosures. Grouping is left to the consumer.

### Usage cases
| # | Context | Evidence | Variation needed |
| --- | --- | --- | --- |
| U1 | Lesson FAQ | Call site supplied | Several independent items, each opens separately |
| U2 | Lane rules on booking page | Call site supplied | Parent opens it after a failed booking |
| U3 | Pricing notes | Call site supplied | Closed by default, no other variation |

### Inputs
| Input | Allowed values or type | Default | Required | Effect |
| --- | --- | --- | --- | --- |
| heading | Text, or content with a heading level | none | Yes | The visible control label and the section's accessible name |
| open | Boolean | none | No | When set, the consumer controls the open state (U2) |
| default open | Boolean | false | No | Initial state when `open` is not set (U1, U3) |

### State model
| State | Owner | Mode | Notes |
| --- | --- | --- | --- |
| Open or closed | Component, or the consumer when `open` is set | Both | Setting `open` makes use controlled; leaving it unset makes use uncontrolled. Switching between the two during one component's life is not supported. |

### Events
| Name | Fires when | Payload | Order |
| --- | --- | --- | --- |
| toggle | The user opens or closes it | The new state | After the state changes; in controlled use the consumer decides whether to apply it |

### Accessibility contract
- Native element: built on the platform's disclosure element where the supported browsers allow it. If it cannot be used, a button controlling a region.
- Accessible name: the heading, with no consumer action needed.
- Keyboard: Enter and Space on the control toggle it. Tab order follows the document.
- State exposed to assistive technology: expanded or collapsed, available without consumer code.

### Invalid combinations
| Combination | Behavior |
| --- | --- |
| `open` and `default open` both set | `open` wins; a visible development warning is logged |
| No heading | Not allowed; fails visibly in development, not silently in production |

### Breaking-change surface
The names `open` and `toggle`, the controlled and uncontrolled rule, and the heading-as-name behavior.

### Assumptions and open decisions
- A1: No animation is required. If the design calls for one, it needs a separate decision about reduced-motion preferences.
- Q1: Should an exclusive "only one open" group be added later? No current call site needs it, so it is not part of this surface.
