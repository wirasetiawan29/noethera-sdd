---
trigger: always_on
---

## Code Idioms and Conventions

### Universal principle

**Write idiomatic code for the target language:**

- Code should look natural to developers familiar with that language
- Follow established community conventions, not personal preferences
- Use language built-ins and standard library effectively
- Apply language-appropriate patterns (don't force patterns from other languages)

### Idiomatic code characteristics

- Leverages language features (don't avoid features unnecessarily)
- Follows language naming conventions
- Uses appropriate error handling for the language (exceptions vs Result types)
- Applies established community patterns

### Avoid cross-language anti-patterns

- Do not write "Java in Python" or "C in Go"
- Do not force OOP patterns in functional languages
- Do not avoid language features because they are "unfamiliar"
- Learn and apply language-specific idioms

### Related principles

- Core Design Principles @core-design-principles.md (Principle of Least Astonishment)
- Architecture and Patterns @architecture-and-patterns.md
