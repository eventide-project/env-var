# A test run asked for runs the automated suite, or the interactive test named

**Trigger:** When the engineer asks for a test run, as with `/test` or `/test interactive`

**`/test` runs the automated suite: every test under `test/automated/`.** It runs the suite by the command the project's stack sets, and skips a file whose name begins with an underscore, as the a-test-file-named-with-a-leading-underscore-is-suspended rule requires.

**The run is reported as the automated tests passing or failing**, never as *the tests* passing. Where the project holds interactive tests, the report says they were not run. A failure is reported with the test that failed and what it reported.

**`/test interactive <test>` runs the interactive test named**, from `test/interactive/`. With no test named, it lists the interactive tests through the selection interface and asks which one to run. It runs one test, and only the one asked for.

**An interactive test runs only when the engineer asks for it.** `/test` never runs one, and neither does any other command. A run the engineer asks for is still theirs to judge: the agent reports what came back, and the engineer decides whether it passed.

**`/test report` and `/test tree` run the test-report and test-tree commands**, as the a-test-report-classifies-the-suite-and-prints-its-context-hierarchy and the-test-tree-command-prints-the-suites-context-tree rules describe. `/test-report` and `/test-tree` are aliases of them.

**A project with no automated suite runs nothing on `/test`**, and says that the project has no automated tests. That is not a failure.

**Why:** a test run is asked for often, and the rules already settle what is run, when, and by whom. A command that runs exactly that, and reports exactly what ran, saves the engineer from stating it each time, and keeps a report from claiming more than was run.

**How to apply:** on `/test`, run the automated suite by the project's command, skipping suspended files, and report the automated tests passing or failing, and that interactive tests were not run where there are any. On `/test interactive`, run the one test named, or ask which, and report what came back for the engineer to judge. Run the test report or the test tree on `/test report` and `/test tree`.

## Compressed

1. `/test` runs the automated suite, every test under `test/automated/`, by the command the project's stack sets. Skip a file whose name begins with an underscore.
2. Report the automated tests passing or failing, never *the tests*. Where there are interactive tests, say they were not run. Report a failure with the test that failed and what it reported.
3. `/test interactive <test>` runs the one interactive test named, from `test/interactive/`. With none named, list them through the selection interface and ask which to run.
4. Run an interactive test only when the engineer asks for it. No other command runs one.
5. Report what an interactive test brought back. The engineer judges whether it passed.
6. `/test report` and `/test tree` run the test-report and test-tree commands. `/test-report` and `/test-tree` are their aliases.
7. With no automated suite, `/test` runs nothing, and says the project has no automated tests. That is not a failure.

## Compression

- 2026-11-02, compressed: checked: 20 directives, 20 kept, 0 less precise, 0 lost

Related:

- the tests-are-automated-or-interactive-and-only-the-automated-run-before-a-commit rule — the two directories, and who runs each
- the a-test-file-named-with-a-leading-underscore-is-suspended rule — the files a run skips
- the a-test-report-classifies-the-suite-and-prints-its-context-hierarchy rule and the the-test-tree-command-prints-the-suites-context-tree rule — the report and the tree
- the `foundation` a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:53:36 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:33 PM PT
