# GLOSSARY.md — Cursor + Matt Pocock Skills Course

Domain language for this repo. Skills read `GLOSSARY.md` (and `GLOSSARY-MAP.md` only when a repo indexes more than one glossary). Use these terms exactly.

## Language

**Issue tracker**: The tool that hosts a repo’s issues, or local `.scratch/` markdown. Skills such as `to-tickets`, `to-spec`, and `triage` read from and write to it.

**Issue**: A single tracked unit of work inside an issue tracker — bug, task, spec, or slice produced by `to-tickets`.

**User-invoked skill**: Typed by the human. Model invocation disabled. Orchestrators. A user-invoked skill may invoke model-invoked skills, never another user-invoked skill.

**Model-invoked skill**: Reached by the agent or by an orchestrator when the task fits. Never a typed primary flow step. Typing one still works; that does not make it a chain step.

**Route before grill**: Before any grilling skill, decide which typed skill fits (`/wayfinder` or `/grill-with-docs`). Write one sentence of reasoning. This is not the same as typing `/triage`.

**Foggy / weak-context**: Backlog item is underspecified, spans more than one session, or you cannot name the correct `@` files yet. Route to `/wayfinder` first — do not force a single-session grill.

**Properly primed**: Minimal correct `@` files and folders attached before invoking a skill. The agent has the right code and docs in context — not an empty attach list, not a kitchen-sink dump.

**`/triage` (tracker intake)**: User-invoked skill for work already in the issue tracker — categorize, set state, verify, brief the agent. May grill inside triage. Different job from the route-before-grill gate.

**Tracer-bullet ticket**: A vertical slice that delivers end-to-end observable behavior and declares its blocking edges. Sized for one focused agent session.

**Slice test**: One-sentence user-observable behavior + recorded blockers. Fail either → re-slice. Formerly called “binary kill test.” Not the BML experiment kill criteria.

**Three Pillars**: Context Engineering, Assumption Destruction, Stress Testing — properties of the underlying grilling engine.

**Red→Green only**: The TDD loop inside `/implement` (and inside each `/implement-spec` implementer). Refactor is deferred to `/code-review`.

**Pre-Build review**: Separate agent review of ticket + plan before implementation. Record ≥2 concrete findings (gaps, risks, missing seams). Surfaces problems before code is written.

**Dual-axis review**: Standards (repo conventions and code messiness vs project norms) ‖ Spec (match to originating ticket). Parallel sub-agents. Post-implement closeout; auto from `/implement` and from `/implement-spec`.

**`/implement`**: User-invoked. Default build path. One ticket, Red→Green at pre-agreed seams, CI-matching commands, then model-invoked `/code-review`.

**`/implement-spec`**: User-invoked alternate to per-ticket `/implement`. Implements a whole spec on one integration branch. Reads tickets as a task graph and runs implementer subagents across the ready frontier. Each implementer uses `/tdd` and merges back so the integration branch fast-forwards. Closes with `/code-review`. The goal is the integration branch. A draft pull request opens only when the tracker closes work through pull requests, or you ask, and only after the first merge. Not the Day 3 exercise.

**`/pr`**: Model-invoked. The shape of a pull request body: a summary that is the smallest visual that makes the change clear, before/after evidence that it works, and a merge-danger call (one-way or two-way door, plus blast radius).

**`/retro`**: User-invoked close after review. Suggests changes to the agent’s environment (navigation, automated checks, coding standards, steering files, tooling), most severe first. Does not change product code. Not an Evidence Pack artifact.

**`/wizard`**: Model-invoked. Generates an interactive script that walks a human through steps only a human can perform (credentials, an unfamiliar dashboard, a one-off migration or cutover). The agent still does the steps it can do itself.

**`/wait-what`**: User-invoked productivity skill. Use the moment a message does not land. The agent re-pitches it in plain language, using this glossary. It repairs one message. It does not replace a shared language built with `/grill-with-docs`.

**`/to-questionnaire`**: User-invoked productivity skill. Turns a decision you cannot answer alone into a Markdown questionnaire for the person who can. The interview is about the send (who it is for, what you need back), not about the subject.

**`/prototype`**: Throwaway code that answers one design question. Logic or state → one shareable HTML file (no build step). UI → several variations on one route. When answered, fold the validated decision into real code, keep the prototype on a `prototype/…` branch off the default branch, point at that branch from the implementation issue, and record the verdict plus the question. Do not merge the branch. Do not delete it. Do not harden the prototype shell into production code.

## Relationships

- A user-invoked skill may invoke model-invoked skills.
- A model-invoked skill is never the primary typed entry point of the preferred chain.
- `/grill-with-docs` reaches `/domain-modeling` and maintains `GLOSSARY.md` and ADRs.
- `/implement` reaches `/tdd` and `/code-review`.
- `/implement-spec` reaches `/tdd` inside each implementer and `/code-review` at closeout.
- `/prototype` answers one design question. The answer is captured. The prototype file stays on its throwaway branch as evidence.
