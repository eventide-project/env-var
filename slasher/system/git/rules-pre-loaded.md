# Run the test suite after changes, before considering whether to commit

Source: system/git/source/run-the-test-suite-after-changes-before-considering-whether-to-commit.md

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
