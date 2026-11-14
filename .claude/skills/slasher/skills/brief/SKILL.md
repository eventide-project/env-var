---
name: brief
description: Answer the request in brief, or give the previous answer again in brief.
argument-hint: "[<request>]"
disable-model-invocation: true
---

The engineer typed `/brief $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh an-answer-is-a-list-and-prose-must-justify-itself`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Where words were typed after the command, they are the request: answer it in brief, as the rule's *Answering in brief* section says. Where none were typed, give the previous answer again in brief.
