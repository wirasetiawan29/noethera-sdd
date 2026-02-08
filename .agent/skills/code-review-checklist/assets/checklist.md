# Code review checklist

Use this before marking a change "done" or asking for human review. Tick each item or note the exception.

## Security

- [ ] No hardcoded secrets, API keys, or credentials (use config/env/secret manager)
- [ ] User and external input validated and sanitized at the boundary
- [ ] No SQL/command/script injection (parameterized queries, safe exec; see command-execution-principles)
- [ ] Fail secure: errors deny access or default to safe behavior; no sensitive data in error messages to callers
- [ ] Auth/authz checked server-side where applicable (not only in UI)

## Correctness and robustness

- [ ] Errors handled or propagated; no swallowed errors or empty catch blocks
- [ ] Resources (files, connections, locks) released in all paths (success and failure)
- [ ] Timeouts or cancellation for I/O or long-running work where appropriate
- [ ] No silent failures; meaningful log or return when something goes wrong

## Tests

- [ ] New or changed behavior has automated tests (unit and/or integration as appropriate)
- [ ] Bugfixes include a regression test that would have caught the bug
- [ ] Tests pass; no skipped or disabled tests without a short justification
- [ ] Test placement follows project convention (co-located vs e2e directory)

## Design and structure

- [ ] Fits existing architecture and layers (e.g. handler → service → repository)
- [ ] No circular dependencies; clear module boundaries
- [ ] Dependencies injected or explicit; no new global state or hidden coupling
- [ ] No anti-patterns introduced (god object, shotgun surgery, leaky abstraction, etc.)

## Documentation and style

- [ ] Public API or contract changes reflected in docs or types
- [ ] Naming and style consistent with the codebase and code-idioms
- [ ] No leftover debug code, commented-out blocks, or TODO without a ticket/link
- [ ] Non-obvious decisions explained in comments (why, not what)

## Scope

- [ ] Change matches the requested scope (YAGNI); no unrelated refactors or features unless agreed
- [ ] If scope was expanded, the expansion is explicit and justified

---

**After running:** Fix any unchecked items or document why an exception is acceptable. Summarize for the user: "Checklist: N/M passed; [list of exceptions or fixes]."
