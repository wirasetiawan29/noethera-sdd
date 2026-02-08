---
trigger: always_on
---

## API Design and Maintainability

### API design

- Expose clear, consistent contracts. Prefer small, focused interfaces. Version public APIs when behavior or contract changes (e.g. URL path or header).
- Use structured error responses (e.g. code, message, optional details) so clients can handle errors programmatically. Do not expose stack traces or internals to external callers.
- Validate requests at the boundary. Return validation errors with field-level detail where helpful. Support idempotency keys for non-idempotent mutations so retries are safe.
- Paginate list endpoints; use cursor or offset consistently. Document limits and ordering.

### Testing

- Write tests that matter: cover acceptance criteria, critical paths, and error cases. For bugfixes, add a test that would have caught the bug (regression test).
- Prefer table-driven tests and Arrange-Act-Assert. Use test doubles (mocks, stubs, fakes) for dependencies; inject them via interfaces. Keep tests readable and stable.
- If code is hard to test, improve design (e.g. smaller units, dependency injection) rather than weakening tests.

### Code organization and quality

- Follow project and language conventions. Consistent naming and structure reduce cognitive load.
- Prefer small, focused files and functions. Name after behavior and domain concepts. Avoid generic names like "utils" or "helpers" for large, growing modules.
- Document public APIs and non-obvious decisions. Keep comments up to date; delete obsolete comments. Prefer self-explanatory code plus minimal comments over long comments on unclear code.

### Observability

- Log at boundaries and on meaningful events (e.g. request start/end, decisions, failures). Use structured logging (key-value) where supported. Do not log secrets or full PII.
- Expose metrics or health endpoints where the runtime supports it. Prefer correlation IDs or request IDs for tracing across layers.
