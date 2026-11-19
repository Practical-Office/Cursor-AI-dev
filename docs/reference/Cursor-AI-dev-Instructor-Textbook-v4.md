# Cursor + Matt Pocock Skills
## Instructor Textbook (v4 — operational)

**Audience:** Instructors who must teach and enforce the course under real pressure, and engineers who must defend the process.  
**Last updated:** October 28, 2026  
**Companion artifacts:** Living process (`CURSOR-MATT-SKILLS-PROCESS.md` v1.2), module source (`MODULES-SOURCE-v4.md`), workshop agenda, Evidence Pack.  
**Rule:** Course modules lag the living process. This textbook lags both and expands them for enforcement. It does not invent process.  
**Skills pin:** mattpocock/skills **v1.3.x** (verified release 1.3.1). Install with `npx skills@latest add mattpocock/skills -a cursor` (engineering set + `setup-matt-pocock-skills`). Detect drift by comparing skill front-matter against the living process taxonomy every cohort.

---

# Introduction — Why this course exists

Most engineers treat the agent as faster autocomplete. First draft appears quickly. Cost appears later: rework, review thrash, tickets that cannot be verified, domain language that does not match `GLOSSARY.md`.

An unconstrained agent invents requirements, skips edge cases, produces horizontal slices, and leaves a large unreviewable diff. Capability rose; mess size rose faster.

This course replaces that pattern with a skills-driven chain that forces shared understanding before code, vertical slices that fit one context window, Red→Green only, and dual-axis review. Every step exists because the preceding step fails predictably when skipped.

Preferred chain (non-negotiable):

```
/setup-matt-pocock-skills  (once per repo — hard gate)
→ route before grill (/wayfinder | /grill-with-docs); /triage when tracker intake
→ /to-spec                 (synthesis only; three mandatory sections)
→ /to-tickets              (tracer-bullet vertical slices; slice test)
→ pre-Build review         (ticket + plan; ≥2 concrete findings)
→ /implement               (Red→Green only at seams; CI-matching commands)
    └─ auto /code-review   (model-invoked; Standards ‖ Spec)
   OR /implement-spec      (alternate: one integration branch; not the Day 3 exercise)
→ must-fix committed
→ /retro                  (environment; not an Evidence Pack item)
```

`/code-review` is nested under `/implement` — not a separate typed chain step.

Supporting skills (`/prototype`, `/diagnosing-bugs`, `/ask-matt`, `/improve-codebase-architecture`, `/pr`, `/wizard`, etc.) are reached when the main chain surfaces the exact failure mode they solve. They are not optional decoration. `/implement-spec` is the alternate at implement. `/retro` closes a real session and is not a certification artifact.

The rest of this book states the exact failure mode each piece attacks, the artifact that proves the step occurred, the instructor reset script when the step is skipped, and the binary evidence required for credit.

---

# Chapter 0 — Setup as a hard gate

## Failure mode this chapter attacks

Agent improvises process because tracker location, triage labels, and domain-doc layout are unknown. Later skills invent labels and write fiction into the wrong place. Evidence Pack fails.

## Exact rules

`/setup-matt-pocock-skills` is user-invoked, once per repo. It writes:
- issue-tracker config
- triage-label vocabulary (`docs/agents/triage-labels.md`) only when `/triage` is installed
- domain-doc layout (`GLOSSARY.md`, or `GLOSSARY-MAP.md` when the repo indexes more than one glossary, plus `docs/adr/`)

Until those files exist and are pointed at by the student, no later module begins. Verbal confirmation is rejected.

Rules (`.cursor/rules` or project rules) are always-on static context — short, specific, point at real examples. Skills are loaded only when invoked and refuse to write code until their process steps complete. That refusal is the point.

**Taxonomy (architecture, not preference):**
- User-invoked (typed, `disable-model-invocation: true`): `/ask-matt`, `/grill-with-docs`, `/wayfinder`, `/triage`, `/improve-codebase-architecture`, `/setup-matt-pocock-skills`, `/to-spec`, `/to-tickets`, `/implement`, `/implement-spec`, `/retro`
- Model-invoked (agent or orchestrator reaches; never typed as normal flow step): `/prototype`, `/diagnosing-bugs`, `/research`, `/tdd`, `/domain-modeling`, `/codebase-design`, `/code-review`, `/pr`, `/wizard`

