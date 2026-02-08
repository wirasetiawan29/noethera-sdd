---
trigger: model_decision
description: When working with application configuration, environment variables, settings files, or secrets management
---

## Configuration Management Principles

### Separation of configuration and code

**Configuration:**

- Environment-specific values (URLs, credentials, feature flags, timeouts)
- Varies between dev/staging/prod
- Can change without code deployment

**Code:**

- Business logic and application behavior
- Same across all environments
- Requires deployment to change

**Never hardcode configuration in code:**

- Use environment variables or config files (e.g. `process.env.DATABASE_URL`, not a literal connection string in source)

### Configuration validation

**Validate at startup:**

- Ensure all required configuration is present
- Fail fast if required config is missing or invalid
- Provide clear error messages (e.g. "DATABASE_URL environment variable is required")

**Validation checks:**

- Type (string, number, boolean, enum)
- Format (URL, email, file path)
- Range (e.g. port 1–65535)
- Dependencies (if feature X is enabled, config Y is required)

### Configuration hierarchy

**Precedence (highest to lowest):**

1. Command-line arguments (for testing, debugging)
2. Environment variables
3. Config files (e.g. config.prod.yaml, config.dev.yaml)
4. Defaults in code (fallback)

### Configuration organization

- **Secrets:** Use `.env` or a secret manager in production; never commit real secrets. Commit `.env.template` with blank/placeholder values.
- **Non-secret settings:** Prefer feature-based config files (e.g. `config/database.yaml`, `config/auth.yaml`) and inject secrets via env vars or placeholders.

### Related principles

- Security Mandate @security-mandate.md (no hardcoded secrets)
- Security Principles @security-principles.md (Secrets Management)
