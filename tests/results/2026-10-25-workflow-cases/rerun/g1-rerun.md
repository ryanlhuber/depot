# Goal to Backlog: goal changed after stage 3

**Branch taken:** "If the requester changes the goal during the workflow, restart from stage 1 and record what was discarded." The old stages 1-3 outputs are not patched. The workflow restarts at stage 1 and stops there until the requester confirms the new goal sentence.

## Discarded (recorded)
- Old goal: "Let neighborhood libraries lend tools (drills, ladders) to members."
- Old problem frame, assumption register and epic outline, all built on that goal. They are not carried forward.
- Specifically dropped: power tools and ladders as the lending scope, and any assumption or epic that depended on them. I can't check which ones those were, because stages 1-3 were not produced in detail.
- Nothing from items or dependency stages was discarded, because stages 4-6 never ran.

## Stage 1: Frame (Delivery Planner, Problem Framing)

**Goal sentence (unconfirmed):** Let libraries lend seeds and garden tools only to members, with power tools excluded. *(Supplied: requester's correction. My one-sentence restatement is not yet confirmed.)*

- **Who and situation:** Libraries and their members. *(Supplied, by the original goal and the correction.)* Nothing more about who they are or why they want this was supplied. I have not invented it.
- **Fixed constraints:** Only seeds and garden tools may be lent. *(Supplied.)* No other constraints were stated.
- **Preferences that can bend:** None stated.
- **Non-goals:** Lending power tools. *(Supplied.)* Ladders were in the original goal and are not mentioned in the correction. Whether they are out is **open**. I am not assuming either way.
- **Success measures:** None supplied. I will not invent any, so this is a gap.
  - Observable candidates to propose, each **Assumed** and needing the requester's choice: a member borrowing a seed item and a garden-tool item and returning it; a library listing only allowed categories.
  - No baselines are known.
- **Assumptions (Assumed):**
  - "Seeds" means items that are borrowed and not returned. It is unclear whether that is intended.
  - "Garden tools" is a definable category, so power tools are separable from it.
  - Members, not the public, are the borrowers.
- **Open questions** (each names who can answer it and what changes):
  1. Is the goal sentence above right? *(Requester. Everything downstream depends on it.)*
  2. Are ladders out, along with power tools? Would a hand-powered or electric garden tool count as a "power tool"? *(Requester. This sets the scope boundary and the exclusion rule.)*
  3. How should seeds be lent: returned, replaced, or given away? *(Requester. This changes what a lending record and a done signal look like.)*
  4. What does success look like, and is there a baseline? *(Requester.)*

## Validation after stage 1
The goal sentence is **marked unconfirmed**, so the check passes only as "unconfirmed". The requester is available, so the planner should get confirmation before going further. The workflow's "proceed unconfirmed" path applies only when the requester is unavailable.

## Stop point
Stages 2-6 are not run. They need a confirmed or explicitly unconfirmed frame, and the open questions above could change the epics. The decisions are the requester's: confirm the goal sentence, rule on ladders and the "power tool" boundary, and say how seeds are lent.

## Report
**Stages run:** a branch to restart, then stage 1 (Frame) only. Stage 1's validation was applied.

**Stopped because:** the workflow requires the goal sentence to be confirmed while the requester is available. The corrected goal is also silent on success measures, ladders and seed handling, and those answers could change the epics.

**Not produced:** stages 2-6, because they would build on an unconfirmed frame. Success measures could not be written, because none were supplied.

**Assumptions I made:**
- The correction replaces the whole old goal and does not extend it.
- Old stage 1-3 content is discarded in full. I could not inspect it, so I listed only what the goal change implies.
- The requester is available, so I asked for confirmation instead of proceeding on an unconfirmed goal.
- The three assumptions listed in the frame.
- I read the two linked files for stage 1 only (the Delivery Planner agent and the Problem Framing skill). I did not read the other stage skills or the problem-frame template. The frame follows the skill's field list, not the template's exact layout.