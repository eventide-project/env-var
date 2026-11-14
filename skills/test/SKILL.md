---
name: test
description: Run the automated suite, an interactive test, the test report, or the test tree.
argument-hint: "[interactive [<test>] | report | tree | help]"
disable-model-invocation: true
---

The engineer typed `/test $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints.
2. Read the first word typed as the subcommand. The words after it are its arguments.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. **Nothing typed**: run the automated suite. Load a-test-run-asked-for-runs-the-automated-suite-or-the-interactive-test-named.
5. **`interactive [<test>]`**: run the interactive test named, or ask which. Load a-test-run-asked-for-runs-the-automated-suite-or-the-interactive-test-named.
6. **`report`**: classify the suite. Load a-test-report-classifies-the-suite-and-prints-its-context-hierarchy.
7. **`tree`**: run the suite and print its context tree. Load the-test-tree-command-prints-the-suites-context-tree.
8. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: run the suite, `interactive`, `report`, or `tree`.