Student who types `/code-review`, `/domain-modeling`, `/tdd`, `/pr`, or `/prototype` as a primary command has misunderstood the architecture. `/implement` reaches `/tdd` + `/code-review`. `/grill-with-docs` reaches `/domain-modeling`. `/implement-spec` reaches `/tdd` inside each implementer and `/code-review` at closeout.

## Instructor pre-flight (mandatory before Day 1)

1. Install the official set yourself.
2. Run `/setup-matt-pocock-skills` in a throwaway real repo.
3. Produce the three config files.
4. Confirm local CI-equivalent commands match the project pipeline.
5. Keep the setup transcript; it is the model for student Evidence Pack item 1.

## Teaching note + reset script

Do not lecture taxonomy for twenty minutes. Install → run setup in each student’s real repo → force the student to point at the files the skill wrote.  
**Reset language when skipped:** “Setup files missing. No Module 1. Run `/setup-matt-pocock-skills` now. Point at the three files. Clock starts when the files are visible.”

---

# Chapter 1 — Reality check and the cost of undisciplined use

## Failure mode

Engineer pastes feature request into Agent, accepts bulk suggestions, merges. Happy path works. Edge case appears two weeks later. Domain language does not match GLOSSARY.md. Diff was large; original request never became a verifiable specification. Root cause is missing shared understanding before code, not model quality.

## Cursor surfaces (precise)

- Agent = the building surface. Multi-file edits, terminal, browser. Do not teach a Chat-versus-Composer split. That framing is outdated.
- Side chat = a question or tangent that must not steer the main thread. Not a second builder.

Students leave able to state in one sentence why Agent is the surface for multi-file work.

**Note only (October 28, 2026). Not graded. Not certified.**
- Cloud agents run in a Cursor-managed environment and can produce interactive canvases. They do not replace the local agent for this course.
- Remote control shows the local agent on the Cursor iOS app. The agent stays on the computer. Enterprise organizations keep it off until an admin turns it on.
- The Agent SDK packages an agent you ship as a folder (`instructions.md`, `tools/`, on-demand `skills/`). `npx @cursor/agent-sdk init` starts one. That packaging is not the mattpocock/skills install.

## Route before grill (mandatory — not the `/triage` skill)

Most common early-cohort failure: default every item into `/grill-with-docs`. That skill is correct for scoped work when a codebase already exists. It is wrong for foggy or multi-session work.

| Situation | Typed skill |
|-----------|-------------|
| Foggy or >1 agent session | `/wayfinder` |
| Scoped + codebase exists | `/grill-with-docs` |
| No codebase yet | route via `/wayfinder` or scaffold minimal repo; attach minimal correct `@` when code exists → `/grill-with-docs` |

**`/triage` (tracker intake)** — separate block: existing issue/PR needs categorize, state, verify, brief. May grill inside triage. Do not collapse with the route-before-grill gate.

## Three Pillars (properties of the grilling engine)

1. **Context Engineering** — correct `@` files/folders before the grill starts. Wrong context → confident wrong answers.
2. **Assumption Destruction** — force every assumption open and attack it. Facts that can be answered by reading the codebase are answered by reading the codebase. Decisions that require trade-offs are grilled. (facts vs decisions, explicit since skills v1.1 and still the rule on v1.3.x.)
3. **Stress Testing** — failure modes, scale, future regret, removal test. Expensive decisions become ADRs.

Grilling that skips any pillar is theater.

## Durable artifact standard

Verbal summary is not an artifact. Committed entry in GLOSSARY.md or short ADR under `docs/adr/` is an artifact. Pairs that only talk have not completed the exercise. This trains the Evidence Pack reflex: if it is not in the repo or tracker, it did not happen.

## Live demo (required)

Same real backlog item, three paths, side-by-side residual risk and GLOSSARY.md update:
- Path A: raw accept-everything
- Path B: weak grill (no pillars, no artifact)
- Path C: full three-pillar `/grill-with-docs` with correct priming

