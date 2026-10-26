# Triggering table

One request that should select each skill, and one near miss that should select another skill or none, for all 58 skills (116 requests). Run it the way the [triggering cases](behavioral-cases.md#triggering) are run: give a fresh runner only the skill names and descriptions plus the requests, and ask which single skill each request selects, or none. Score a row as a pass when the answer equals the expected value. Record each run, with the model, the date, and the descriptions used, in [`results/`](results/README.md). `simplification-review` has two should-trigger requests (shrinking scope, and trimming something overbuilt) because its description covers both jobs; row 12 tests it as the near miss from `backlog-prioritization`. Row numbers changed in 0.3.0 when `scope-cutting` was merged into it, so the run records in `results/` use the numbering of the table as it was run.

Since 0.8.0, `portfolio-case-study-writing` lives in [kit-work](https://github.com/ryanlhuber/kit-work), not depot. The rows that expect it are left as they were run; a rerun against depot alone should expect none for them.

The requests were drafted by the same model family that wrote the descriptions, so a high score here is weaker evidence than a score from an unrelated family.

| # | Skill under test | Request | Expected |
| --- | --- | --- | --- |
| 1 | `accessibility-review` | Our new checkout page is going live next month and I'm worried people on screen readers or keyboards will get stuck. Can you go through it against WCAG AA and tell me what to fix first? | `accessibility-review` |
| 2 | `accessibility-review` | I need to write the HTML for our modal dialog so it traps focus and is announced properly to screen readers. | `semantic-html-structure` |
| 3 | `adversarial-code-review` | I already have one reviewer's sign-off on the invoice-rounding change at commit 4f2a9c1. I want a second reviewer who hasn't seen that feedback to try hard to prove the change is wrong. | `adversarial-code-review` |
| 4 | `adversarial-code-review` | Nobody has looked at my pull request for the shipping-label export yet. Can you do the first review against the spec and tell me if it passes? | `independent-code-review` |
| 5 | `architecture-review` | Our order service keeps breaking whenever the inventory team changes anything, and we're about to plan a big quarter of work on it. Is the way it's put together actually the problem? | `architecture-review` |
| 6 | `architecture-review` | Here is the diff and spec for the new coupon-code endpoint. Does this one change do what the spec says? | `independent-code-review` |
| 7 | `assumption-mapping` | We're about to commit the team to a new bakery-ordering app and I suspect we're taking a lot for granted, like that shops will switch from phone orders. Can you pull out what we're betting on and tell me which bets to check first? | `assumption-mapping` |
| 8 | `assumption-mapping` | The prototype for our bakery-ordering app is finished and I want to know whether the design actually works for real shop owners before we ship it, so I need a plan for putting it in front of some of them. | `usability-test-planning` |
| 9 | `backlog-health-check` | Our tracker has about 300 tickets from the last two years and I think half are dead or repeats. Can you go through them and tell me what needs attention, without touching anything? | `backlog-health-check` |
| 10 | `backlog-health-check` | Here are 40 tickets for our garden-planner app. Put them in the order we should tackle them this quarter. | `backlog-prioritization` |
| 11 | `backlog-prioritization` | We have twelve candidate features for the kayak-rental site and room for maybe three this month. Help me decide what goes first and explain why. | `backlog-prioritization` |
| 12 | `backlog-prioritization` | We have twelve kayak-rental features and only two weeks left. Which ones can we drop and still launch something that works? | `simplification-review` |
| 13 | `bug-fix` | Customers in the Pacific time zone see their appointment shown one day early. Here are the repro steps and a failing test. Please track down why and correct it. | `bug-fix` |
| 14 | `bug-fix` | Add a way for customers to reschedule an appointment from the confirmation email. The ticket has acceptance criteria and is approved. | `feature-build` |
| 15 | `competitive-pattern-analysis` | Before we design our seat picker, I want to see how five different ticketing apps let people choose seats and what each one does well or badly. | `competitive-pattern-analysis` |
| 16 | `competitive-pattern-analysis` | Here's a screenshot of Rivermark's dashboard. Make our dashboard look exactly like it, same layout and styling. | none |
| 17 | `component-api-design` | We have three slightly different dropdown menus across our apps and I want one shared version with a clean set of props and events that people can't easily misuse. Can you lay out how it should be called? | `component-api-design` |
| 18 | `component-api-design` | I need a style guide that defines the colors, type scale, and spacing for our new dropdown menu so every team uses the same look. | `design-token-and-system-definition` |
| 19 | `decision-interview` | I have a rough idea for moving our team wiki to a new platform but I keep going back and forth. Can you grill me on it, one thing at a time, so we land on firm choices? | `decision-interview` |
| 20 | `decision-interview` | Take this ticket about adding CSV export and turn it into a spec we can approve before anyone codes it. | `refine-issue` |
| 21 | `dependency-audit` | Before we cut the release, can you check the libraries in our lockfile for known vulnerabilities, dead projects, and licenses that clash with our policy? | `dependency-audit` |
| 22 | `dependency-audit` | Can you go through our login and session code and look for ways an attacker could get into another user's account? | `security-audit` |
| 23 | `dependency-mapping` | I've got eight tasks for the library-catalog migration and I can't tell what has to happen before what. Can you work out a sensible sequence and show me what's blocking? | `dependency-mapping` |
| 24 | `dependency-mapping` | For the library-catalog migration, which of these eight tasks matters most to patrons? Rank them by value. | `backlog-prioritization` |
| 25 | `deployment-readiness` | We want to push the new billing flow to production on Thursday. Is it safe to go live, and how should we roll it out and watch it? | `deployment-readiness` |
| 26 | `deployment-readiness` | The billing-flow pull request has two passing reviews. Can it be merged into main now? | `merge-readiness-check` |
| 27 | `design-md-writing` | Our colors, fonts, and button rules live in Figma, a few Slack threads, and one designer's head. I want one file my AI coding agent can read to build screens consistently. | `design-md-writing` |
| 28 | `design-md-writing` | We have no color or spacing values picked yet. Can you decide the palette, type scale, and spacing steps for our new app? | `design-token-and-system-definition` |
| 29 | `design-rationale-writing` | The leadership team wasn't in the room when we chose a bottom tab bar over a hamburger menu. Can you write up why we did it so they can sign off? | `design-rationale-writing` |
| 30 | `design-rationale-writing` | Write the full spec for the tab bar: what it shows, what the user can do, the messages, and how they leave it, in every state. | `interface-state-specification` |
| 31 | `design-spec-intake` | The designer just sent over a Figma export, a requirements doc, and a copy deck for the checkout page. Before I start coding, can you tell me what's settled, what's contradictory, and what I can start on today? | `design-spec-intake` |
| 32 | `design-spec-intake` | I only have a one-line idea for a checkout page and nothing from design yet. Can you turn it into a numbered list of testable requirements? | `requirements-definition` |
| 33 | `design-to-implementation-qa` | The dev team shipped the pricing page. Can you go through it next to the approved mockups and list everything that doesn't match? | `design-to-implementation-qa` |
| 34 | `design-to-implementation-qa` | The developers built the pricing page but I never wrote down what it should do. Can you work out what it needs to do? | `requirements-definition` |
| 35 | `design-token-and-system-definition` | Our app has fourteen slightly different grays and six corner radii. I want to settle on a small shared set of values and rules for the buttons and cards. | `design-token-and-system-definition` |
| 36 | `design-token-and-system-definition` | Now turn our approved color and spacing decisions into CSS custom properties in the codebase. | `design-token-implementation` |
| 37 | `design-token-implementation` | Our stylesheets are full of hard-coded hex colors and pixel values. The design team gave us final color and spacing decisions, so I want to wire them up as variables with light and dark themes and find the leftovers. | `design-token-implementation` |
| 38 | `design-token-implementation` | Our color palette is a mess and nobody has decided the semantic color roles or values yet. Can you propose and define them for us? | `design-token-and-system-definition` |
| 39 | `documentation-pass` | New hires keep getting stuck following our setup instructions because the commands are outdated and some links are dead. Can you clean that up for them? | `documentation-pass` |
| 40 | `documentation-pass` | Here is the approved spec, with acceptance criteria, for a new CSV export option on the reports page. Please implement it. | `feature-build` |
| 41 | `feature-build` | The ticket for adding a dark-mode toggle to the settings page has been signed off with clear acceptance criteria. Please go ahead and implement it. | `feature-build` |
| 42 | `feature-build` | The ticket says "make search better" and nothing else. Help me work out exactly what it should do before anyone writes code. | `refine-issue` |
| 43 | `heuristic-usability-evaluation` | Can you give our signup flow a quick expert look for usability problems, with a sense of how bad each is, before we pay for user sessions? | `heuristic-usability-evaluation` |
| 44 | `heuristic-usability-evaluation` | I'm going to put our signup flow in front of eight customers next week. Help me set up the tasks and what we measure. | `usability-test-planning` |
| 45 | `independent-code-review` | A teammate wrote the password-reset change and I wasn't involved. Here's the spec and diff at commit b81e3d0. Please check it and give me a pass or fail. | `independent-code-review` |
| 46 | `independent-code-review` | The password-reset change has already passed a normal review. Now I want someone to actively hunt for ways it could fail. | `adversarial-code-review` |
| 47 | `information-architecture-and-navigation` | Our help center has grown to 400 articles and customers keep telling us they can't find anything. Help me reorganize it and name the sections. | `information-architecture-and-navigation` |
| 48 | `information-architecture-and-navigation` | Lay out the content for our help center homepage so it fits on a phone, a tablet, and a wide monitor. | `responsive-layout-planning` |
| 49 | `interface-state-implementation` | The spec for our order list covers loading, empty, offline, and failed-to-load cases, but the page I built just goes blank when anything goes wrong. Can you build those cases properly? | `interface-state-implementation` |
| 50 | `interface-state-implementation` | I'm designing the order list and haven't worked out what it should show when there are no orders or the network drops. Can you write up every case with messages and ways out? | `interface-state-specification` |
| 51 | `interface-state-specification` | For the invoice list screen, I need to cover what shows when there are no invoices, when it's loading, when the request fails, and when a name is very long. | `interface-state-specification` |
| 52 | `interface-state-specification` | Now build the loading, empty, and error states for the invoice list in code from the spec. | `interface-state-implementation` |
| 53 | `interview-guide-writing` | I'm about to talk with ten home cooks one-on-one to understand how they plan meals each week. Can you prepare the questions and follow-ups so I don't lead them? | `interview-guide-writing` |
| 54 | `interview-guide-writing` | I have a clickable meal-planner prototype and want participants to try to complete tasks with it while I watch. Prepare the session. | `usability-test-planning` |
| 55 | `issue-breakdown` | Our goal is that tenants can pay rent online through the portal. Can you turn that into a set of tickets my team can pick up and discuss? | `issue-breakdown` |
| 56 | `issue-breakdown` | I have one ticket, tenant rent payment by card, and I need it fully specified with detailed acceptance criteria so a developer can build it tonight. | `refine-issue` |
| 57 | `journey-mapping` | I want to lay out everything a customer goes through from first noticing our moving service to unpacking in the new home, including calls, emails, and the stuff that happens off our website. | `journey-mapping` |
| 58 | `journey-mapping` | Show me each screen and decision a user hits inside our app to book a mover, and where they drop off. | `user-flow-mapping` |
| 59 | `kit-router` | I've got a half-formed product concept and a deadline, and I honestly don't know which of your tools to reach for first. Where should I begin? | `kit-router` |
| 60 | `kit-router` | Please run the dependency audit on our repo and list the risky packages. | `dependency-audit` |
| 61 | `merge-readiness-check` | Both reviewers finished on the cart-refactor change. Before I click merge, can you confirm everything required is actually in place? | `merge-readiness-check` |
| 62 | `merge-readiness-check` | Two reviewers each gave me a list of problems with the cart change. Can you combine them into one list and tell me what has to be fixed first? | `review-reconciliation` |
| 63 | `migration` | We have to move our app from the old v1 payments API to v2 without downtime and with a way back if it goes badly. Can you plan the steps? | `migration` |
| 64 | `migration` | The approved spec for a new user-profile form field is attached, saving to the existing table. Please build it. | `feature-build` |
| 65 | `outcome-slicing` | We want to overhaul how our volunteer-scheduling tool works for coordinators and volunteers, and it's far too big to ticket right away. How should we carve it up into major chunks that each deliver something real? | `outcome-slicing` |
| 66 | `outcome-slicing` | Here are the three major chunks for the volunteer-scheduling overhaul. Break the first one into individual tickets. | `issue-breakdown` |
| 67 | `persona-and-scenario-drafting` | I've got interview summaries and survey results about our freelance users. Turn them into a few representative user profiles and short stories of a typical day using the app. | `persona-and-scenario-drafting` |
| 68 | `persona-and-scenario-drafting` | I have forty pages of raw interview transcripts about freelancers. Pull out the main patterns people described. | `research-synthesis` |
| 69 | `portfolio-case-study-writing` | I redesigned a clinic's booking app last year and want to turn it into a portfolio piece. Ask me what you need and write it up honestly. | `portfolio-case-study-writing` |
| 70 | `portfolio-case-study-writing` | Here's my resume. Pick which of my projects to show for a senior product designer opening at a bank. | none |
| 71 | `problem-framing` | My boss said we should make onboarding for new hires better, and that's all I've got. Help me figure out what we're actually trying to solve before I start planning. | `problem-framing` |
| 72 | `problem-framing` | I need to understand why new hires struggle during onboarding, so I want to plan some conversations with recent hires and write the questions. | `interview-guide-writing` |
| 73 | `refactor` | The pricing module is a tangled 900-line file that nobody wants to touch. Can you reorganize it so it's easier to work with, without changing what it does? | `refactor` |
| 74 | `refactor` | The pricing module returns the wrong total when a discount is applied twice. Can you correct that? | `bug-fix` |
| 75 | `refine-issue` | This ticket about bulk user import is vague. Walk me through the open questions one at a time until we have a spec I can approve for the team. | `refine-issue` |
| 76 | `refine-issue` | I have a half-formed idea for a plugin system. Interview me to pin down the choices, but there is no ticket yet. | `decision-interview` |
| 77 | `regression-review` | I just finished changing how session tokens are validated. What else in the app could this have quietly broken, and do our tests cover it? | `regression-review` |
| 78 | `regression-review` | Does my session-token change meet every acceptance criterion in the spec? | `independent-code-review` |
| 79 | `repo-conventions-setup` | Our repo has no notes telling the AI where tickets, design docs, and test commands live. Can you write that down in our AGENTS.md? | `repo-conventions-setup` |
| 80 | `repo-conventions-setup` | Can you improve the README so new contributors understand how to get started? | `documentation-pass` |
| 81 | `requirements-definition` | My manager said "make the settings page better" and that's all I have. Help me turn that into specific things we can check off as done or not done. | `requirements-definition` |
| 82 | `requirements-definition` | Slice this settings redesign goal into epics and delivery milestones for the quarter. | `outcome-slicing` |
| 83 | `research-synthesis` | I ran twelve calls with customers and have messy notes in a doc. What do they collectively tell us, and how sure can we be? | `research-synthesis` |
| 84 | `research-synthesis` | I haven't talked to anyone yet. Help me write the questions to ask nine customers next week. | `interview-guide-writing` |
| 85 | `responsive-implementation` | I have an approved layout plan for the pricing page. Please build it in CSS so it holds up on phones, tablets, and when people zoom to 200 percent. | `responsive-implementation` |
| 86 | `responsive-implementation` | Before anyone codes the pricing page, I need a plan describing how the layout should change across screen sizes, orientations, and text-size settings. | `responsive-layout-planning` |
| 87 | `responsive-layout-planning` | Our dashboard has to work on a phone, a tablet in landscape, and a desktop, and also for people who bump their text size way up. How should the layout change at each? | `responsive-layout-planning` |
| 88 | `responsive-layout-planning` | The layout plan is approved. Write the CSS media and container queries for the dashboard. | `responsive-implementation` |
| 89 | `review-reconciliation` | I got three review reports on the same commit with overlapping complaints. Please merge them into one deduplicated list and say how much re-review the fix needs. | `review-reconciliation` |
| 90 | `review-reconciliation` | Both reviews passed and the fixes are in. Should we ship this to production tonight? | `deployment-readiness` |
| 91 | `reviewer-qualification` | Before I let this new model do code reviews for our payments service, I want proof it actually catches real bugs. Can you test it with a planted-bug change? | `reviewer-qualification` |
| 92 | `reviewer-qualification` | Here's a pull request for the login form. Please review it against the ticket and tell me if it passes. | `independent-code-review` |
| 93 | `roadmap-writing` | Our investors and partner teams keep asking where the pet-adoption platform is heading. I need a single page that shows direction without a pile of tickets or fake dates. | `roadmap-writing` |
| 94 | `roadmap-writing` | Our pet-adoption platform team needs a Gantt-style delivery schedule with a firm launch date for each feature that we can promise to the shelters. | none |
| 95 | `simplification-review` | The conference-badge printing project is overrunning, and the venue opens in three weeks. What's the least we can build and still check people in? | `simplification-review` |
| 96 | `security-audit` | Before launch, I'd like someone to look at our API's code and config for weaknesses, like missing access checks or leaked secrets, and show how an attacker would reach them. | `security-audit` |
| 97 | `security-audit` | Which of our npm packages are out of date or carry known CVEs? | `dependency-audit` |
| 98 | `semantic-html-structure` | Our settings page is all divs with click handlers. Can you rewrite the markup with proper headings, regions, real buttons, and labeled form fields? | `semantic-html-structure` |
| 99 | `semantic-html-structure` | We shipped our settings page last month. Can you check it against WCAG and give me a prioritized list of problems? | `accessibility-review` |
| 100 | `session-handoff` | I'm almost out of context and need to stop for the night. Write up where things stand so a brand new chat can pick up tomorrow. | `session-handoff` |
| 101 | `session-handoff` | Write a progress update for our executives on where the project stands against plan. | `status-reporting` |
| 102 | `simplification-review` | Our import feature has a plugin layer, three config formats, and a queue, but it only reads one CSV. What could we drop and still do the job? | `simplification-review` |
| 103 | `skill-authoring` | I do the same release-notes routine every week. Can you turn it into a reusable skill that other AI assistants can follow, and fix why it never triggers? | `skill-authoring` |
| 104 | `skill-authoring` | I want a new reviewer agent with its own role and responsibilities for our security checks. | none |
| 105 | `status-reporting` | The board wants to know how the warehouse-scanning rollout is going. Our tracker says most things are done, but I don't trust it. Can you tell me where things really stand? | `status-reporting` |
| 106 | `status-reporting` | Based on how the warehouse-scanning rollout has gone so far, tell me the exact date we'll finish. | none |
| 107 | `technical-debt-audit` | Every change in this codebase takes longer than the last. Before the big rewrite quarter, list what is slowing us down, what it costs, and what to clean up first. | `technical-debt-audit` |
| 108 | `technical-debt-audit` | Which of the tickets in our backlog are stale, duplicated, or missing a done signal? | `backlog-health-check` |
| 109 | `usability-test-planning` | I want to watch six new users try to book a hotel on our prototype. Plan who to recruit, what tasks to give, and how we'll judge success. | `usability-test-planning` |
| 110 | `usability-test-planning` | I want to know whether 10,000 shoppers would pay more for next-day delivery. | none |
| 111 | `user-flow-mapping` | Walk me through every step and branch a person takes in our app to return an item, and point out dead ends or places they'd get stuck. | `user-flow-mapping` |
| 112 | `user-flow-mapping` | Map how a shopper feels from seeing an ad through delivery, return, and a follow-up support call. | `journey-mapping` |
| 113 | `ux-microcopy-writing` | The error under the password field just says "Invalid input". Can you rewrite that, plus the button and the empty-inbox message, so they sound friendly and clear? | `ux-microcopy-writing` |
| 114 | `ux-microcopy-writing` | Write the 800-word launch announcement blog post for our new inbox feature. | none |
| 115 | `visual-design-critique` | Here's my landing page mockup. Does the hierarchy work, is the spacing consistent, and does the type feel right? Please separate real problems from just taste. | `visual-design-critique` |
| 116 | `visual-design-critique` | Does my landing page mockup meet WCAG contrast and keyboard requirements? | `accessibility-review` |
