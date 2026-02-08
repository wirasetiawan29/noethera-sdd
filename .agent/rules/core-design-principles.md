---
trigger: always_on
---

## Core Design Principles

### SOLID

- **SRP (Single Responsibility):** One reason to change per module/struct/class. If you need "and" to describe what it does, split it.
- **OCP (Open/Closed):** Extend via new interfaces/implementations; do not modify existing code for new behavior. Use composition and dependency injection.
- **LSP (Liskov Substitution):** Subtypes must be substitutable for base types without breaking correctness. No panic/no-op implementations of interface methods.
- **ISP (Interface Segregation):** Small, focused interfaces (1–3 methods). Prefer many small interfaces over one fat interface. Clients must not depend on methods they do not use.
- **DIP (Dependency Inversion):** Depend on abstractions (interfaces); inject dependencies. Do not use Service Locator or global registries. High-level modules must not depend on low-level concretions.

### Essential practices

- **DRY:** Single source of truth. No duplicated logic, algorithms, or business rules. Do not merge code that only looks similar by coincidence.
- **KISS:** Prefer the simplest solution that works. Complexity only when justified by real requirements.
- **YAGNI:** Do not build it until it is required. No speculative features. Refactor when needs change.
- **Separation of Concerns:** One concern per layer/module (e.g. handler / service / repository). Minimal overlap.
- **Composition over Inheritance:** Favor composition and interfaces over deep inheritance. Composition is easier to test and change.

### Maintainability

- Code maintainability prevails. When in doubt, prefer code that is easy to change and test.
- Principle of Least Astonishment: behavior should match what users and maintainers expect; follow conventions.
- Never sacrifice long-term maintainability for short-term convenience or “quick” UX hacks that create tech debt.
