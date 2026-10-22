# Controls — never "factories", "fixtures", or "arrange"

The known, deterministic inputs a test is built from are all **controls**. Those are the helpers that build example values, the example values themselves, and the pre-actuation setup phase where they are established. Hold to the one term for all three:

- **The helpers** that build example values are **controls**, never "factories".
- **The example values** they produce (and any literal known inputs) are **controls** / control values, never "fixtures".
- **The setup phase** — establishing the known inputs before the actuation — is the **control** of the test, never "arrange" and never "arrangement".

So a test reads **control → actuate → observe** (the assertion is only *how* the outcome is observed).

**Why:** "controls" is the established vocabulary of controls-based testing. "factory", "fixture", and "arrange" are imported jargon that a reader has to map back onto the domain's one concept. Factories come from build patterns, fixtures from xUnit, and arrange from Arrange/Act/Assert. Holding to "controls" keeps the rules, prose, and the code consistent. "Fixture" is doubly confusing where a test framework has its own `Fixture` context object — the known input values are controls, not fixtures.

**How to apply:** in prose, comments, docs, and dialogue, say **controls** for the helpers and the example values. Call the pre-actuation setup the **control** of the test. Never "factory"/"factories", "fixture(s)", "arrange", or "arrangement". The noun form imports what the verb does.

Related:

- the `control_` test-variable prefix rule
- the control-string-value rule
- the name-literally-not-by-analogy and no-slang rules in `language`
