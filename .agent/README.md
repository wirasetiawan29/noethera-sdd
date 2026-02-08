# Noethera SDD — Agent rules, skills, and workflows

Rules, skills, and workflows for **any** AI coding agent. Model- and tool-agnostic: use with Claude, GPT, Gemini, Cursor, Windsurf, or any assistant that can load markdown context.

- **Workflow** — SDD: Spec → Design → Implement → Verify. Orchestrates every request.
- **Rules** — Guardrails. Always-on or model_decision. Define how the agent designs, implements, and verifies.
- **Skills** — On-demand how-to. Load when the task matches (debugging, frontend, code review, etc.).

All content is in **English**. No dependency on a specific vendor or framework.

---

## Structure

```
.agent/
├── MANIFEST.yaml       # Central index — workflows, rules, skills, tasks
├── workflows/          # SDD orchestrator
├── rules/              # Guardrails
├── skills/             # On-demand how-to
├── tasks/              # Optional task tracking (hybrid entry: chat + task)
├── specs/              # Spec artifacts for traceability
└── project/            # Project-specific overrides (see rules/stack-conventions.example.md)
```

---

## How to use

1. Put the `.agent` folder in your project root.
2. **Load order:** `.agent/workflows/`, `.agent/rules/`, `.agent/skills/`. Tools that support the `.agent` convention will load these as context.
3. For other tools: add all three folders to the system prompt or context.
4. **MANIFEST.yaml** — Use for tooling: indexes all rules and skills with triggers. Tools can parse it to load intelligently.

**Trigger semantics:** Rules use `trigger: always_on` (always in context) or `trigger: model_decision` with a `description` (load when the task matches).

**Entry points:** Human requests via **chat** (primary). For non-trivial work: create a task in `tasks/` and optionally a spec in `specs/` for traceability. Use `tasks/_template.yaml` and `specs/_template.yaml`.

---

## Workflow (`.agent/workflows/`)

| File | Summary |
|------|---------|
| **sdd-workflow** | Spec → Design → Implement → Verify. Instruction types, entry points (chat, task). |
| **phases/** | spec.md, design.md, verify.md — phase checklists. |

---

## Rules (`.agent/rules/`)

Quick scan: `rules/_index.md`. Full table below.

| Rule | Trigger | Summary |
|------|--------|---------|
| **rugged-software-constitution** | always_on | Philosophy: "code will be attacked" — defensibility, 7 Rugged Habits |
| **security-mandate** | always_on | Never trust input, deny by default, fail secure, defense in depth |
| **security-principles** | model_decision | OWASP, auth/authz, validation, security logging, secrets |
| **core-design-principles** | always_on | SOLID, DRY, KISS, YAGNI, separation of concerns |
| **architecture-and-patterns** | always_on | Layering, pattern choice, anti-patterns |
| **api-and-maintainability** | always_on | API design, testing, code organization, observability |
| **reliability-and-errors** | always_on | Fail fast, error handling, resources, concurrency, idempotency |
| **testing-strategy** | model_decision | Test pyramid, TDD, test doubles, co-locate vs e2e, AAA |
| **logging-and-observability-mandate** | always_on | Log every operation (start/success/failure), correlationId, duration |
| **logging-and-observability-principles** | model_decision | Log levels, structured logging, what never to log, health/metrics |
| **code-completion-mandate** | always_on | Task "done" only after Verify; no completion before quality gates |
| **code-organization-principles** | always_on | Small functions, feature-based modules, clear public APIs |
| **documentation-principles** | always_on | Self-documenting code, when to comment, doc levels |
| **dependency-management-principles** | model_decision | Version pinning, lock files, minimize deps, import order |
| **resources-and-memory-management-principles** | model_decision | Cleanup all resources, timeouts, pooling, backpressure |
| **concurrency-and-threading-mandate** | always_on | When to use (I/O vs CPU-bound); when not to (avoid over-use) |
| **concurrency-and-threading-principles** | model_decision | Lock order, deadlock prevention, shared state, language patterns |
| **project-structure** | model_decision | Layout (single app, monorepo), layers, naming, e2e placement |
| **data-serialization-principles** | model_decision | Safe formats, validation at boundaries, versioning, size/security limits |
| **performance-optimization-principles** | model_decision | Measure first, data structures, caching, batching, no premature abstraction |
| **avoid-circular-dependencies** | always_on | No A↔B cycles; extract shared module or use DI |
| **code-idioms-and-conventions** | always_on | Idiomatic code, community conventions, no cross-language anti-patterns |
| **command-execution-principles** | model_decision | Safe shell/exec: no user input, least privilege, timeouts, exit codes |
| **configuration-management-principles** | model_decision | Config vs code, validate at startup, hierarchy, secrets via env |
| **sdd-workflow** | always_on | Condensed workflow (phases, instruction types). Full: workflows/sdd-workflow.md |

---

## Skills (`.agent/skills/`)

| Skill | Triggers on | Summary |
|-------|-------------|---------|
| **debugging-protocol** | fix bug, debug, root cause, flaky test | Hypotheses → validation tasks → root cause |
| **frontend-design** | UI, frontend, style, design, landing page | Distinctive UI; avoid generic "AI slop" |
| **sequential-thinking** | complex planning, multi-step | Iterative problem-solving with revision |
| **code-review-checklist** | verify, done, complete, review | Security, correctness, tests, design, docs, scope |

Each skill has a `SKILL.md` with `name` and `description`. See MANIFEST.yaml for `triggers_on`.

---

## Tasks & specs

- **tasks/** — Create a task file using `_template.yaml`. Tracks spec, status, acceptance criteria.
- **specs/** — Create a spec artifact using `_template.yaml` for traceability. Links to task via `task_ref`.

---

## Project overrides (`.agent/project/`)

- **project/rules/** — Stack- or domain-specific rules. See `stack-conventions.example.md` for template.
- **project/skills/** — Project-specific skills.

Load after global rules and skills.

---

## Making it more powerful

See **[IMPROVEMENTS.md](IMPROVEMENTS.md)** for a concrete roadmap.
