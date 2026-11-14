---
name: test-tree
description: Run the suite and print its context tree. An alias of /test tree.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/test-tree $ARGUMENTS`. `/test-tree` is an alias of `/test tree`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `test` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh the-test-tree-command-prints-the-suites-context-tree`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh the-test-tree-command-prints-the-suites-context-tree`. Follow the rule it prints.
