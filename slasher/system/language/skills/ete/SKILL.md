---
name: ete
description: Say the previous answer, or the words typed, in Eventide Technical English.
argument-hint: "[<text>]"
disable-model-invocation: true
---

The engineer typed `/ete $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh slasher-keeps-its-word-where-the-ste-word-means-something-else`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Say the previous answer again in Eventide Technical English, as *Say it in ETE* asks. Where words were typed after the command, say those in ETE instead.
