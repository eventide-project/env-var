---
name: phases
description: List the phases of the current implementation, the current one marked.
disable-model-invocation: true
---

The engineer typed `/phases $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/phase help` prints the help of its command domain. Do nothing more.
2. Otherwise, list the phases of the implementation the conversation is on, in order, with the current one marked. From the project root, run `slasher/system/foundation/load-rules.sh a-phase-starts-by-stating-its-goal`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Where it is not clear which implementation is meant, or more than one is open, ask which, through the selection interface.
