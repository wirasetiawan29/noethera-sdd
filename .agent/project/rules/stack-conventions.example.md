---
trigger: model_decision
description: Example project-specific rule. Rename to react-conventions.md, go-rules.md, etc.
---

# Stack conventions (example)

This is an **example** project rule. Copy and rename for your stack (e.g. `react-conventions.md`, `go-project-rules.md`).

## What to put here

- **Framework conventions** — Naming, file layout, patterns specific to React/Vue/Go/etc.
- **Domain rules** — Product naming, API patterns, boundaries.
- **Tooling** — Lint/format rules, required CI checks.

## Example (React)

- Components: PascalCase. One component per file.
- Hooks: `use` prefix. Co-locate with components when private.
- State: Prefer local state; lift only when needed. No prop drilling beyond 2 levels.
- Tests: Co-locate `*.test.tsx` next to component.

Replace this content with your project's conventions.
