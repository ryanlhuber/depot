# Triggering holdout set

70 requests written once, before any run, and not edited afterward: one natural request for each of the 58 skills (phrased differently from [the triggering table](triggering-table.md)) and 12 near misses. The skill descriptions were not changed in response to this set. If a later run shows a miss here, change the description or note the miss, but do not change a request or its expected answer. Write a new holdout set for the next round instead.

Since 0.9.0, 55 skills have new names, so this table still lists the names it was run with. The old-to-new table is in the [changelog](../CHANGELOG.md#090); score a rerun by mapping each expected name through it.

Since 0.8.0, `portfolio-case-study-writing` lives in [kit-work](https://github.com/ryanlhuber/kit-work), not depot. The rows that expect it are left as they were run; a rerun against depot alone should expect none for them.

Run 1: 2026-10-25, one fresh Claude Haiku run that saw only the 58 names with their descriptions and the shuffled requests. Same vendor family as the author, one run, scored by the author. See [the result](results/2026-10-25-holdout.md). Run 2: the same prompt in a fresh ChatGPT chat, see [that result](results/2026-10-25-holdout-chatgpt.md).

| # | Request | Expected | Chosen | Match |
| --- | --- | --- | --- | --- |
| 1 | Tell me honestly where the project stands, based on what's merged and tested, not on ticket status. | `status-reporting` | `status-reporting` | Yes |
| 2 | I changed how totals are rounded. What else might this have broken? | `regression-review` | `regression-review` | Yes |
| 3 | Can someone check whether our signup flow works for blind users and keyboard-only users before the launch? | `accessibility-review` | `accessibility-review` | Yes |
| 4 | How should our admin table adapt to phones, tablets, and zoomed text? Specify it before we code. | `responsive-layout-planning` | `responsive-layout-planning` | Yes |
| 5 | The build of the pricing page is finished. Compare it to the approved design and list every mismatch. | `design-to-implementation-qa` | `design-to-implementation-qa` | Yes |
| 6 | Write the HTML for an accessible tab component. | `semantic-html-structure` | `semantic-html-structure` | Yes |
| 7 | Which parts of this codebase are slowing us down most, and in what order should we pay them off? | `technical-debt-audit` | `technical-debt-audit` | Yes |
| 8 | Change how discounts are calculated so loyalty members get 5% extra. | `feature-build` | `feature-build` | Yes |
| 9 | The spec lists loading, empty, and error states for the orders table. Implement them. | `interface-state-implementation` | `interface-state-implementation` | Yes |
| 10 | Merge the PR for me and deploy it. | none | none | Yes |
| 11 | I'm a designer and want a case study of my banking-app redesign. Ask me what you need and draft it without making up numbers. | `portfolio-case-study-writing` | `portfolio-case-study-writing` | Yes |
| 12 | Before the release, check our npm packages for known vulnerabilities, abandoned projects, and bad licenses. | `dependency-audit` | `dependency-audit` | Yes |
| 13 | Draw the steps of the checkout screens only, from cart to confirmation. | `user-flow-mapping` | `user-flow-mapping` | Yes |
| 14 | Add a dark mode toggle to settings. | `feature-build` | `feature-build` | Yes |
| 15 | I'm out of context and switching tools. Write a note so a fresh session can pick up exactly where we are. | `session-handoff` | `session-handoff` | Yes |
| 16 | A teammate already approved my diff for the refund calculator. I want another reviewer who hasn't seen their comments to really try to break it. | `adversarial-code-review` | `adversarial-code-review` | Yes |
| 17 | Pick brand colors for a new product from scratch and decide what they should be. | `design-token-and-system-definition` | none | No |
| 18 | Users can't find the settings they need. Rework how we group and label the menu, and check people can find key destinations. | `information-architecture-and-navigation` | `information-architecture-and-navigation` | Yes |
| 19 | These 18 tasks depend on each other in tangled ways. Give me the build order and what can start today. | `dependency-mapping` | `dependency-mapping` | Yes |
| 20 | Run the interviews and tell me what real users think. | none | none | Yes |
| 21 | Here is the approved spec with acceptance criteria for CSV import. Build exactly that. | `feature-build` | `feature-build` | Yes |
| 22 | I just finished the PR for the address-validation feature. Please do the first review against the spec. | `independent-code-review` | `independent-code-review` | Yes |
| 23 | Map the whole experience of a person moving house, from first thinking about it to settling in, including things outside our app. | `journey-mapping` | `journey-mapping` | Yes |
| 24 | I don't know where to start. I have a half-baked idea for an app and no plan. What should I use? | `kit-router` | `kit-router` | Yes |
| 25 | I keep repeating the same release-notes routine. Turn it into a reusable skill. | `skill-authoring` | `skill-authoring` | Yes |
| 26 | Give our dashboard an expert usability review against standard heuristics, with severity for each problem. | `heuristic-usability-evaluation` | `heuristic-usability-evaluation` | Yes |
| 27 | Reviews are done on the PR for the login change. Can it be merged, based on evidence? | `merge-readiness-check` | `merge-readiness-check` | Yes |
| 28 | We need to move users from the old auth tables to a new schema without downtime. Plan and run it safely. | `migration` | `migration` | Yes |
| 29 | From these interview notes, draft two personas and a couple of usage scenarios, and label what you inferred. | `persona-and-scenario-drafting` | `persona-and-scenario-drafting` | Yes |
| 30 | We're adopting AI agents in this repo. Write down our branch rules, test commands, and what agents must not do. | `repo-conventions-setup` | `repo-conventions-setup` | Yes |
| 31 | Our app has 14 shades of gray. Define a proper set of color, type, and spacing decisions and check designs against them. | `design-token-and-system-definition` | `design-token-and-system-definition` | Yes |
| 32 | Write the product launch announcement for customers. | none | none | Yes |
| 33 | Plan a usability test for the new checkout with 6 users: tasks, measures, and a session guide. | `usability-test-planning` | `usability-test-planning` | Yes |
| 34 | We have design tokens defined. Set them up in code so components stop using raw hex values. | `design-token-implementation` | `design-token-implementation` | Yes |
| 35 | We're making a reusable date-range picker for three teams. Define its props, events, and what it lets people style. | `component-api-design` | `component-api-design` | Yes |
| 36 | Here's a mockup. Is the visual hierarchy and spacing working? Give structured feedback. | `visual-design-critique` | `visual-design-critique` | Yes |
| 37 | Can we trust this model as a security reviewer? Test it on a change with planted bugs and score it. | `reviewer-qualification` | `reviewer-qualification` | Yes |
| 38 | What is a good name for our new app? | none | none | Yes |
| 39 | Before we build the inbox screen, list every state it can be in beyond the happy path, including what the user sees and how they get out. | `interface-state-specification` | `interface-state-specification` | Yes |
| 40 | Here is the layout plan for the product page. Build it in CSS so it holds up at any width and with big text. | `responsive-implementation` | `responsive-implementation` | Yes |
| 41 | Audit the file upload module for security weaknesses an attacker could reach. | `security-audit` | `security-audit` | Yes |
| 42 | Write the markup for a data table with filters so it works with a screen reader and keyboard. | `semantic-html-structure` | `semantic-html-structure` | Yes |
| 43 | Decide for me which features ship this quarter. | none | `backlog-prioritization` | No |
| 44 | I have three reviews of the same commit that say overlapping things. Merge them into one list and tell me how much re-review the fix needs. | `review-reconciliation` | `review-reconciliation` | Yes |
| 45 | The brief for the new search screen is two sentences. Turn it into numbered testable requirements with open questions. | `requirements-definition` | `requirements-definition` | Yes |
| 46 | Write up why we chose a stepper over a single long form, for the stakeholders who missed the meeting. | `design-rationale-writing` | `design-rationale-writing` | Yes |
| 47 | How do other note-taking apps handle sharing a folder with someone? I want to see the range of approaches before we design ours. | `competitive-pattern-analysis` | `competitive-pattern-analysis` | Yes |
| 48 | This 400-line function is a nightmare to change. Clean up its structure without changing what it does. | `refactor` | `refactor` | Yes |
| 49 | Look at the pull request for the new coupon feature and tell me whether it matches the spec. | `independent-code-review` | `independent-code-review` | Yes |
| 50 | Map the steps and decisions someone takes to reset their password, and show where they can get stuck. | `user-flow-mapping` | `user-flow-mapping` | Yes |
| 51 | My boss said "make onboarding better". Turn that into a clear problem statement with goals, constraints, and success measures. | `problem-framing` | `problem-framing` | Yes |
| 52 | Rewrite these button labels and error messages so they're clearer and friendlier. | `ux-microcopy-writing` | `ux-microcopy-writing` | Yes |
| 53 | Engineering is about to start on this handoff. Read the Figma notes and the token doc and tell me what is decided, what is open, and what is missing. | `design-spec-intake` | `design-spec-intake` | Yes |
| 54 | Our board has 300 tickets, some from two years ago, and I suspect duplicates. Tell me what's rotten, but don't touch anything. | `backlog-health-check` | `backlog-health-check` | Yes |
| 55 | I'm going to interview 8 freelancers about how they chase unpaid invoices. Write the question guide. | `interview-guide-writing` | `interview-guide-writing` | Yes |
| 56 | This epic, "bulk editing", is clear. Cut it into tickets each with a done signal and rough size. | `issue-breakdown` | `issue-breakdown` | Yes |
| 57 | Here are 25 candidate tickets. Sort them into what to do now, next, later, and not at all, and show why. | `backlog-prioritization` | `backlog-prioritization` | Yes |
| 58 | Every time we add a payment provider we have to touch six services. Is the way we've split things up actually wrong for what we're trying to do? | `architecture-review` | `architecture-review` | Yes |
| 59 | Write a DESIGN.md for our mobile app so coding agents stay on-brand. | `design-md-writing` | `design-md-writing` | Yes |
| 60 | We want "customers can self-serve returns". It's too big for tickets. Break it into outcomes with ordered slices. | `outcome-slicing` | `outcome-slicing` | Yes |
| 61 | Rank these tickets by importance for next quarter. | `backlog-prioritization` | `backlog-prioritization` | Yes |
| 62 | We're about to commit to building a referral program. List what we're taking for granted and which of those bets is cheapest to check. | `assumption-mapping` | `assumption-mapping` | Yes |
| 63 | Ticket says "add export to PDF". Work with me, one decision at a time, until it's a spec I can approve. | `refine-issue` | `refine-issue` | Yes |
| 64 | Turn this ranked backlog into a one-page now, next, later roadmap for the leadership team. | `roadmap-writing` | `roadmap-writing` | Yes |
| 65 | We're shipping the new billing service tonight. Is it actually ready to go out, and is there a way back if it fails? | `deployment-readiness` | `deployment-readiness` | Yes |
| 66 | I have a vague plan to migrate our docs site. Ask me questions one at a time until all the decisions are pinned down. | `decision-interview` | `decision-interview` | Yes |
| 67 | The CSV export drops the last row whenever the file has more than 1000 lines. Find out why and fix it. | `bug-fix` | `bug-fix` | Yes |
| 68 | This project plan feels bloated. What is the smallest version that still reaches the goal? | `simplification-review` | `simplification-review` | Yes |
| 69 | The README setup steps are out of date and a new hire got stuck. Fix the docs for new contributors and check the commands work. | `documentation-pass` | `documentation-pass` | Yes |
| 70 | I have notes from 12 user sessions. Pull out themes and insights, keeping what was observed separate from what you're guessing. | `research-synthesis` | `research-synthesis` | Yes |
