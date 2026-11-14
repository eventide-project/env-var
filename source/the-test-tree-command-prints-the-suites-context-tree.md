# The test tree command prints the suite's context tree

**Trigger:** When the user gives the command "test tree", or types `/test tree` or `/test-tree`

When the user gives the command **"test tree"**, or types `/test tree` or `/test-tree`, run the automated suite and print its structure as a **single normalized tree**. That is the whole suite's `context`/`test` hierarchy with **duplicate outer context headings merged**, so each context path appears **once**.

The problem it solves is repetition. Each test file re-declares the outer contexts that mirror its folder path, as its siblings in that folder do. The raw run output repeats those headings per file. The normalized tree merges them. Each outer context appears once, then each sub-feature once beneath it. The individual tests are leaves with a `•` prefix, and the pass/fail summary line comes at the end.

**Produce it from the run's output, not the source.** The tree is built by running the suite with narration output suppressed, capturing the output, and parsing *that*. Every file's `context`/`test` hierarchy is merged into one tree keyed by name, so identical paths de-duplicate. Because it comes from the run, a dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder. A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.

**A durable script is what makes the command reproducible** in every session, rather than a parser rebuilt from scratch each time. **Which script, and where it lives, is the project's stack's concern.** It runs that project's suite, suppresses that runner's narration, and parses that framework's output. None of that can be stated without naming a stack.

For a Ruby project it is settled by the `ext/ruby-lang` package's rule on running the suite. This rule fixes what the tree *is* and where it is derived from. Producing it is settled where a stack is.

**Why:** the de-duped tree is the readable, whole-suite view. It shows the feature and outcome structure at a glance, without the per-file repetition. Through the expanded dynamic names it also surfaces loop-generated cases.

**How to apply:** on a "test tree" request, run the project's durable tree script and present its output.

## Compressed

1. When the user gives the command **"test tree"**, or types `/test tree` or `/test-tree`, run the automated suite.
2. Print its structure as a **single normalized tree**.
3. The tree is the whole suite's `context`/`test` hierarchy.
4. Merge **duplicate outer context headings**, so each context path appears **once**.
5. Each outer context appears once, with each sub-feature once beneath it.
6. Show individual tests as leaves with a `•` prefix.
7. Put the pass/fail summary line at the end.
8. **Produce the tree from the run's output, not the source.**
9. Run the suite with narration output suppressed, capture the output, and parse that output.
10. Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate.
11. A dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder.
12. A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.
13. Use a durable script, so the command is reproducible in every session, rather than rebuilding a parser each time.
14. **Which script, and where it lives, is the project's stack's concern.**
15. The script runs the project's suite, suppresses that runner's narration, and parses that framework's output.
16. For a Ruby project, the `ext/ruby-lang` package's rule on running the suite settles the script.
17. This rule fixes only what the tree is and where it is derived from.
18. On a "test tree" request, run the project's durable tree script and present its output.

## Compression

- 2026-10-24, compressed: compression 0.19, change 0.44, solubility 75 → 84, clarity 0.76 → 0.86, 16 directives, 16 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 84 → 84, clarity 0.86 → 0.85; checked: 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-11-05, revised: `/test tree` and `/test-tree` are commands for the tree; checked: 17 directives, 17 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named test-tree-command and titled ""test tree" command: run the suite and print a normalized, de-duped context tree".

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
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:32 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 5:52:32 PM PT
