# Cursor-AI-dev

**Practical AI Engineering — 5-Day Course**  
Living process + published onboarding course for disciplined Cursor + Matt Pocock skills work.

**Live site (when published):** https://practical-office.github.io/Cursor-AI-dev/  
**Hub index:** https://practical-office.github.io/dev-sops/  
**Repo:** https://github.com/Practical-Office/Cursor-AI-dev

## Purpose

Make competent engineers efficient and disciplined with Cursor + the current mattpocock/skills system (v1.1+).  
Not prompt monkeys. Not first-draft speed. Measured by rework reduction, domain-model clarity, and verifiable tickets.

## Source of truth

| Artifact | Location |
|----------|----------|
| Living process (edit here) | `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md` |
| Published course (HTML) | `docs/` (GitHub Pages) |
| Workshop agenda | `docs/reference/WORKSHOP-AGENDA.md` |
| Module source (for HTML conversion) | `docs/reference/MODULES-SOURCE.md` |
| Quick reference | `docs/reference/QUICK-REFERENCE.md` |
| Certification | `docs/certification.html` (to be generated) |

Course modules **lag** the living process document. Never the reverse.

## Skills source

https://github.com/mattpocock/skills (canonical)

## Local preview

```bash
cd docs && python3 -m http.server 4177
```

Open http://localhost:4177

## Deployment

GitHub Pages from `/docs` on `main`. See `docs/reference/DEPLOY.md` (to be added).

## Related courses

| Loop | Course |
|------|--------|
| Bug | [bug-handling-sop](https://practical-office.github.io/bug-handling-sop/) |
| Update | update-sop |
| BML | bml-onboarding |
| Cursor + Matt Skills | this repo (Cursor-AI-dev) |

## Status

First full draft — July 2026.  
Aligned to mattpocock/skills taxonomy (user-invoked vs model-invoked), Red→Green TDD only, dual-axis review, `/prototype`, local CI-matching verification.
