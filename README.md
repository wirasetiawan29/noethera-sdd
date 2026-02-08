# SDD — Spec Driven Development (AI-first template)

**Human:** give instructions in chat (add feature, update feature, fix bug, doc update, user flow).  
**AI:** read this README as the **core reference**, then follow the rules it points to. Run Spec → Design → Implement → Verify every time.

This README does not replace the rules — it is the **main index**: it tells you what exists and where each rule lives. Use it first; then load the rule files by path below.

---

## For AI: how to use this repo

1. **Read this README first.** It is the core reference. From it you get: what SDD is, the file structure, and which rule file to use for what.
2. **Then read the rule files** listed in the [Rules reference](#rules-reference) section. Paths are relative to the repo root (e.g. `.agent/rules/sdd-workflow.md`). If you have this repo on disk, open those paths; if you have only the repo URL, fetch or resolve those paths from the same repo.
3. **Apply the workflow** from `sdd-workflow.md` and the rest of the rules for every user request.

No need to create extra files in the project — use this repo (README + rule files) as the single source of truth.

---

## Structure

```
<repo-root>/
├── README.md                    ← core reference (you are here)
└── .agent/
    └── rules/
        ├── sdd-workflow.md      ← workflow + instruction types
        ├── core-design-principles.md
        ├── security-mandate.md
        ├── reliability-and-errors.md
        ├── architecture-and-patterns.md
        └── api-and-maintainability.md
```

Only these files. README points to the rules; the rules hold the full instructions.

---

## Rules reference

Use this as the map. Each row is one rule file: **path** (relative to repo root) and **what it’s for**. Read the file at that path for the full text.

| Path | Purpose — when to use it |
|------|---------------------------|
| **`.agent/rules/sdd-workflow.md`** | **Start here.** Instruction types (add/update feature, fix bug, doc update, user flow), phase order Spec → Design → Implement → Verify, and critical do/don’ts. |
| **`.agent/rules/core-design-principles.md`** | SOLID, DRY, KISS, YAGNI, Separation of Concerns, Composition over Inheritance, maintainability. |
| **`.agent/rules/security-mandate.md`** | Never trust input; deny by default; fail secure; defense in depth; no hardcoded secrets; parameterized queries. |
| **`.agent/rules/reliability-and-errors.md`** | Fail fast; error handling; resources and concurrency; idempotency and retries. |
| **`.agent/rules/architecture-and-patterns.md`** | Layering, pattern selection (when to use what), anti-patterns to avoid. |
| **`.agent/rules/api-and-maintainability.md`** | API design, testing, code organization, documentation, observability. |

---

## Share and use

- **Put this repo in git.** Share the **repo URL** so others (or the AI) can read it.
- **In a new project:** give the AI this repo’s URL and say something like: “Use SDD from this repo — read the README first, then the rule files it points to.” The README is the core reference; the rules are at the paths above.
- **If your tool only loads rules from the project folder:** clone or copy this repo (or the `sdd/` folder) into the project so the AI can read `.agent/rules/` from disk; the README still stays the main reference that points to each rule.

---

## Instruction types (from workflow)

- **Add feature** — Clarify goal/scope/criteria → design → implement → verify.
- **Update feature** — Clarify what changes → impact → implement + regression tests.
- **Fix bug** — Reproduction, expected vs actual → minimal fix + regression test.
- **Doc update** — Clarify which docs and what change → update only that scope.
- **User flow** — Clarify flow (steps, success/error) → treat as spec → design → implement → verify.

Full detail is in **`.agent/rules/sdd-workflow.md`**.

---

*README = core reference. Rules = full instructions. Share the repo URL; AI reads README first, then the rule files it points to.*
