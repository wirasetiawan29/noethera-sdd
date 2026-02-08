---
trigger: model_decision
description: When executing external commands, shell scripts, or system processes
---

## Command Execution Principles

### Security

**Never execute user input directly:**

- Do not pass user-controlled strings to shell or exec (injection risk)
- Use argument lists / array of arguments, not shell string concatenation
- Validate and sanitize all arguments before execution

**Run with minimum permissions:**

- Do not run commands as root/admin without explicit human approval; if elevated permissions are required, stop and request authorization
- Use least-privilege service accounts

### Portability

**Prefer language standard library:**

- Avoid shell commands when the standard library provides the same functionality (e.g. file I/O APIs instead of `cat`, `cp`, `mv`)
- Reduces OS dependency and injection surface

**Test on all target OS:**

- Windows, Linux, macOS have different commands and behaviors
- Use path-joining functions; do not concatenate with `/` or `\`

### Error handling

**Check exit codes:**

- Non-zero exit code = failure; handle it
- Capture and log stderr
- Set timeouts for long-running commands
- Handle "command not found" and missing binaries gracefully

### Related principles

- Security Mandate @security-mandate.md
- Security Principles @security-principles.md (Injection)
