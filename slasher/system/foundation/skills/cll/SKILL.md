---
name: cll
description: Copy the last line of the agent's previous reply to the clipboard. An alias of /copy-last-line.
disable-model-invocation: true
---

The engineer typed `/cll $ARGUMENTS`. `/cll` is an alias of `/copy-last-line`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh copy-last-line-copies-the-last-line-of-the-previous-reply`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
