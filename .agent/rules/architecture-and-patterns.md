---
trigger: always_on
---

## Architecture and Patterns

### Layering and boundaries

- Prefer clear layers (e.g. handler → service → repository). Each layer has one responsibility. Dependencies point inward (e.g. domain/core does not depend on HTTP or DB drivers).
- Keep module/package boundaries explicit. Avoid circular dependencies; extract shared types or use interfaces to invert direction if needed.

### Pattern selection (when to use what)

- Object creation complex → Factory, Builder, or Functional Options. Single instance → prefer Dependency Injection over Singleton.
- Interface mismatch → Adapter. Add behavior without changing existing code → Decorator or Middleware. Simplify a complex API → Facade.
- Swappable algorithms → Strategy. React to state changes → Observer or Pub/Sub. Undo/redo → Command or Memento. State-dependent behavior → State or Strategy.
- Tree-like structures → Composite. Distributed transactions → Saga or Outbox. Resilient external calls → Circuit Breaker, Retry, Bulkhead.
- Data access → Repository. Optional dependency → Null Object. Decouple layers → DTO, Data Mapper. Multi-entity consistency → Aggregate.

Choose patterns that solve the actual problem in the spec. Do not apply patterns for their own sake (YAGNI).

### Anti-patterns (avoid)

- **God Object / God Package** — One type or package doing too much. Split by responsibility.
- **Spaghetti Code** — Deep nesting, tangled flow. Use guard clauses, extract functions, early returns.
- **Premature Optimization** — Optimize only after measuring. Make it work, then right, then fast.
- **Shotgun Surgery** — One change forcing edits across many unrelated files. Improve cohesion and colocate related logic.
- **Leaky Abstraction** — Implementation details leaking to callers. Keep interfaces stable and implementation-specific details behind the abstraction.
- **Circular Dependencies** — No mutual dependency between modules. Break cycles with interfaces or shared kernel.
- **Magic Numbers / Strings** — Use named constants or config; document meaning.
- **Boolean Blindness** — Avoid many boolean parameters; use options struct or named options so call sites stay readable.
- **Service Locator** — Do not use a global registry for dependencies. Use constructor/parameter injection (Dependency Injection).
