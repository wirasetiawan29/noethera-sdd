---
trigger: always_on
---

## Documentation Principles

### Self-documenting code

**Clear naming reduces the need for comments:**

- Code shows WHAT is happening
- Comments explain WHY it is done this way

**When to comment:**

- Complex business logic deserves explanation
- Non-obvious algorithms (explain approach)
- Workarounds for bugs (link to issue tracker)
- Performance optimizations (explain trade-offs)

### Documentation levels

1. **Inline comments:** Explain WHY for complex code
2. **Function/method docs:** API contract (parameters, returns, errors)
3. **Module/package docs:** High-level purpose and usage
4. **README:** Setup, usage, examples
5. **Architecture docs:** System design, component interactions; use valid Mermaid diagrams where helpful

### Related principles

- API Design and Maintainability @api-and-maintainability.md (document public APIs)
- Code Organization Principles @code-organization-principles.md (naming conventions)
