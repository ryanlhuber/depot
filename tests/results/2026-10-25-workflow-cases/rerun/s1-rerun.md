# Spec to UI: one-off contact form

## Stage 1: Read the specification (ran)
Design Spec Intake readiness report.

- **Inventory:** one inline specification and the token list. Status is unknown, not stated as approved.
- **Decided:**
  - Fields:
    - Name: "Your name", required, text.
    - Email: "Email address", required, email.
    - Message: "How can we help?", required, multiline, max 1000 characters.
  - Submit button: "Send message".
  - Loading: button disabled, text "Sending...".
  - Success: form replaced by "Thanks, we will reply within two business days".
  - Error: entries kept, "Message not sent. Try again." above the button, focus moves to it.
  - Tokens: color-text, color-error, space-2, space-4.
- **Inferred, labeled:** "focus moves to it" most likely means the error message. The button is the other possible reading.
- **Conflicts:** none.
- **Gaps:**
  - Minor: no layout plan, viewports, or breakpoints.
  - Minor: no tokens for border, background, focus ring, font size, or button.
  - Risky: no loading time bound or timeout.
  - Minor: no behavior at 1000 characters (hard limit or counter).
  - Minor: no per-field validation messages. Only the form-level error is specified.
  - Minor: no required-field indicator, no heading, and no announcement or focus rule for success.
- **Blocking:** none. Everything specified can be built.
- **Proposals, not built until approved:**
  - Native `required` validation with the browser's own messages.
  - A native `maxlength="1000"`.
  - A visible "required" note.
  - Success announced politely, with focus not moved.
  - A heading, "Contact us", taken from the form's name in the fixture.
- **Reuse candidates:** none. There is no shared component.

## Stage 2: Resolve gaps (ran, nothing blocking)
Validation after stage 1: no blocking items, so no owner assignments are needed. The minor and risky items are carried as noted assumptions, and the owner can confirm or change them. No decisions were made for the owner.

## Stage 3: Structure (ran)
```html
<form aria-labelledby="cf-h" novalidate? (not used)>
  <h2 id="cf-h">Contact us</h2>            <!-- placeholder copy -->
  <p>All fields are required.</p>          <!-- placeholder copy -->
  <label for="n">Your name</label>
  <input id="n" name="name" type="text" autocomplete="name" required>
  <label for="e">Email address</label>
  <input id="e" name="email" type="email" autocomplete="email" required>
  <label for="m">How can we help?</label>
  <textarea id="m" name="message" maxlength="1000" required></textarea>
  <p id="err" tabindex="-1" hidden>Message not sent. Try again.</p>
  <button type="submit">Send message</button>
</form>
```
- The form uses native controls, visible labels tied with `for`, and matching input types. It needs no ARIA beyond `aria-labelledby`, and the ARIA ledger has no other entries.
- The page owns `main` and the document title, so they are out of scope here.
- Accessible names come from the labels and the button text.
- Not performed: rendering, keyboard pass, and assistive-technology pass. Focus order is unverified.

## Stage 4: Component interface (skipped)
The form is one-off and not shared, so the workflow skips this stage.

## Stage 5: States (ran)
- **State model:** one closed value from `idle | loading | success | error`. This rules out combinations such as loading and success together.

| State | Trigger | Rendering | Announcement and focus | Exit |
|---|---|---|---|---|
| idle | initial | form | none | submit |
| loading | submit | button disabled, "Sending..." | disabled button stays visible; announcement unspecified | success or error. No bound is specified (gap). |
| success | send succeeds | form replaced by the thank-you text | proposed polite status, focus unchanged | none specified |
| error | send fails | entries kept, error text above the button | focus moves to the error element (inferred reading) | resubmit |

- The error element uses `tabindex="-1"` so it can take focus, and the entries stay in the fields.
- Each state can be previewed with a state parameter or fixture.
- Transition tests, the screen-reader check, and the keyboard check were not run, because nothing was built here.

## Stage 6: Responsive behavior (ran, with proposed values)
There is no layout plan, so the form is a single column with no media queries. Fields are `width:100%` with a `max-width`, and spacing and text use relative units. Because there is no breakpoint, no breakpoint tokens are needed. The `max-width` value is proposed. Verification at the narrowest width, at zoom, and at text enlargement was not performed (unverified).

## Stage 7: Tokens (ran)
- Text uses color-text, the error message uses color-error, and gaps use space-2 and space-4. These are the only token names used. No new token was invented.
- Border, background, and focus-ring values have no token. They are listed as exceptions needing a decision.
- The drift check is a search for raw colors and sizes in the form's styles. It was not run.
- Contrast for color-error and color-text is unverified because the background is not specified.

## Stage 8: Check against the specification (ran as a copy check, nothing observed)
- Copy comparison: labels, button text, "Sending...", success text, and error text match the specification.
- States, layout, and visual values are unverified, because there is no rendered build.
- Mismatches: none found from reading. The list is incomplete.

## Report
- **Ran:** stages 1, 2, 3, 5, 6, 7, and 8.
- **Skipped:** stage 4, because the form is one-off.
- **Stopped:** nothing stopped the workflow. Stage 2 had no blocking items, so it only carried the assumptions forward.
- **Not produced:** no real build or rendering existed in this read-only run. Stage 5 and 6 checks, the stage 7 drift check and contrast, and the stage 8 observation are all unverified. Stage 8 was not performed by an independent person.
- **Assumed (all labeled proposed):**
  - The "focus moves to it" target is the error element.
  - The heading and "all fields required" note are placeholder copy.
  - Native validation and `maxlength` are used.
  - Success is announced politely without moving focus.
  - The form's `max-width` is a proposed value.
  - The single-column layout is used because no layout plan exists.
- **Note:** the `novalidate? (not used)` comment in the markup is a stray annotation, not intended output.