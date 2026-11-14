# Run the test suite after changes, before considering whether to commit

After making any code change, run the full test suite and confirm it passes **before** considering whether to commit. The suite run is a precondition of the commit decision, not a step taken after deciding to commit. A failing or incomplete suite means there is nothing to weigh — don't reach the question of committing until the suite passes.

**When the agent can tell that it is a good time to commit, it offers the commit through the selection interface.** A good time is a piece of work finished and the suite passing. The prompt offers to commit and not to commit, and the agent does not commit until the engineer selects it. Where the agent cannot tell, it waits to be asked.

**As the engineer stated it:** if the agent can know whether it's an appropriate time to commit, then it should prompt with an option to commit.

**The prompt also offers `Snooze this question`.** Selecting it means the agent commits at each good time from then on, without the prompt, for as long as the working tree stays on the branch it was selected on. When the working tree leaves that branch, the prompt returns. The suite still has to pass before each commit.

**The question is never snoozed on `master`.** On `master` the prompt does not offer `Snooze this question`, and every commit there waits for the engineer's selection.

**As the engineer stated it:** the prompt should never be able to be snoozed on master.

**As the engineer stated it:** an option in the commit prompt should be: Snooze this prompt. That option will cause the agent to commit rather than prompt. Then: "Prompt" is the wrong word. It should say, "Snooze this question".

**How the suite is run is the project's stack's concern, not this rule's.** What command runs it, and what its output reads when nothing failed, differ by language and test framework. So they are settled where a stack is settled. For a Ruby project that is the `ext/ruby-lang` package's rule on running the suite. This rule fixes only *when* the run happens relative to the commit decision, which holds for any stack.

**Why:** Committing is the point of no easy return. The suite is the cheapest way to prevent committing a regression. Running it *before* deliberating commit keeps a failing change from ever becoming a commit candidate. It also keeps the recorded history verified at every commit. This is verification rather than ceremony, consistent with the human-in-the-loop TDD rule's framing of the test run as confirmation. The *commit* waits on the bar, not the human's attention.

**How to apply:** Edit → run the full suite → confirm it reports nothing failed → only then consider committing. If anything is failing or aborted, fix it (or stop) before the commit question arises. For a single-file change you may run the one file first for speed, but run the full suite before commit.

## Compressed

1. Run the full suite after any code change.
2. Confirm it passes **before** considering whether to commit.
3. The suite run is a precondition of the commit decision.
4. The suite run is not a step taken after deciding to commit.
5. A failing or incomplete suite means there is nothing to weigh.
6. Do not reach the question of committing until the suite passes.
7. How the suite is run is the project's stack's concern, not this rule's.
8. The command and its passing output differ by language and test framework.
9. The command and its passing output are settled where a stack is settled.
10. For a Ruby project, that is the `ext/ruby-lang` package's rule on running the suite.
11. This rule fixes only *when* the run happens relative to the commit decision. That holds for any stack.
12. Apply it as: Edit → run the full suite → confirm it reports nothing failed → only then consider committing.
13. If anything is failing or aborted, fix it, or stop, before the commit question arises.
14. For a single-file change, you may run that one file's tests first for speed.
15. Run the full suite before commit anyway.
16. The commit waits on the suite passing, not on the human's attention.
17. When the agent can tell it is a good time to commit, a piece of work finished and the suite passing, it offers the commit through the selection interface: commit, or do not commit.
18. Commit only when the engineer selects it. Where the agent cannot tell, wait to be asked.
19. The prompt also offers `Snooze this question`. Once it is selected, commit at each good time without the prompt, while the working tree stays on the branch it was selected on. The suite still passes before each commit.
20. When the working tree leaves that branch, offer the prompt again.
21. On `master`, do not offer `Snooze this question`. Every commit on `master` waits for the engineer's selection.

## Compression

- 2026-10-22, compressed: compression 0.17, change 0.42, solubility 75 → 89, clarity 0.66 → 0.87, 10 directives, 9 kept, 1 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 89 → 89, clarity 0.87 → 0.91; checked: 10 directives, 8 kept, 1 less precise, 1 lost, 2 repairs, re-checked kept
- 2026-10-29, revised: the agent offers the commit when it can tell the time is right; checked: 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the commit prompt offers Snooze this question, lasting while the working tree stays on its branch; checked: 18 directives, 17 kept, 1 less precise, 0 lost. Left less precise: the run framed as verification rather than ceremony, a reason the compressed text does not carry. The option's wording was then swapped, a term the engineer settled, so no re-check
- 2026-10-29, revised: the question is never snoozed on master; checked: 21 directives, 21 kept, 0 less precise, 0 lost

## History

Until Thu Oct 29 2026 `Snooze this question` was offered on any branch. The engineer settled that it is never offered on `master`.

Until Thu Oct 29 2026 the commit prompt offered only to commit or not. The engineer settled a third option, `Snooze this question`, lasting while the working tree stays on its branch.

Until Thu Oct 29 2026 this rule said when the commit question arises, and not who raises it. The engineer settled that the agent offers the commit when it can tell the time is right.

Until Sun Oct 25 2026 this rule was named run-suite-before-commit.

Related:

- the human-in-the-loop TDD rule
- the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule — the implementation, the test, and its output shown at the implementation hinge
- — for a Ruby project — the `ext/ruby-lang` rule naming the suite's entry point and its verified output

---

Authored by Scott Bellware on Sun Jun 28 2026 at 12 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:47:55 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 8:55:06 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:18:37 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:38 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:07:48 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:54:36 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:58:00 PM PT
