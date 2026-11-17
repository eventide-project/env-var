---
name: open
description: Open a named record in the default application for its kind of file.
argument-hint: "<record> | help"
disable-model-invocation: true
---

The engineer typed `/open $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/record help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh the-open-command-opens-a-named-record-in-its-default-application`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, with the words typed as the words that name the record.
