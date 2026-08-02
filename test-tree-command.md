# "test tree" command: run the suite and print a normalized, de-duped context tree

When the user gives the command **"test tree"**, run the automated suite and print its structure as a **single normalized tree** — the whole suite's `context`/`test` hierarchy with **duplicate outer context headings merged**, so each context path appears **once**.

The problem it solves: each test file re-declares the same outer contexts (the class/namespace, then the feature), so the raw run output repeats those headings per file. The normalized tree merges them: each outer context appears once, then each sub-feature once beneath it, with the individual tests as leaves (a `•` prefix), and the pass/fail summary line at the end.

**Produce it from the run's output, not the source.** The tree is built by running the suite (with narration output suppressed), capturing the output, and parsing *that* — merging every file's `context`/`test` hierarchy into one tree keyed by name so identical paths de-duplicate. Because it comes from the run, a dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder; a bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.

**A durable script is what makes the command reproducible** across sessions, rather than a parser rebuilt from scratch each time. **Which script, and where it lives, is the project's stack's concern** — it runs that project's suite, suppresses that runner's narration, and parses that framework's output, none of which can be stated without naming a stack. For a Ruby project it is settled by the `code/ruby` package's rule on running the suite. This rule fixes what the tree *is* and where it is derived from; producing it is settled where a stack is.

**Why:** the de-duped tree is the readable, whole-suite view — it shows the feature/outcome structure at a glance without the per-file repetition, and (via the expanded dynamic names) surfaces loop-generated cases.

**How to apply:** on a "test tree" request, run the project's durable tree script and present its output. Related: the status-report (in `foundation`) and test-report commands, which include a shallower two-level context tree, and — for a Ruby project — the `code/ruby` rule that settles the script.

---

Authored by Scott Bellware on Wed Jul 1 2026 at 8 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:47:55 PM PT
