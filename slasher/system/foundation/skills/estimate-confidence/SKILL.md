---
name: estimate-confidence
description: Give the agent's confidence of proceeding unattended from where the work stands.
disable-model-invocation: true
---

The engineer typed `/estimate-confidence $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh estimate-confidence-gives-the-agents-confidence-of-proceeding-unattended`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
