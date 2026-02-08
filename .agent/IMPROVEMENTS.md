# Improvement roadmap

Ways to make the agent setup more powerful. All content stays in **English**. These are general options, not tied to any specific vendor or repo.

---

## 1. Add more rules

Add rules when your project needs them.

**Already in this repo:** 24 rules, including code-completion-mandate, logging-and-observability-principles (plus concurrency principles, project-structure, data-serialization, and the full set in README).

Write new rules in the same style: frontmatter with `trigger` and optional `description`, then clear sections and `@rule-name.md` links to related rules.

---

## 2. Workflows (phase-based) — Done

- **Done:** `workflows/` folder with `sdd-workflow.md` as the main orchestrator. SDD defines Spec → Design → Implement → Verify.
- **Done:** `workflows/phases/` — spec.md, design.md, verify.md checklists for stricter phase gates.

---

## 3. Project-specific rules — Done

- **Done:** `project/rules/` and `project/skills/` folders ready.
- **Stack:** e.g. `react-conventions.md`, `go-project-rules.md` for your main stack.
- **Domain:** Naming, boundaries, or patterns specific to your product.
- **Tooling:** Lint/format rules, required CI checks, so the agent doesn’t suggest changes that break the pipeline.

---

## 4. Skills

- **Refactoring protocol:** When to extract, rename, or split; how to keep tests green.
- **Incident / runbook:** How to document and follow runbooks.

**Already in this repo:** debugging-protocol, frontend-design, sequential-thinking, code-review-checklist.

Same format for new skills: a folder with `SKILL.md` (name + description) and optional assets or examples.

---

## 5. Meta and hygiene

- **Done:** MANIFEST.yaml as central index. Root README points to .agent.
- **Root pointer:** Add a short note at repo root (e.g. in README or AGENTS.md): "Agent context: load .agent/workflows, .agent/rules, and .agent/skills."
- **Cross-references:** Periodically check that every `@rule-name.md` in the rules points to an existing file.
- **Trigger tuning:** If a rule is often ignored, try `always_on` or a clearer `description` for `model_decision`.

---

## Current state

- **MANIFEST.yaml** — Central index for workflows, rules, skills, tasks, specs, phases.
- **workflows/** — SDD workflow + phases (spec, design, verify checklists).
- **tasks/** — Template and dir for optional task tracking (hybrid chat + task).
- **specs/** — Spec artifacts for traceability (_template.yaml).
- **project/** — project/rules/ (with stack-conventions.example.md) and project/skills/.
- **scripts/validate.sh** + **Makefile** — `make validate` enforces structure.
- **24 rules** (sdd-workflow moved to workflows/; rules/ has pointer).
- **4 skills** (debugging, frontend design, sequential thinking, code-review checklist).
- General-purpose and model-agnostic: works with any AI coding agent that can load markdown context.

Next step: add project-specific or stack rules as the codebase grows; optional refactoring or runbook skills.
