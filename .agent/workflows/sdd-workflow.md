---
trigger: always_on
---

## SDD Workflow (Spec Driven Development)

The human gives instructions via chat. You (the agent) run this workflow for every request. Do not skip the spec; do not implement before design is aligned with principles. Apply all other rules in this folder.

---

### Instruction types (how to handle each)

| Instruction | Spec (Phase 1) | Design → Implement → Verify (Phases 2–4) |
|-------------|----------------|------------------------------------------|
| **Add feature** | Clarify goal, scope (in/out), acceptance criteria (testable). If unclear, ask the user in chat. YAGNI: only what was asked. | Choose layers/interfaces/patterns; implement; add/update tests; verify criteria. |
| **Update feature** | Clarify what changes (behavior, scope, acceptance criteria). Confirm current vs desired behavior. | Impact analysis; adjust design only where needed; implement; regression tests; verify. |
| **Fix bug** | Get reproduction steps, expected vs actual, root cause if known. Definition of done: bug fixed = … | Minimal fix; add regression test; verify no new anti-patterns (e.g. shotgun surgery, leaky abstraction). |
| **Doc update** | Clarify what docs (README, API docs, comments, runbooks) and what change (accuracy, completeness, user flow). | Update only the agreed scope; keep docs close to code; verify links and examples. |
| **User flow** | Clarify which flow (e.g. signup, checkout, onboarding), current vs desired steps, and success/error paths. | Treat as spec for UI/API/state; design then implement; verify flow end-to-end and edge cases. |

For any type: if the user's message is vague, ask one or two short questions in chat to lock spec before proceeding.

---

### Phase order (for all types)

1. **Spec** — From the user's instruction (and your questions if needed), state in chat or in code comments: goal, scope, acceptance criteria. For bugs: reproduction, expected vs actual. YAGNI. See `phases/spec.md` for checklist.
2. **Design** — Decide layers (e.g. handler → service → repository), interfaces, patterns. Check core-design-principles and architecture-and-patterns (no anti-patterns). Only then implement. See `phases/design.md`.
3. **Implement** — Code to the design. Inject dependencies; no magic numbers/strings; fail fast at boundaries. Follow security-mandate and reliability-and-errors.
4. **Verify** — Acceptance criteria met; relevant tests (for bugfix: regression test); no principle or anti-pattern violations. See `phases/verify.md` and code-review-checklist skill.

---

### Entry points

- **Chat** — Primary. Human requests via chat; agent runs Spec → Design → Implement → Verify in conversation.
- **Task** — For non-trivial requests. Create a task in `.agent/tasks/` to track spec, status, and acceptance criteria. Use `tasks/_template.yaml`.
- **Spec** — For traceability. Create a spec artifact in `.agent/specs/` using `specs/_template.yaml`. Links to task via `task_ref`.

---

### Critical

- Do not add functionality outside what the user asked for (YAGNI).
- Do not implement before the design is explicit enough (layers, interfaces, patterns).
- For bugfixes: minimal change set; regression test required; no shotgun surgery or leaky abstraction.
- For doc update: change only what was requested; do not refactor code unless the user asks.
- When in doubt, ask the user one short question rather than guessing scope or behavior.
