---
trigger: model_decision
description: When designing API payloads, persistence format, or cross-boundary data exchange
---

## Data Serialization Principles

### Safe formats and validation

- **Prefer structured, schema-validated formats.** Use JSON, Protocol Buffers, or similar with a defined schema; validate at boundaries (API entry, persistence read).
- **Validate on read, not only on write.** Deserialized data from storage or the network may be outdated or tampered; validate type, range, and invariants before use.
- **Reject unknown or invalid payloads early.** Return a clear error (e.g. 400 Bad Request with field-level detail) instead of coercing or guessing.

### Versioning and compatibility

- **Version public wire formats.** When the shape of an API or stored payload changes in a breaking way, use a version field, URL path, or content-type so clients and readers can detect and handle it.
- **Prefer additive changes.** Add optional fields rather than removing or renaming existing ones when possible; document deprecation and migration for breaking changes.
- **Document schema evolution.** If you use a schema registry or shared types, document how to add fields and when old versions are retired.

### Security and size

- **Do not deserialize untrusted input without validation.** Unvalidated deserialization can lead to injection or denial-of-service (e.g. billion laughs, oversized payloads).
- **Set size and depth limits.** Limit request body size, array length, and nesting depth for parsers to avoid resource exhaustion.
- **Avoid serializing secrets.** Do not put passwords, tokens, or keys in logs, URLs, or client-visible payloads; use references or server-side resolution.

### Related principles

- Security Mandate @security-mandate.md (never trust input)
- Security Principles @security-principles.md (input validation)
- API Design and Maintainability @api-and-maintainability.md (API contracts, errors)
