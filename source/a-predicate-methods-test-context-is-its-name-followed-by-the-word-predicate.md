# A predicate method's test context is its name followed by the word "Predicate"

**Trigger:** When creating or editing a file under `test/`

The `context` for a predicate method — a `?`-suffixed, boolean-returning method — is named by the method's name (without the `?`) followed by **"Predicate"**. So `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.

Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".

**Why:** The context names the *feature* under test. "Defined?" carries the method's punctuation and reads as a bare question. "Defined Predicate" names what the method **is**, a predicate on definedness. That is the literal, precise description, "predicate" being the exact term for a boolean-returning method. It also keeps the `?` out of a `context` label, where it would read as interrogative prose rather than a feature name. Consistent with the name-concepts-literally-not-by-analogy-code-or-jargon rule and the test-context-nesting conventions.

**How to apply:** When the unit under test is a predicate method `foo?`, name its feature `context` "Foo Predicate". Titlecase the name without the `?`, then append "Predicate".

## Compressed

1. A predicate method is a `?`-suffixed, boolean-returning method.
2. Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate".
3. Titlecase the method's name before appending "Predicate".
4. `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.
5. Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".
6. Keep the `?` out of a `context` label.

## Compression

- 2026-10-24, compressed: compression 0.39, change 0.63, solubility 78 → 98, clarity 0.62 → 0.98, 3 directives, 3 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 98 → 98, clarity 0.98 → 0.99; checked: 4 directives, 4 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When naming a test context for a ?-suffixed predicate method*, which was not a safe one.

Until Sun Oct 25 2026 this rule was named predicate-context-name and titled "A predicate method's test context is named "`<Name>` Predicate"".

Until Mon Oct 26 2026 this rule was named a-predicate-methods-test-context-is-named-for-the-predicate and titled "A predicate method's test context is named for the predicate".

Related:

- the test-context-nesting-mirrors-the-folder-hierarchy rule
- the start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion rule
- the name-concepts-literally-not-by-analogy-code-or-jargon rule

---

Authored by Scott Bellware on Sun Jun 28 2026 at 5 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:42 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:55 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:21:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
