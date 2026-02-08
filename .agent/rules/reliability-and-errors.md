---
trigger: always_on
---

## Reliability and Error Handling

### Fail fast

- Detect and report invalid state at boundaries (e.g. startup, request entry). Do not continue with bad config or missing dependencies.
- Validate inputs at the edge; return clear, contextual errors. Wrap underlying errors with context (e.g. "creating user: %w") instead of dropping them.

### Error handling

- Do not swallow errors. Every error path must be handled or explicitly propagated. Avoid empty catch blocks or ignored return values.
- Use typed or structured errors where it helps callers (e.g. distinguish retriable vs permanent failures). Prefer returning errors over panics except for true invariants.
- Log errors with enough context for debugging; avoid logging secrets or PII.

### Resources and concurrency

- Release resources (files, connections, locks) in all paths (success and failure). Prefer defer/finally or scope-based ownership.
- For concurrency: avoid shared mutable state where possible; use channels or well-defined synchronization. Document locking order to prevent deadlocks.
- Timeouts and cancellation: support context/cancellation for long-running or external calls so callers can abort and resources can be released.

### Idempotency and retries

- Design APIs and operations to be idempotent where retries are possible (e.g. use idempotency keys for payments or mutations). Document when an operation is not idempotent.
- Retries: use bounded retries with backoff for transient failures; do not retry indefinitely or without backoff.
