---
trigger: model_decision
description: When implementing concurrent code, locks, async flows, or multi-threaded logic
---

## Concurrency and Threading Principles

### Shared state and race conditions

- **Minimize shared mutable state.** Prefer immutable data, message passing, or single-owner patterns where the language supports them.
- **Document what is shared.** If state is shared across threads or async tasks, document the synchronization strategy (e.g. "protected by mutex X", "single writer, multiple readers").
- **Keep critical sections small.** Hold locks only for the minimum time needed; do not call unknown or blocking code while holding a lock.

### Deadlock prevention

- **Lock in a consistent order.** When multiple locks are needed, define a global order (e.g. A then B then C) and always acquire in that order. Never acquire in different orders in different code paths.
- **Avoid circular wait.** Circular wait is one of the four conditions for deadlock; a fixed locking order removes it.
- **Prefer one lock per operation where possible.** If you need multiple locks, document the order and use try-lock or timeouts where the runtime supports them to avoid indefinite blocking.
- **Do not call user or external code while holding a lock.** Such code might try to take another lock and create an undocumented ordering.

### Language-appropriate patterns

- **Go:** Prefer channels for coordination; use `sync.Mutex` or `sync.RWMutex` with short critical sections; document lock order if you use multiple mutexes.
- **JavaScript/TypeScript:** Prefer async/await and single-threaded event loop; use at most one lock (e.g. queue) if serializing access.
- **Python:** Use `threading.Lock` or `asyncio.Lock`; avoid holding locks across await points in async code.
- **Java/Kotlin:** Use `synchronized`, `ReentrantLock`, or higher-level concurrency utilities; document lock ordering in class-level comments.
- **Rust:** Prefer ownership and `Send`/`Sync`; use standard types like `Mutex`, `RwLock`, or channels rather than hand-rolled locking.

### Timeouts and cancellation

- **Support cancellation.** Long-running or blocking concurrent work should respect a cancellation signal or timeout so callers can abort and release resources. See Reliability and Error Handling @reliability-and-errors.md.
- **Use timeouts on lock acquisition where available.** Avoid indefinite wait on a lock; fail or retry with backoff.

### Related principles

- Concurrency and Threading Mandate @concurrency-and-threading-mandate.md (when to use concurrency)
- Reliability and Error Handling @reliability-and-errors.md (resources, timeouts)
- Resource and Memory Management @resources-and-memory-management-principles.md (cleanup in all paths)
