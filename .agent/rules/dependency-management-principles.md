---
trigger: model_decision
description: When managing project dependencies, configuring package files, or organizing module imports
---

## Dependency Management Principles

### Version pinning

**Production:** Pin exact versions (e.g. 1.2.3, not ^1.2.0)

- Prevents supply chain attacks
- Prevents unexpected breakage from patch updates
- Ensures reproducible builds

**Use lock files:**

- package-lock.json (Node.js)
- Cargo.lock (Rust)
- go.sum (Go)
- requirements.txt or poetry.lock (Python)

### Minimize dependencies

**Every dependency is a liability:**

- Potential security vulnerability
- Increased build time and artifact size
- Maintenance burden (updates, compatibility)

**Ask before adding a dependency:**

- "Can I implement this in ~50 lines?"
- "Is this functionality critical?"
- "Is this dependency actively maintained?"
- "Is this the latest stable version?"

### Organize imports

**Grouping:**

1. Standard library
2. External dependencies
3. Internal modules

**Sorting:** Alphabetical within groups.

**Cleanup:** Remove unused imports (use linter/formatter).

### Related principles

- Security Principles @security-principles.md (Vulnerable Components, pin and scan)
- Core Design Principles @core-design-principles.md (YAGNI)
