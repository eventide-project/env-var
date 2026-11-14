---
name: idk
description: Say "I don't know" to the agent's last question, so it explains the question and asks it again.
disable-model-invocation: true
---

The engineer typed `/idk $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, the words typed say what the engineer does not know. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh idk-answers-the-last-question-with-i-dont-know`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
