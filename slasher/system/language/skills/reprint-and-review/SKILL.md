---
name: reprint-and-review
description: Print the draft as it now stands, then a review of it.
argument-hint: "[<file>]"
disable-model-invocation: true
---

The engineer typed `/reprint-and-review $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, the words typed, where there are any, name a file whose text is the draft. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh reprint-and-review-prints-the-draft-and-a-review-of-it`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
