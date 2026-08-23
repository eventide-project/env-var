# "test tree" command: run the suite and print a normalized, de-duped context tree

When the user gives the command **"test tree"**, run the automated suite and print its structure as a **single normalized tree**. That is the whole suite's `context`/`test` hierarchy with **duplicate outer context headings merged**, so each context path appears **once**.

The problem it solves is repetition. Each test file re-declares the outer contexts that mirror its folder path, as its siblings in that folder do. The raw run output repeats those headings per file. The normalized tree merges them. Each outer context appears once, then each sub-feature once beneath it. The individual tests are leaves with a `•` prefix, and the pass/fail summary line comes at the end.

**Produce it from the run's output, not the source.** The tree is built by running the suite with narration output suppressed, capturing the output, and parsing *that*. Every file's `context`/`test` hierarchy is merged into one tree keyed by name, so identical paths de-duplicate. Because it comes from the run, a dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder. A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.

**A durable script is what makes the command reproducible** in every session, rather than a parser rebuilt from scratch each time. **Which script, and where it lives, is the project's stack's concern.** It runs that project's suite, suppresses that runner's narration, and parses that framework's output. None of that can be stated without naming a stack.

For a Ruby project it is settled by the `ext/ruby-lang` package's rule on running the suite. This rule fixes what the tree *is* and where it is derived from. Producing it is settled where a stack is.

**Why:** the de-duped tree is the readable, whole-suite view. It shows the feature and outcome structure at a glance, without the per-file repetition. Through the expanded dynamic names it also surfaces loop-generated cases.

**How to apply:** on a "test tree" request, run the project's durable tree script and present its output.

Related:

- the status-report (in `foundation`) and test-report commands
- which include a shallower two-level context tree
- — for a Ruby project — the `ext/ruby-lang` rule that settles the script

---

Authored by Scott Bellware on Wed Jul 1 2026 at 8 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:47:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:48:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
