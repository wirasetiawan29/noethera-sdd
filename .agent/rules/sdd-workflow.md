---
trigger: always_on
---

## SDD Workflow (Spec Driven Development)

For every request, run **Spec → Design → Implement → Verify**. Do not skip the spec; do not implement before design. Full detail: `workflows/sdd-workflow.md`.

### Phase order

1. **Spec** — Goal, scope, acceptance criteria. For bugs: reproduction, expected vs actual. YAGNI.
2. **Design** — Layers, interfaces, patterns. Check core-design-principles and architecture-and-patterns.
3. **Implement** — Code to the design. Follow security-mandate and reliability-and-errors.
4. **Verify** — Acceptance criteria met; tests; no anti-pattern violations. Use code-review-checklist.

### Instruction types

| Type | Spec | Then |
|------|------|------|
| Add feature | Goal, scope, criteria | Design → Implement → Verify |
| Update feature | What changes, current vs desired | Impact analysis → Implement → Regression tests |
| Fix bug | Reproduction, expected vs actual | Minimal fix + regression test |
| Doc update | Which docs, what change | Update scope only |
| User flow | Flow steps, success/error paths | Treat as spec → Design → Implement → Verify |

### Critical

- YAGNI. No functionality outside what was asked.
- Ask one short question if vague; do not guess.
- Bugfix: minimal change set; regression test required.