Students state the difference in residual risk and reviewability in one sentence each.

## Instructor reset scripts

- Defaulting to grill: “Route decision missing. State the one-sentence reason for the skill you chose. Restart.”
- No artifact: “GLOSSARY.md / ADR not committed. Credit is zero until the file exists.”
- Typing model-invoked skill as primary: “Architecture misunderstanding. `/implement` reaches `/code-review`. Restart from the correct user-invoked skill.”

---

# Chapter 2 — From grill to specification

## Failure mode

Teams treat `/to-spec` as a thinking tool. They produce polished documents that were never stress-tested. Implementation discovers missing edge cases, unstated non-goals, residual risks that were never written.

## Exact rule

`/to-spec` is synthesis only. It reads the conversation that already happened and publishes a clean specification to the configured issue tracker. The only reliable input is a completed grill that applied all three pillars. Anything less is fiction with good formatting.

## Three mandatory sections (any missing → reject on the spot)

1. Acceptance criteria — verifiable and observable. “Works better” is rejected. “User can complete checkout with a valid cart and receives confirmation email within 30 s” is accepted.
2. Non-goals — explicit bounds. Without them the agent expands scope under “while we’re here.”
3. Residual risks — named uncertainties that remain after the grill. A claim of zero residual risk after a real grill is usually a grill that stopped too early.

## Context window discipline

Grill + `/to-spec` stay in one unbroken conversation window. Compacting or starting fresh before the specification is published throws away the context the synthesis needs. Implementation sessions start deliberately fresh from the ticket.

## Live demo

Same grilled conversation → weak-context `/to-spec` vs properly primed `/to-spec`. Score both against the three sections in the room. Incomplete sections are rejected immediately.

## Instructor reset

“Section X missing. Spec rejected. Return to the grill, apply the missing pillar, re-run `/to-spec`. No credit until all three sections are present and published.”

---

# Chapter 3 — Tickets and implementation

## Failure mode

Horizontal slicing produces intermediate states that cannot be demoed and diffs no one wants to review. Multi-session tickets recreate the context pollution the process exists to prevent. Teaching “red-green-refactor” inside `/implement` contradicts the current `tdd` skill definition and mixes concerns the process separated.

## Vertical tracer-bullet rule + slice test

A ticket fails and must be re-sliced immediately if:
- it cannot state, in one sentence, a user-observable behavior change, **or**
- its blocking edges are missing or circular.

No negotiation. Subjective sizing is rejected.

## Pre-Build review (before `/implement`)

Separate agent review of ticket + plan. Record ≥2 concrete findings (gaps, risks, missing seams). Surfaces problems before code is written. Taught and practiced on Day 3 before the first `/implement`.

## `/implement` exact behavior

1. Drives Red→Green only at pre-agreed seams (per current `tdd` skill: “Refactoring is not part of the loop. It belongs to the review stage”).
2. Runs the project’s real CI-equivalent commands. “Tests passed in the agent session” is not done.
3. Closes by invoking model-invoked `/code-review`.
4. Leaves refactor to the Standards axis of that review.

Each `/implement` starts from a clean context loaded with the ticket. Carrying prior conversation forward produces self-approval bias.

## `/implement-spec` (alternate, not the Day 3 exercise)

User-invoked. Use it when the spec’s tickets should land together on one integration branch. The skill reads the tickets as a task graph and runs implementer subagents across the ready frontier. Each implementer confirms its worktree is based on the integration branch, builds with `/tdd`, and merges the integration tip back so the merge fast-forwards. Closeout is `/code-review`. The goal is the integration branch, not a pull request. A draft pull request opens only when the tracker closes work through pull requests, or the student asks, and only after the first merge.

Day 3 practice stays on per-ticket `/implement`. Do not let a student skip the slice test or pre-Build review by choosing this path. Artifact 5 is still one Red→Green diff plus CI-green evidence, whether that diff came from `/implement` or from an implementer inside `/implement-spec`.

## Live demo

Same small ticket: “just build it” vs full `/implement`. Show diffs, test coverage at seams, review findings, residual risk. Students feel the difference; the lecture is unnecessary.

