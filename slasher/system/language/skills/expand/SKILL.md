---
name: expand
description: Expand the previous answer beyond its bullet points.
disable-model-invocation: true
---

The engineer typed `/expand $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh an-answer-is-a-list-and-prose-must-justify-itself`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Give the expanded answer the rule offers: more detail on the previous answer than its bullet points carried. Offer no next topic.
