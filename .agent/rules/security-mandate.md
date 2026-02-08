---
trigger: always_on
---

## Security Mandate

Security is a requirement, not an optional feature.

### Universal rules

1. **Never trust user input.** Validate and sanitize all data from users, APIs, or external systems server-side. Do not rely on client-side checks alone.
2. **Deny by default.** Require explicit permission; never assume access. Default to the least privilege needed.
3. **Fail securely.** On errors or unexpected conditions, fail closed (deny access) rather than open. Do not expose internals in error messages to callers.
4. **Defense in depth.** Use multiple, independent controls where it matters. Do not rely on a single check for security-sensitive decisions.

### Implementation

- Do not hardcode secrets, API keys, or credentials. Use environment variables or a secure config mechanism.
- Use parameterized queries / prepared statements for database access; never concatenate user input into SQL or shell commands.
- When adding auth, validation, or any security-sensitive path, re-check these rules before completing the change.
