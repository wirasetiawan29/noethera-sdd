# Noethera SDD — Spec Driven Development (AI-first)

**Human:** give instructions in chat (add feature, update feature, fix bug, doc update, user flow).  
**AI:** read this README as the **core reference**, then follow the rules and workflows it points to. Run Spec → Design → Implement → Verify every time.

This README does not replace the rules — it is the **main index**: it tells you what exists and where each piece lives.

---

## For AI: how to use this repo

1. **Read this README first.** Core reference: SDD, structure, load order.
2. **Load `.agent/workflows/`, `.agent/rules/`, `.agent/skills/`** — tools typically load all three. See `.agent/README.md` and `.agent/MANIFEST.yaml` for the full index.
3. **Apply the workflow** from `.agent/workflows/sdd-workflow.md` and all rules for every user request.
4. **MANIFEST.yaml** — Central index. Use for tooling: rules, skills, triggers, tasks template.

---

## Structure

```
<repo-root>/
├── README.md                    ← core reference (you are here)
└── .agent/
    ├── MANIFEST.yaml            ← central index
    ├── workflows/
    │   ├── sdd-workflow.md      ← Spec → Design → Implement → Verify
    │   └── phases/              ← spec, design, verify checklists
    ├── rules/                   ← guardrails (24 rules)
    ├── skills/                  ← on-demand how-to (4 skills)
    ├── tasks/                   ← optional task tracking (_template.yaml)
    ├── specs/                   ← spec artifacts for traceability (_template.yaml)
    └── project/                 ← project-specific overrides (see stack-conventions.example.md)
        ├── rules/
        └── skills/
```

---

## Rules reference (summary)

| Path | Purpose |
|------|---------|
| **`.agent/workflows/sdd-workflow.md`** | **Start here.** Instruction types, phase order, entry points (chat, task). |
| **`.agent/rules/core-design-principles.md** | SOLID, DRY, KISS, YAGNI, separation of concerns. |
| **`.agent/rules/security-mandate.md** | Never trust input; deny by default; fail secure; defense in depth. |
| **`.agent/rules/reliability-and-errors.md** | Fail fast; error handling; resources; concurrency; idempotency. |
| **`.agent/rules/architecture-and-patterns.md** | Layering, pattern choice, anti-patterns. |
| **`.agent/rules/api-and-maintainability.md** | API design, testing, code organization, observability. |

Full list: see **`.agent/MANIFEST.yaml`** or **`.agent/README.md`**.

---

## Instruction types (from workflow)

- **Add feature** — Clarify goal/scope/criteria → design → implement → verify.
- **Update feature** — Clarify what changes → impact → implement + regression tests.
- **Fix bug** — Reproduction, expected vs actual → minimal fix + regression test.
- **Doc update** — Clarify which docs and what change → update only that scope.
- **User flow** — Clarify flow (steps, success/error) → treat as spec → design → implement → verify.

Full detail in **`.agent/workflows/sdd-workflow.md`**.

---

## Validation

Run `make validate` to check that MANIFEST and `.agent/` structure are intact.

---

## Share and use

- **Put this repo in git.** Share the repo URL so others (or the AI) can read it.
- **In a new project:** give the AI this repo's URL: "Use SDD from this repo — read the README first, then load .agent/workflows, .agent/rules, and .agent/skills."
- **Agent context:** Load `.agent/workflows/`, `.agent/rules/`, and `.agent/skills/`.

---

*README = core reference. MANIFEST = index. Workflows + rules + skills = full instructions.*
