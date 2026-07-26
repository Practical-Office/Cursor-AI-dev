# Quick Reference — Cursor + Matt Pocock Skills

**Print this. Keep it on the desk.**

## Taxonomy
- **User-invoked** (you type): ask-matt, grill-with-docs, wayfinder, triage, improve-codebase-architecture, setup-matt-pocock-skills, to-spec, to-tickets, implement
- **Model-invoked** (agent reaches): prototype, diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts

## Triage first
- Foggy / >1 session → `/wayfinder`
- Scoped + codebase → `/grill-with-docs`
- No codebase → prime, then `/grill-with-docs` once code exists

## Main chain
setup → triage → grill → `/to-spec` (3 sections) → `/to-tickets` (kill test) → `/implement` (Red→Green + CI commands) → `/code-review` (auto)

## Three Pillars
1. Context Engineering
2. Assumption Destruction
3. Stress Testing

## Non-negotiables
- Spec missing any of: acceptance criteria / non-goals / residual risks → reject
- Ticket fails one-sentence behavior or missing blockers → re-slice
- Refactor is **not** inside implement; it is a code-review output
- Local CI-equivalent commands must be green before commit
- Must-fix review findings committed the same day
- Prototype is throwaway; capture verdict; never harden in place

## Router
`/ask-matt` when unsure. Log the decision.
