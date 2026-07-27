# Testing — Vocabulary

The testing package's vocabulary: the terms it defines and the word substitutions it enforces, for controls-based test-writing. Binding — use these terms and swaps in tests, rules, prose, and dialogue.

## Terms

- **controls** — the known, deterministic inputs a test is built from: the helpers that build example values, the example values themselves, and the pre-actuation setup that establishes them. A test reads **control → actuate → observe**. The conventions that hold the term in place — controls never "factories" / "fixtures" / "arrange", the `control_` variable prefix, and the "some" string value — are the package's control rules.

## Substitutions

Test-domain word substitutions. When the impulse is a word in the **Don't say** column, write the **Say** term.

| Say | Don't say | What it names |
|---|---|---|
| **verified** | "green" | passing tests, and the report that tests pass — see below |
| **protect** | "guard" | what a test does against a regression — see below |

### Finer distinctions

- **verified** governs the *report*, not the cycle. Where "green" names a state in the red/green cycle rather than a claim that behavior is confirmed, it stands — **green-on-arrival** and the **red/green loop** keep their names. Prefer "Verified: N tests" over "the suite is verified at N" (technobabble).
- **protect** — a test **protects** against a regression (protects the behavior / the delegation / the seam). Keep "guard clause" for the early-return control-flow construct; only a test's protective role is "protect", never "guard".

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
