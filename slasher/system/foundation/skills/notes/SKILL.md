---
name: notes
description: List the items tagged [note].
argument-hint: "[<n>]"
disable-model-invocation: true
---

The engineer typed `/notes $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/item help` prints the help of its command domain. Do nothing more.
2. Otherwise, list every item tagged `[note]`. Where the first word is a number, list only that many of the most recent notes. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
