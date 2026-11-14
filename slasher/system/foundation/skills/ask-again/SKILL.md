---
name: ask-again
description: Repeat the agent's previous multiple-choice question.
disable-model-invocation: true
---

The engineer typed `/ask-again $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh ask-again-puts-the-last-question-again`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
