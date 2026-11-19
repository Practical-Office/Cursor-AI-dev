# Cursor-AI-dev

**Practical AI Engineering — 5-Day Course**  
Living process + published onboarding course for disciplined Cursor + Matt Pocock skills work.

**Live site:** https://practical-office.github.io/Cursor-AI-dev/  
**Hub index:** https://practical-office.github.io/dev-sops/  
**Repo:** https://github.com/Practical-Office/Cursor-AI-dev

## Purpose

Make competent engineers efficient and disciplined with Cursor + the current mattpocock/skills system (v1.3.x; verified 1.3.1 on 2026-10-28).  
Not prompt monkeys. Not first-draft speed. Measured by rework reduction, domain-model clarity, and verifiable tickets.

## Source of truth

| Artifact | Location |
|----------|----------|
| Living process (edit here) | `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md` |
| Published course (HTML) | `docs/*.html` (GitHub Pages) |
| Workshop agenda | `docs/reference/WORKSHOP-AGENDA.md` |
| Module source (HTML conversion) | `docs/reference/MODULES-SOURCE-v4.md` |
| Quick reference | `docs/quick-reference.html` · `docs/reference/QUICK-REFERENCE.md` |
| Certification | `docs/certification.html` |

Course modules **lag** the living process document. Never the reverse.

**Last updated:** October 28, 2026. Living process v1.2. Changelog: [`docs/reference/CURSOR-MATT-SKILLS-PROCESS.md`](docs/reference/CURSOR-MATT-SKILLS-PROCESS.md) §10. Domain language: [`GLOSSARY.md`](GLOSSARY.md).

**Content drift CI:** `scripts/check-course-content-drift.sh` enforces phrase/policy locks and sync-badge wording — not a full HTML ↔ `MODULES-SOURCE-v4.md` regenerate. Aligning published HTML with v4 after source edits is manual.

## Skills source

https://github.com/mattpocock/skills (canonical)

## Local preview

```bash
cd docs && python3 -m http.server 4177
```

Open http://localhost:4177

## Deployment

GitHub Pages from `/docs` on `main`. See [`docs/reference/DEPLOY.md`](docs/reference/DEPLOY.md).

## Related courses

| Loop | Course |
|------|--------|
| Bug | [bug-handling-sop](https://practical-office.github.io/bug-handling-sop/) |
| Update | [update-sop](https://practical-office.github.io/update-sop/) |
| BML | [bml-onboarding](https://practical-office.github.io/bml-onboarding/) |
| Cursor + Matt Skills | [this course](https://practical-office.github.io/Cursor-AI-dev/) |
