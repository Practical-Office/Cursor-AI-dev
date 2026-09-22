#!/usr/bin/env bash
# Fail when Pack #8 / policy strings or module sync badges drift from living process.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROCESS="$ROOT/docs/reference/CURSOR-MATT-SKILLS-PROCESS.md"
V4="$ROOT/docs/reference/MODULES-SOURCE-v4.md"
CERT="$ROOT/docs/certification.html"
HUB="$ROOT/docs/index.html"
PRINT="$ROOT/docs/course-full.html"
JS="$ROOT/docs/js/cursor-ai-dev.js"

SYNC_BADGE="Last synced with process v1.1 (2026-09-22)"

PACK_PHRASES=(
  "eight required"
  "required, not optional"
  "Self-attest is not approval"
  "on full and intensive schedules"
  "honor-system only"
)

for f in "$PROCESS" "$V4" "$CERT" "$HUB" "$PRINT"; do
  if [[ ! -f "$f" ]]; then
    echo "missing file: $f"
    exit 1
  fi
done

for phrase in "${PACK_PHRASES[@]}"; do
  if ! grep -qF "$phrase" "$PROCESS"; then
    echo "process missing: $phrase"
    exit 1
  fi
  if ! grep -qF "$phrase" "$V4"; then
    echo "MODULES-SOURCE-v4 missing: $phrase"
    exit 1
  fi
done

if ! grep -qF "Self-attest is not approval" "$CERT"; then
  echo "certification.html missing self-attest line"
  exit 1
fi

if ! grep -qF "8 required artifacts" "$HUB"; then
  echo "index.html missing Evidence Pack chip wording"
  exit 1
fi

if [[ -f "$ROOT/docs/reference/MODULES-SOURCE.md" ]] || [[ -f "$ROOT/docs/reference/MODULES-SOURCE-v3.md" ]]; then
  echo "stale MODULES-SOURCE files must not remain under docs/reference/"
  exit 1
fi

for n in 1 2 3 4 5; do
  mod="$ROOT/docs/module-$n.html"
  if ! grep -qF "$SYNC_BADGE" "$mod"; then
    echo "module-$n.html missing sync badge"
    exit 1
  fi
done

if ! grep -qF 'Do not keep prompting the agent to "make it work."' "$JS"; then
  echo "cursor-ai-dev.js missing escalate strip text"
  exit 1
fi

if ! grep -qF "Learner-summary-only" "$PRINT"; then
  echo "course-full.html missing learner-summary-only label"
  exit 1
fi

echo "course content drift checks OK"
