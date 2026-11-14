---
name: decision
description: Log the engineer's decision, tagged [decision].
argument-hint: "[<decision>]"
disable-model-invocation: true
---

The engineer typed `/decision $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/log help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh a-log-entry-recording-an-engineers-decision-is-tagged-decision`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, for `/decision`.
