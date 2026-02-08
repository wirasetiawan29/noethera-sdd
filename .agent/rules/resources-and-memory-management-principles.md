---
trigger: model_decision
description: When working with resources requiring cleanup (files, database connections, network sockets, locks) or implementing resource pools
---

## Resource and Memory Management Principles

### Universal resource management rules

**1. Always clean up resources**

**Resources requiring cleanup:**

- Files, network connections, database connections
- Locks, semaphores, mutexes
- Memory allocations (in manual-memory languages)
- OS handles, GPU resources

**Clean up in ALL paths:**

- Success path: Normal completion
- Error path: Exception thrown, error returned
- Early return path: Guard clauses, validation failures

**Use language-appropriate patterns:**

- Go: defer statements
- Rust: Drop trait (RAII)
- Python: context managers (with statement)
- TypeScript/JavaScript: try/finally
- Java: try-with-resources

**2. Timeout all I/O operations**

**Why timeout:**

- Network requests can hang indefinitely
- Prevents resource exhaustion (connections, threads)
- Provides predictable failure behavior

**Timeout recommendations:**

- Network requests: 30s default; shorter (5–10s) for interactive
- Database queries: 10s default; configure per query complexity
- File operations: Usually fast; use timeout on network filesystems
- Message queue operations: Configurable; avoid indefinite blocking

**3. Pool expensive resources**

**Resources to pool:**

- Database connections: Pool size ~5–20 per app instance
- HTTP connections: Reuse with keep-alive
- Thread pools: Size based on CPU count (CPU-bound) or I/O wait (I/O-bound)

**Benefits:**

- Reduces latency (no connection setup overhead)
- Limits resource consumption (cap on max connections)
- Improves throughput (reuse vs create new)

**Connection pool practices:**

- Minimum connections: e.g. 5 (keeps pool warm)
- Maximum connections: e.g. 20–50 (avoids overwhelming DB)
- Idle timeout: Close connections idle > 5–10 minutes
- Validation: Test connections before use
- Monitoring: Track utilization, wait times, timeout rates

**4. Avoid resource leaks**

**What is a leak:**

- Acquire resource (open file, allocate memory, get connection)
- Never release it (forget to close; exception prevents cleanup)
- Eventually exhaust system resources (OOM, max connections, file descriptors)

**Detection:**

- Monitor open file descriptors, connection counts, memory over time
- Run long-duration tests; verify resource counts stay stable
- Use leak detection tools (e.g. valgrind, ASan, heap profilers) where applicable

**Prevention:**

- Use language patterns that guarantee cleanup (RAII, defer, context managers)
- Do not rely on manual cleanup alone

**5. Handle backpressure**

**Problem:** Producer faster than consumer → unbounded queue → memory exhaustion.

**Solutions:**

- Bounded queues: Fixed size; block or reject when full
- Rate limiting: Limit incoming request rate
- Flow control: Consumer signals producer to slow down
- Circuit breakers: Stop accepting when overwhelmed
- Drop/reject: Fail fast when overloaded (better than crashing)

### Memory management by language type

**Garbage-collected (Go, Java, Python, JavaScript, C#):**

- Memory automatically freed by GC
- Still release non-memory resources (files, connections, locks)
- Be aware of GC pauses in latency-sensitive applications
- Profile memory to find leaks (retained references)

**Manual (C, C++):**

- Explicit malloc/free or new/delete
- Use RAII in C++; prefer smart pointers (unique_ptr, shared_ptr)

**Ownership-based (Rust):**

- Compiler enforces memory safety
- Use Arc/Rc for shared ownership when needed

### Related principles

- Concurrency and Threading Mandate @concurrency-and-threading-mandate.md
- Reliability and Error Handling @reliability-and-errors.md (resources and concurrency)
- Performance Optimization @performance-optimization-principles.md (connection pooling)
