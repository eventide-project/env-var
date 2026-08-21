# Waytide — testing

Controls-based test-writing conventions. Not tied to a specific test-framework API.

**Structure and naming**
- Actuate the concern once at the top. Assert each outcome in its own nested context (`tdd-test-structure`).
- Context nesting mirrors the folder hierarchy. A single-case feature is one file named for the feature.
- A feature's normal path and each of its exceptional paths are **separate files** — an exceptional path cannot share the normal path's single actuation.
- A `test` block holds only the assertion. Every operand is an explaining variable declared in the enclosing context.
- Name a test "Is …" only for a value-equals-comparator assertion. A raised-error outcome is named "Fails" (or "Doesn't fail"), its condition promoted to a context.
- A predicate method's context is "`<Name>` Predicate". Enclose a test in a context only when it needs local instrumentation.

**Controls**
- Local variables built by a control take the `control_` prefix. A control's string value starts with "some".
- The known inputs — the helpers, the values, and the setup phase — are **controls**, never factories, fixtures, or "arrange".

**Preconditions**
- A **precondition** is a bare `assert`/`refute` that is not a test. It **documents a factor that decides the test's outcome** where the script doesn't express it — most often a property of a control, whose value is named rather than described.
- It documents by **asserting**, so the clarification is checked rather than claimed. It qualifies the test rather than preventing a regression, so a failed one makes the result meaningless rather than wrong.
- Its predicate reads **inline**, with no explaining variable — the stated exception to the assertion-only rule — and it sits immediately before what it qualifies.

**What to test**
- Assert an error's message only when it is the sole way to confirm the correct error was raised.
- Don't test the platform — a transparent pass-through has nothing of ours at risk.

**Vocabulary** (`vocabulary.md`): the terms **controls** and **precondition**, and the testing-domain substitutions — verified (not green), prevent (not guard, for a test).

**Commands**: `test-report` (classify the suite) and `test-tree` (print a normalized de-duped context tree).

Includes `foundation`, `language`.

```
testing  →  foundation, language
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/testing git@github.com:waytide/testing.git master --squash
git subtree pull --prefix waytide/system/testing git@github.com:waytide/testing.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/waytide/testing.git` in place of the address above. A script takes `WAYTIDE_ORIGIN=https://github.com/waytide` for the same reason.

It includes `foundation` and `language` — install those too, or run `waytide/system/testing/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/testing git@github.com:waytide/testing.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
