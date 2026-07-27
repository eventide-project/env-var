# Controls — never "factories", "fixtures", or "arrange"

The known, deterministic inputs a test is built from — the helpers that build example values, the example values themselves, and the pre-actuation setup phase where they are established — are all **controls**. Hold to the one term across all three:

- **The helpers** that build example values are **controls**, never "factories".
- **The example values** they produce (and any literal known inputs) are **controls** / control values, never "fixtures".
- **The setup phase** — establishing the known inputs before the actuation — is the **control** of the test, never "arrange".

So a test reads **control → actuate → observe** (the assertion is only *how* the outcome is observed).

**Why:** "controls" is the established vocabulary of controls-based testing; "factory", "fixture", and "arrange" are imported jargon (factories from build patterns, fixtures from xUnit, arrange from Arrange/Act/Assert) that a reader has to map back onto the domain's one concept. Holding to "controls" keeps the rules, prose, and the code consistent. "Fixture" is doubly confusing where a test framework has its own `Fixture` context object — the known input values are controls, not fixtures.

**How to apply:** in prose, comments, docs, and dialogue, say **controls** for the helpers and the example values, and call the pre-actuation setup the **control** of the test. Never "factory"/"factories", "fixture(s)", or "arrange". Related: the `control_` test-variable prefix rule, the control-string-value rule, and the name-literally-not-by-analogy and no-slang rules in `language`.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 7 PM PT
