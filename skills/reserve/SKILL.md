---
name: reserve
description: Reserve a word, in six steps.
argument-hint: "[<word>]"
disable-model-invocation: true
---

The engineer typed `/reserve $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh a-word-is-reserved-in-six-steps`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Reserve the word typed, in the six steps the rule gives. Where no word was typed, ask which word.
