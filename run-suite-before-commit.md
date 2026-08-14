# Run the test suite after changes, before considering whether to commit

After making any code change, run the full test suite and confirm it passes **before** considering whether to commit. The suite run is a precondition of the commit decision, not a step taken after deciding to commit. A failing or incomplete suite means there is nothing to weigh — don't reach the question of committing until the suite passes.

**How the suite is run is the project's stack's concern, not this rule's.** What command runs it, and what its output reads when nothing failed, differ by language and test framework. So they are settled where a stack is settled. For a Ruby project that is the `code/ruby` package's rule on running the suite. This rule fixes only *when* the run happens relative to the commit decision, which holds for any stack.

**Why:** Committing is the point of no easy return. The suite is the cheapest way to prevent committing a regression. Running it *before* deliberating commit keeps a failing change from ever becoming a commit candidate. It also keeps the recorded history verified at every commit. This is verification rather than ceremony, consistent with the human-in-the-loop TDD rule's framing of the test run as confirmation. The *commit* waits on the bar, not the human's attention.

**How to apply:** Edit → run the full suite → confirm it reports nothing failed → only then consider committing. If anything is failing or aborted, fix it (or stop) before the commit question arises. For a single-file change you may run the one file first for speed, but run the full suite before commit.

Related:

- the human-in-the-loop TDD rule
- the show-the-test-after-implementing rule
- — for a Ruby project — the `code/ruby` rule naming the suite's entry point and its verified output

---

Authored by Scott Bellware on Sun Jun 28 2026 at 12 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:47:55 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
