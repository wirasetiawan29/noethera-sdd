---
trigger: model_decision
description: When implementing log statements, choosing log levels, or designing observability (metrics, traces, health)
---

## Logging and Observability Principles

Complements the Logging and Observability Mandate @logging-and-observability-mandate.md with implementation detail.

### Log levels (when to use)

- **ERROR:** Operation failed; requires attention or follow-up. Include correlationId, operation name, and error details (no secrets).
- **WARN:** Recoverable or degraded (e.g. retry succeeded, fallback used, deprecated path hit). Include enough context to diagnose.
- **INFO:** Normal operation milestones (request completed, job finished, key decisions). Use sparingly; avoid high-volume per-item logs in hot paths.
- **DEBUG:** Detailed state for troubleshooting; typically disabled or sampled in production. Do not log secrets or full PII at any level.

### Structured logging

- **Prefer key-value over free text.** Example: `{"event":"order_created","orderId":"abc","durationMs":12}` instead of "Order abc created in 12ms". Enables querying and alerting.
- **Use consistent field names** across the codebase (e.g. `correlationId`, `durationMs`, `userId`, `error`).
- **Include correlationId (or requestId)** in every log line for a request or job so traces can be reconstructed.

### What never to log

- Passwords, tokens, API keys, or any secret
- Full PII (e.g. full card numbers, full email in regulated contexts) — redact or hash where logging is required for audit
- Stack traces or error details in messages returned to external callers (log them server-side only)
- Unvalidated user input that could be used for injection in log aggregation

### Security-sensitive events

- Log failed auth attempts, access denied, and validation failures with event type and identifier (e.g. user id or IP); do not log the secret or credential. See Security Principles @security-principles.md.

### Performance and volume

- Avoid logging at INFO or below in tight loops or per-request in very high-throughput paths; use sampling, aggregation, or DEBUG that is off in production.
- Expensive serialization (e.g. large objects) should be conditional on log level or feature flag.

### Health and metrics

- Expose a health endpoint (e.g. /health) that reflects dependencies (DB, cache) when applicable; do not expose internal details.
- Prefer metrics (counters, histograms) for throughput, latency, and error rates rather than inferring from log volume.

### Related principles

- Logging and Observability Mandate @logging-and-observability-mandate.md
- Security Principles @security-principles.md
- API Design and Maintainability @api-and-maintainability.md (Observability)
