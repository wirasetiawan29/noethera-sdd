---
trigger: always_on
---

## Avoid Circular Dependencies

**Problem:** Module A imports B, B imports A.

- Causes build failures, initialization issues
- Indicates poor module boundaries

**Solution:**

- Extract shared code into a third module
- Restructure dependencies (e.g. A→C, B→C)
- Use dependency injection so the dependency graph stays acyclic

### Related principles

- Architecture and Patterns @architecture-and-patterns.md (Circular Dependencies anti-pattern)
- Code Organization Principles @code-organization-principles.md (feature boundaries)
