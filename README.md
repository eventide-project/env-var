# Waytide — design-by-efferent

**Design By Efferent** (DBE). Human-in-the-loop, efferent-first design method. An updated TDD variant with accommodations for AI: tests are the vehicle and design is the point — the **actuation**, the first efferent reference to a unit, is written before any implementation, forcing the interface outside-in.

The one-liner:

> The AI **generates** straight through, and **gates** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**; everything else is **mechanical**.

**The vocabulary**. `vocabulary.md` is the method's lexicon: loop, hinge, gate, deliberation, mechanical, subtle, cradle, efferent, actuation, observation, load-bearing, and the DBE name itself. It carries the distributed-OODA framing (the human owns Orient; the AI owns Observe and Act) and the retired terms. Read it first — the rules below use its words with its meanings.

**The method**
- DBE is a design tool, not a testing ritual — the test is a **cradle** for generation, not a pass/fail gate.
- Human-in-the-loop: deliberate the hinges (the actuation and solubility), never the pass/fail bar.
- First turn: the first gate is the actuation and an unnamed assert; naming is deferred to the feature's close.
- Never ask whether to start test-first — it is the standing default.

**The hinge cycle**
- Five hinges, each accepted before the next: actuation → observation → controls → implementation → naming.
- What each hinge displays: the actuation is the anchor at every downstream hinge; the contexts are shown once, at hinge 1.
- The actuation gate offers candidate actuations as options, with a mandatory origination escape.
- Every prompt — hinge or not — goes through the selection UI; its built-in free-text choice *is* the escape.
- Advance one outcome at a time and stop at every gate; never batch-generate test files.

**After the implementation hinge**
- Always show the just-satisfied test, and the current feature's full test output, without being asked.

**Design vs. coverage**
- TDD designs behavior; adding coverage protects it — distinct activities. Never break a working implementation to introduce a test.
- The hinges still gate a *coverage* test's design, with the implementation hinge degenerate.
- Drop an outcome whose test is green-on-arrival — it drives no design.
- The first implementation may run a *contained* red/green loop, so long as the failure reaches no stable test.

**The `loops/` artifact directory** (this package contributes it)
- Loop records — one file per feature recording each pass's hinge → options → decision/chat.
- Record substantive design dialogue automatically, as the session proceeds.

Includes `foundation`, `language`, `testing`.

```
design-by-efferent  →  foundation, language, testing
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/framework/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/framework/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
git subtree pull --prefix waytide/framework/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
```

It includes `foundation`, `language`, and `testing` — install those too, or run `sh waytide/framework/design-by-efferent/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
