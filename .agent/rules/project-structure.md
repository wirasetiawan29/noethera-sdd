---
trigger: model_decision
description: When creating or reorganizing project layout, monorepos, or module boundaries
---

## Project Structure

### Goals

- **Navigable:** Anyone can find app code, tests, config, and scripts quickly.
- **Consistent:** Same layout across services or apps in the same repo.
- **Bounded:** Clear boundaries so dependencies don’t spiral (see Avoid Circular Dependencies @avoid-circular-dependencies.md).

### Common layouts

**Single application (flat or shallow):**

- `src/` or `app/` — application code (or per-layer: `handlers/`, `services/`, `repositories/`).
- `test/` or `*_test.*` / `*.spec.*` next to code — tests co-located with implementation where the language allows.
- `e2e/` or `tests/e2e/` — end-to-end tests in a dedicated directory (see Testing Strategy @testing-strategy.md).
- `config/` or `configs/` — non-secret configuration; secrets via environment or secret manager.
- `scripts/` — build, deploy, or one-off scripts.
- Root: README, dependency manifest (package.json, go.mod, Cargo.toml, etc.), CI config.

**Monorepo (multiple apps or packages):**

- `apps/<app-name>/` — each deployable application (e.g. `apps/api`, `apps/web`).
- `libs/` or `packages/` — shared libraries used by more than one app; no direct dependency from lib to app.
- `apps/e2e/` or `e2e/` — e2e tests that span apps (e.g. API + UI).
- Shared config/tooling at root or in a dedicated `tools/` / `config/` package.

**Layers inside an app:**

- Prefer feature-based or vertical slices (see Code Organization Principles @code-organization-principles.md): one feature = one directory with a clear public API.
- If using horizontal layers (handlers, services, repositories), keep dependency direction inward (e.g. handlers → services → repositories; domain/core does not depend on HTTP or DB drivers).

### Naming and placement

- **Config:** Environment-specific files (e.g. `config.dev.yaml`, `config.prod.yaml`) or a single config with env overrides. Never commit real secrets; use `.env.template` and a secret manager for production.
- **Tests:** Follow the convention of the language (e.g. `*_test.go`, `*.spec.ts`, `test_*.py`) and place e2e in a dedicated directory.
- **Public API surface:** Put what other modules may import in a single entry (e.g. `index.ts`, `public_api.go`) or a small set of files; keep internals private.

### Related principles

- Code Organization Principles @code-organization-principles.md
- Testing Strategy @testing-strategy.md (test placement)
- Configuration Management Principles @configuration-management-principles.md
- Avoid Circular Dependencies @avoid-circular-dependencies.md
