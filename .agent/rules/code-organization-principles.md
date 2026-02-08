---
trigger: always_on
---

## Code Organization Principles

- Generate small, focused functions with clear single purposes (typically 10–50 lines)
- Keep cognitive complexity low (cyclomatic complexity < 10 for most functions)
- Maintain clear boundaries between different layers (presentation, business logic, data access)
- Design for testability from the start, avoiding tight coupling that prevents testing
- Apply consistent naming conventions that reveal intent without requiring comments

### Module Boundaries

**Problem:** Cross-module coupling makes changes ripple across codebase.

**Solution:** Feature-based organization with clear public interfaces:

- One feature = one directory
- Each module exposes a public API (exported functions/classes)
- Internal implementation details are private
- Cross-module calls only through public API

**Directory structure (language-agnostic):**

```
/feature
  - public_api.{ext}   # Exported interface
  - business.{ext}     # Pure logic
  - store.{ext}        # I/O abstraction (interface)
  - postgres.{ext}     # I/O implementation
  - mock.{ext}         # Test implementation
  - test.{ext}         # Unit tests (mocked I/O)
  - integration.test.{ext}  # Integration tests (real I/O)
```

**Go example:**

```
/apps/backend/feature
  - feature.go              # API endpoints (public)
  - business.go             # Pure domain logic
  - store.go                # interface Store
  - postgres.go             # implements Store
  - feature_test.go         # Unit tests with MockStore
  - feature_integration_test.go  # Integration test with Testcontainers
```

**TypeScript/Vue example:**

```
/apps/frontend/src/features/feature
  - index.ts           # Public exports
  - feature.service.ts # Business logic
  - feature.api.ts     # interface FeatureAPI
  - feature.api.backend.ts # implements FeatureAPI
  - feature.store.ts   # Store (uses FeatureAPI)
  - feature.service.spec.ts # Unit tests (mock API)
```

### Feature interaction patterns

**Direct import**

When a feature needs another feature's capabilities, import its Service (public API) only:

- Only import the public API (Service), never internal files (e.g. logic.go, storage.go)
- Declare the dependency in the dependent feature's constructor
- Wire dependencies in the application bootstrap (e.g. main.go, main.ts)

**Rules:**

- Cross-feature calls go through the public API of each feature
- Avoid circular dependencies; break cycles with interfaces or a shared kernel (see Architecture and Patterns @architecture-and-patterns.md)

### Related Principles

- Architecture and Patterns @architecture-and-patterns.md
- Testing Strategy @testing-strategy.md
- API Design and Maintainability @api-and-maintainability.md
