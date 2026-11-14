---
name: features
description: List the current features.
argument-hint: "[current] [<n>]"
disable-model-invocation: true
---

The engineer typed `/features $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/feature help` prints the help of its command domain. Do nothing more.
2. Otherwise, list the current features. `/features current` does the same. Where the first word is `current`, read the word after it as the first word. Where the first word is a number, list only that many of the most recent current features. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
