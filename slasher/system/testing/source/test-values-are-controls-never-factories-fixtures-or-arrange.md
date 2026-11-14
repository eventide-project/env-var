# Test values are controls, never factories, fixtures, or arrange

**Trigger:** When creating or editing a file under `test/`

The known, deterministic inputs a test is built from are all **controls**. Those are the helpers that build example values, the example values themselves, and the pre-actuation setup phase where they are established. Hold to the one term for all three:

- **The helpers** that build example values are **controls**, never "factories".
- **The example values** they produce (and any literal known inputs) are **controls** / control values, never "fixtures".
- **The setup phase** — establishing the known inputs before the actuation — is the **control** of the test, never "arrange" and never "arrangement".

So a test reads **control → actuate → observe** (the assertion is only *how* the outcome is observed).

**Why:** "controls" is the established vocabulary of controls-based testing. "factory", "fixture", and "arrange" are imported jargon that a reader has to map back onto the domain's one concept. Factories come from build patterns, fixtures from xUnit, and arrange from Arrange/Act/Assert. Holding to "controls" keeps the rules, prose, and the code consistent. "Fixture" is doubly confusing where a test framework has its own `Fixture` context object — the known input values are controls, not fixtures.

**How to apply:** in prose, comments, docs, and dialogue, say **controls** for the helpers and the example values. Call the pre-actuation setup the **control** of the test. Never "factory"/"factories", "fixture(s)", "arrange", or "arrangement". The noun form imports what the verb does.

## Compressed

1. The known, deterministic inputs a test is built from are all **controls**.
2. Helpers that build example values are **controls**, never "factories".
3. The example values they produce, and any literal known inputs, are **controls** or control values, never "fixtures".
4. The setup phase, which establishes the known inputs before the actuation, is the **control** of the test.
5. Never call the setup phase "arrange" or "arrangement". The noun form carries the same meaning as the verb.
6. A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed.
7. Apply this in prose, comments, docs, and dialogue.
8. In talk about tests, never say "factory", "factories", "fixture", "fixtures", "arrange", or "arrangement".
9. Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.65, solubility 79 → 90, clarity 0.70 → 0.86, 7 directives, 7 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 90 → 91, clarity 0.86 → 0.89; checked: 6 directives, 6 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named controls-not-factories-fixtures-arrange and titled "Controls — never "factories", "fixtures", or "arrange"".

Related:

- the `control_` test-variable prefix rule
- the a-controls-string-value-starts-with-some rule
- the name-concepts-literally-not-by-analogy-code-or-jargon and no-slang rules in `language`

---

Authored by Scott Bellware on Thu Jul 16 2026 at 7 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:42 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:29 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
