---
trigger: always_on
---

## Code Completion Mandate

### When a task is "done"

A task is **not** complete until the **Verify** phase of the workflow has been satisfied. Do not mark work as "done", "ready for review", or "complete" before then.

**Completion criteria:**

1. **Verify phase passed** — Acceptance criteria are met; relevant tests exist and pass; no principle or anti-pattern violations. See SDD Workflow @sdd-workflow.md.
2. **No skipped quality gates** — Do not defer tests, lint, or security checks to "later"; run them before claiming completion.
3. **Review checklist (when applicable)** — For features, bugfixes, or refactors, run through the code-review checklist (security, correctness, tests, design, docs, scope) before saying "done". See the code-review-checklist skill.

### What "done" does not mean

- Code written but not tested
- Tests written but not run or failing
- Design or spec assumed without explicit alignment
- Verification deferred to the user without the agent having run checks

### Enforcement

- When the user asks "is it done?" or you are about to summarize the work, confirm: Spec → Design → Implement → **Verify** (and checklist if applicable). If Verify has not been run, run it first or explicitly state what remains.
- Prefer one final verification step (run tests, run linter) before reporting completion.

### Related principles

- SDD Workflow @sdd-workflow.md (Phase order, Verify)
- Code review checklist skill (`.agent/skills/code-review-checklist/`)
