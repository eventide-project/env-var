---
name: pros-and-cons
description: Give each option of the agent's last question with its pros and cons.
disable-model-invocation: true
---

The engineer typed `/pros-and-cons $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, the words typed, where any were, say what the engineer wants weighed. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh pros-and-cons-gives-each-option-of-the-last-question-with-its-pros-and-cons`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
