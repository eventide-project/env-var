# A predicate method's test context is named "`<Name>` Predicate"

The `context` for a predicate method — a `?`-suffixed, boolean-returning method — is named by the method's name (without the `?`) followed by **"Predicate"**. So `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.

Examples: `defined?` → "Defined Predicate"; `valid?` → "Valid Predicate"; `empty?` → "Empty Predicate".

**Why:** The context names the *feature* under test. "Defined?" carries the method's punctuation and reads as a bare question; "Defined Predicate" names what the method **is** — a predicate on definedness — which is the literal, precise description ("predicate" being the exact term for a boolean-returning method). It also keeps the `?` out of a `context` label, where it would read as interrogative prose rather than a feature name. Consistent with the name-literally-not-by-analogy rule and the test-context-nesting conventions.

**How to apply:** When the unit under test is a predicate method `foo?`, name its feature `context` "Foo Predicate" (titlecase the name without the `?`, then append "Predicate"). Related: the test-context-nesting-mirrors-folders rule, the test-name-is-prefix rule, and the name-literally-not-by-analogy rule.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 5 PM PT
