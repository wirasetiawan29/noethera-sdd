---
name: code-review-checklist
description: Use before marking a change "done" or requesting human review. Ensures security, correctness, tests, and consistency with project rules. Apply when completing a feature, bugfix, or refactor.
---

# Code Review Checklist

Use this skill when you are about to say a task is complete or to prepare a change for human review. Run through the checklist and fix or note any gaps.

## When to use

- After implementing a feature, bugfix, or refactor
- Before suggesting "ready for review" or "done"
- When the user asks you to review your own changes

## Workflow

1. **Load the checklist** from `assets/checklist.md` (or use the summary below).
2. **For each item,** confirm the change complies. If not, fix it or explicitly call out the exception and risk.
3. **Summarize:** List any items that are not met and what was done (fixed vs accepted risk).

## Checklist summary

- **Security:** No hardcoded secrets; input validated at boundaries; no injection (SQL, command, etc.); fail secure.
- **Correctness:** Errors handled; resources cleaned up; timeouts/cancellation where appropriate; no silent failures.
- **Tests:** New/updated behavior covered; regression test for bugfixes; tests pass.
- **Design:** Matches existing architecture and patterns; no circular dependencies; clear boundaries.
- **Docs & style:** Public API/docs updated if needed; naming and style consistent; no leftover debug or commented-out code.
- **Scope:** Only what was requested (YAGNI); no unrelated refactors unless agreed.

For the full checklist with sub-items, see `assets/checklist.md`.

## Related

- SDD Workflow (Verify phase), Rugged Software Constitution, Security Mandate — see `.agent/rules/`
