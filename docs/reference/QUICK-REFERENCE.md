# Quick Reference — Cursor + Matt Pocock Skills

**Print this. Keep it on the desk.** Full terms: `docs/glossary.html`.

## Taxonomy
- **User-invoked** (you type): ask-matt, grill-with-docs, wayfinder, triage, improve-codebase-architecture, setup-matt-pocock-skills, to-spec, to-tickets, implement
- **Model-invoked** (agent reaches): prototype, diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts

Do not type model-invoked skills as primary flow steps. `/implement` reaches `/tdd` and auto `/code-review`; `/grill-with-docs` reaches `/domain-modeling`.

## Route before grill
- **Foggy** / weak-context / >1 session → `/wayfinder`
- Scoped + properly primed `@` → `/grill-with-docs`
- No codebase → route via `/wayfinder` or scaffold; when code exists, attach minimal correct `@` → `/grill-with-docs`
- Existing issues need label movement → `/triage` (tracker skill — separate from routing)

## Main chain
```
setup → route (/wayfinder | /grill-with-docs)
  → /to-spec (3 sections · synthesis only)
  → /to-tickets (slice test)
  → pre-Build review (≥2 findings)
  → /implement (Red→Green + CI)
      └─ auto /code-review
  → must-fix committed
```

## Three Pillars
1. Context Engineering
2. Assumption Destruction
3. Stress Testing

## Non-negotiables
- Spec missing any of: acceptance criteria / non-goals / residual risks → reject
- Ticket fails slice test (one-sentence behavior or blockers) → re-slice
- Refactor is **not** inside implement; it is a `/code-review` output
- CI = same commands as PR pipeline — "agent said tests passed" ≠ done
- Must-fix review findings committed the same day
- Prototype is throwaway branch/folder; never merge to default branch

## Router
`/ask-matt` when unsure. Log: "For [situation], I routed to `/skill` because [reason]. Agreed / deviated because [one sentence]."
