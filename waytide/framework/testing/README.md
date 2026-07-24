# Waytide — testing

Controls-based test-writing conventions. Not tied to a specific test-framework API.

**Structure and naming**
- Actuate the concern once at the top; assert each outcome in its own nested context (`tdd-test-structure`).
- Context nesting mirrors the folder hierarchy; a single-case feature is one file named for the feature.
- A `test` block holds only the assertion; every operand is an explaining variable declared in the enclosing context.
- Name a test "Is …" only for a value-equals-comparator assertion. A raised-error outcome is named "Fails" (or "Doesn't fail"), its condition promoted to a context.
- A predicate method's context is "`<Name>` Predicate"; enclose a test in a context only when it needs local instrumentation.

**Controls**
- Local variables built by a control take the `control_` prefix; a control's string value starts with "some".
- The known inputs — the helpers, the values, and the setup phase — are **controls**, never factories, fixtures, or "arrange".

**What to test**
- Assert an error's message only when it is the sole way to confirm the correct error was raised.
- Don't test the platform — a transparent pass-through has nothing of ours to protect.

**Vocabulary** (`vocabulary.md`): the term **controls**, and the testing-domain substitutions — verified (not green), protect (not guard, for a test).

**Commands**: `test-report` (classify the suite) and `test-tree` (print a normalized de-duped context tree).

Includes `foundation`, `language`.

```
testing  →  foundation, language
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/framework/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/framework/testing https://github.com/waytide/testing.git master --squash
git subtree pull --prefix waytide/framework/testing https://github.com/waytide/testing.git master --squash
```

It includes `foundation` and `language` — install those too, or run `sh waytide/framework/testing/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/testing https://github.com/waytide/testing.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