## Instructor reset

- Slice-test failure: “Ticket fails slice test. Re-slice now. One-sentence behavior + blockers required.”
- Refactor inside loop: “Refactor is a code-review output. Revert the refactoring commits. Restart Red→Green only.”
- Local green / CI red: “CI-equivalent commands are red. Not done. Fix inside this session.”

---

# Chapter 4 — Cleaning up and settling design questions

## Systematic diagnosis

Paste-the-error-and-pray fixes symptoms. `/diagnosing-bugs` forces: reproduce → minimise → hypothesise → instrument → fix → regression-test. Hypothesis and next smallest experiment must be stated before any code change. Model-invoked in normal flow; invocable by name for standalone production bugs.

## Dual-axis review (exact)

Parallel sub-agents, fresh context:
- **Standards** — repo conventions and code messiness vs project norms. (Facilitators may optionally name Fowler smells for enrichment; not a learner gate.)
- **Spec** — does the code implement the originating ticket/spec? If no spec can be found, report “no spec available”; do not invent requirements.

Gate: every must-fix finding is committed as a fix the same day. Findings without commits = failed exercise.

## Architecture deepening

`/improve-codebase-architecture` produces a visual HTML report of small, high-leverage deepenings. Large rewrite proposals are rejected. The skill then grills the selected opportunity.

## Prototype (throwaway answer to one design question)

Two exclusive branches (skills v1.2, still current on v1.3.1):
- LOGIC / state — one shareable HTML file (plain HTML/CSS/JS, no build). Labelled state, free-play buttons, tabbed guided walkthroughs. A non-developer opens it by double-click. The HTML shell is the throwaway. A portable logic module may lift into real code only after the verdict.
- UI — several radically different variations on a single route, switchable via floating bar + URL parameter.

Rules (from the current skill):
- Throwaway from day one, clearly marked.
- Lives next to the real module.
- Trivial to run (double-click the HTML file, or one project command for a UI route).
- No persistence by default.
- No tests or abstractions beyond runnable.
- When answered: fold the validated decision into real code; commit the prototype on a `prototype/…` branch off the default branch; leave a pointer on the implementation issue; record the verdict and the question. Do not merge the branch. Do not delete it. Hardening the shell into production code is process failure.

## `/pr` (model-invoked)

When a pull request body is written, the shape is: a summary that is the smallest visual that makes the change clear, before/after evidence that it works, and a merge-danger call (one-way or two-way door, plus blast radius). Students do not type `/pr` as a chain step. Do not add it to the Evidence Pack.

## Instructor enforcement on Day 4

Force dual-axis Spec ‖ Standards findings. Force same-day commits for every must-fix. Force at least one prototype on a `prototype/…` branch (never merged, not deleted) with a recorded verdict. Use real diffs from Day 3. `/diagnosing-bugs` does not hand off into `/improve-codebase-architecture`. After a fix lands, `/retro` (Day 5) asks what would have prevented the bug. Architecture deepening is for a missing seam.

**Pre-Build agent review (taught once):** After tickets and plan exist, before Build / `/implement`, run a separate review agent on ticket + plan; capture ~2 concrete findings (plan note or issue comment). Not a substitute for dual-axis closeout review.

Reset language: “Must-fix finding has no committed fix. Day is not complete. Fix now.”

---

# Chapter 5 — Full workflow under pressure

## Why no new theory

Process practiced only when there is no deadline is not learned. Day 5 is pure execution on real open work, group review of artifacts, and structured `/ask-matt` decision log. `/retro` is a short close after that work (environment suggestions, most severe first, not product code). It is not a new lecture and not an Evidence Pack item. `/pr` fires only if a pull request body is actually written.

Instructor job: enforcement only. Force missing pillars, kill tickets that fail the slice test, stop context pollution, protect the working session from new lecture content. Any “reality check” discussion is grounded solely in the artifacts just produced.

## `/ask-matt` decision log (closing artifact)

Three real scenarios from the student’s own week → routing decision the skill returns → one sentence of agreement or disagreement per scenario. Deviation is allowed only when written and defensible. Free-form personal frameworks are rejected; they reinvent what the skill already automates.

