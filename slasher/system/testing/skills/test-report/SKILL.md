---
name: test-report
description: Classify the suite. An alias of /test report.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/test-report $ARGUMENTS`. `/test-report` is an alias of `/test report`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `test` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh a-test-report-classifies-the-suite-and-prints-its-context-hierarchy`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh a-test-report-classifies-the-suite-and-prints-its-context-hierarchy`. Follow the rule it prints.
