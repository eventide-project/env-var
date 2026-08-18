# Waytide — design-by-efferent

**Design By Efferent** (DBE). Human-in-the-loop, efferent-first design method. An updated TDD variant with accommodations for AI. Tests are the vehicle and design is the point. The **actuation**, the first efferent reference to a unit, is written before any implementation, forcing the interface to be designed from the use site.

The one-liner:

> The AI **generates** straight through, and **waits** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**. Everything else is **mechanical**.

**The vocabulary**. `vocabulary.md` is the method's lexicon: loop, hinge, gate, deliberation, mechanical, subtle, cradle, efferent, actuation, observation, load-bearing, and the DBE name itself. It carries the distributed-OODA framing (the human owns Orient, and the AI owns Observe and Act) and the discontinued terms. Read it first — the rules below use its words with its meanings.

**The method**
- DBE is a design tool, not a testing ritual — the test is a **cradle** for code generation, not a pass/fail gate.
- Human-in-the-loop: deliberate the hinges (the actuation and solubility), never the pass/fail bar.
- First turn: the first gate is the actuation and an unnamed assert. Naming is deferred to the feature's close.
- Never ask whether to start test-first — it is the standing default.

**Attended or unattended**
- The human's level of participation is chosen at a feature's or experiment's start, beside the working location. Attended is the default. The question is **Who decides?**, and neither it nor an option names a hinge — the engineer has not met one yet.
- DBE is in effect either way — the cradle, the efferent-first actuation, and the solubility standard all hold. Only the stopping changes.
- An unattended cycle is recorded with its hinge and the decision's reasoning, and no options or decision line, since neither happened.

**The hinge cycle**
- Five hinges, each accepted before the next: actuation → observation → controls → implementation → naming.
- The five are **named once, ahead of the first one**, so the engineer knows what is coming and what the loop does between them.
- An option **is the artifact** — `assert(retries == 3)`, not `Accept — assert the returned count against 3`. A hinge with one candidate shows it the same way, and never as an accept prompt.
- The observation reads the **side effect the actuation produces**. A returned value is one such effect, and a case rather than the rule.
- What each hinge displays:
  - The actuation is the anchor at every downstream hinge.
  - The contexts are shown once, at hinge 1.
  - The **implementation** is on screen before the loop moves on from hinge 4.
- The actuation gate offers candidate actuations as options, with a mandatory free-text option. A candidate varies what the **use site states** — an omitted argument is one, and a chained construction or a varied receiver is not.
- Advance one outcome at a time and stop at every gate. Never batch-generate test files.

**After the implementation hinge**
- Always show the implementation, the just-satisfied test, and the current feature's full test output, without being asked. The implementation leads, because the solubility verdict is made on it.

**Design vs. coverage**
- TDD designs behavior. Adding coverage prevents its regression — distinct activities. Never break a working implementation to introduce a test.
- A *coverage* test's design still waits at the hinges, with the implementation hinge degenerate.
- Drop an outcome whose test is green-on-arrival — it drives no design.
- The implementation hinge offers two candidates: the working implementation, or the **red/green/refactor cycle** — chosen, and so not the choreography this method rejects. The red must reach no stable test, and the cycle is unavailable when covering existing behavior.

**The `logs/loops/` artifact directory** (this package contributes it)
- Loop records — one file per feature recording each cycle's hinge → options → decision/chat.

Includes `foundation`, `language`, `testing`.

```
design-by-efferent  →  foundation, language, testing
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
git subtree pull --prefix waytide/system/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
```

It includes `foundation`, `language`, and `testing` — install those too, or run `waytide/system/design-by-efferent/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/design-by-efferent https://github.com/waytide/design-by-efferent.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