## What “done” for the week looks like (binary, inspected)

In the repo and the tracker:
- Completed `/setup-matt-pocock-skills` output.
- At least one route-before-grill decision with written reasoning.
- Published specification with all three mandatory sections.
- Ticket graph that passes the slice test.
- At least one Red→Green `/implement` diff with CI-matching commands green.
- Dual-axis review (Spec ‖ Standards) with committed fixes for every must-fix.
- Three `/ask-matt` transcripts with written agreement or deviation.
- Prototype on a `prototype/…` branch with recorded verdict (Evidence Pack artifact 8 — required). Not merged. Not deleted.

Self-reported confidence is not a metric. The Evidence Pack is the metric.

---

# Cross-cutting teaching principles (enforcement)

1. Artifacts over affirmation. If it is not in the repo or the tracker, it did not happen.
2. Binary gates over gradients. Incomplete specs, tickets that fail the slice test, reviews without fixes are rejected, not scored partially.
3. Demo the cost. Every major teaching point has a side-by-side on the same real item. Residual risk and reviewability are the argument.
4. Enforce in the room. Circulation is mandatory. Pairs that drift into chat-only or skip triage are stopped and reset with the scripts above.
5. Modules lag the living process. When the process document changes, modules and this textbook are updated afterward. The process never lags the course.
6. Skills drift detection. Before each cohort, compare front-matter of installed skills against the living process taxonomy. Re-install if divergence appears.

---

# Instructor pre-work checklist (hard gate for the instructor)

Before the first day:
- [ ] Living process and this textbook read.
- [ ] Official skills installed and `/setup-matt-pocock-skills` run in a real repo; three config files produced.
- [ ] One complete preferred-chain cycle executed on a real team item; Evidence Pack items 1–6 produced personally.
- [ ] Side-by-side residual-risk demo prepared on a real backlog item.
- [ ] Reset scripts memorized for the five most common failure modes (skip setup, default grill, incomplete spec, slice-test failure, findings without fixes).
- [ ] Certification inspection checklist printed.

If any item is missing, the instructor is not ready. Do not start the cohort.

---

# Certification inspection protocol (lead reviewer)

Within 5 business days the student submits the Evidence Pack on real shipping work. Lead reviewer inspects only the artifacts:

1. Setup output files present and correct.
2. Route-before-grill decision + reasoning committed or in tracker.
3. Spec published with all three sections; incomplete → fail.
4. Ticket graph passes slice test; any failure → fail.
5. At least one Red→Green implement diff; CI commands green; no in-loop refactor.
6. Dual-axis review (Spec ‖ Standards); every must-fix has a committed fix same day.
7. Three `/ask-matt` transcripts + one-sentence agreement/deviation each.
8. Prototype on a `prototype/…` branch, verdict recorded, never merged to the default branch, branch left in place (required artifact 8).

Missing any required artifact → fail. No partial credit. No self-report accepted.

---

# How to use this textbook

- Before teaching a day: read the corresponding chapter + matching living-process section. Run the live demo yourself on a real item.
- During teaching: keep the failure modes and reset scripts visible. When a student exhibits one, name it and reset.
- After teaching: inspect the artifact trail against the binary success criteria. Self-report is rejected.

The course succeeds only when engineers ship higher-quality work with less rework and clearer domain models. Everything in this book exists to serve that outcome. Anything that does not is cut.

---

# Stop / Start directives for instructors

- Stop accepting verbal confirmation of setup, routing, or review. Start requiring the committed file or tracker entry before credit.
- Stop teaching red-green-refactor inside `/implement`. Start Red→Green only; refactor is a code-review output (current `tdd` skill).
- Stop allowing incomplete specs or tickets that fail the slice test to proceed. Start rejecting on the spot.
- Stop leaving must-fix findings unacted. Start requiring same-day committed fixes.
- Stop inventing personal “when to use what” frameworks. Start from `/ask-matt` transcripts only.
- Stop letting the course lead the living process. Start updating modules and this textbook only after the process document changes.

This is the hardened instructor textbook. Modules and workshop agenda must lag the living process document.
