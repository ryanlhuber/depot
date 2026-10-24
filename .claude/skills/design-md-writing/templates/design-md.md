# DESIGN.md: <product name>

<!-- Label every rule: [requirement] binding, [convention] default, [preference] flexible.
     Mark values not yet confirmed as (proposed). Delete sections that do not apply and list them under Omitted sections. -->

## Overview
<What the product is, who uses it, and in what contexts.>

**Principles** (these settle design disputes):
1. <Principle> — <what it means in practice>.

## How to use this file
- Use a role from this file, not a raw value, whenever one exists.
- If a decision is missing here, do not invent one. Use the nearest documented role and flag the gap in your output.
- Rules marked [requirement] are binding. [convention] rules are defaults that need a stated reason to break. [preference] rules are flexible.

## Color
| Role | Value | Purpose | Do not use for |
| --- | --- | --- | --- |
| <surface/default> | <value> | <where it appears> | <misuse> |

Themes: <list, with how roles map per theme>.
**Contrast** [requirement]: <standard and level>. Verified pairings: <text role on surface role, ratio>.

## Typography
| Role | Family | Size | Weight | Line height | Use |
| --- | --- | --- | --- | --- | --- |
| <heading/1> | | | | | |

Rules: <scale progression, minimum body size, line length>.

## Spacing and layout
- Base unit and scale: <values>.
- Layout principles: <density, grid, alignment, breakpoints or adaptation rules>.

## Shape and elevation
| Role | Value | Use |
| --- | --- | --- |
| <radius/control> | | |

## Motion
- Durations and easing roles: <values>. Reduced-motion behavior [requirement]: <what changes>.

## Components
| Component | Uses (roles) | States | Permitted variations | Rules |
| --- | --- | --- | --- | --- |
| <button> | | default, hover, focus, disabled, error | | |

## Voice and interface text
- Tone: <description, with source>. Capitalization, terminology, and error-message rules: <rules>.

## Accessibility
- Standard and level: <name, version>.
- <Testable condition, e.g. "Every interactive element shows a visible focus indicator with at least <ratio> contrast.">

## Do and don't
| Do | Don't |
| --- | --- |
| <correct pattern> | <common mistake> |

## Ownership and change process
Owner: <role or person>. To add, change, or retire a decision: <process>.

## Open questions and proposed values
- <Question or (proposed) value awaiting confirmation, and who can confirm.>

## Omitted sections
- <Section> — <reason>.
