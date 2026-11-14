---
name: copy-last-line
description: Copy the last line of the agent's previous reply to the clipboard.
disable-model-invocation: true
---

The engineer typed `/copy-last-line $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh copy-last-line-copies-the-last-line-of-the-previous-reply`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
