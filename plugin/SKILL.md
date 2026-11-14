---
name: slasher
description: Offer topics to learn about, or print the help of every Slasher command with /slasher help.
argument-hint: "help"
disable-model-invocation: true
---

The engineer typed `/slasher $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this plugin's root directory, beside this file, exactly as it stands.
2. Where nothing was typed after `/slasher`, offer topics to learn about. From the project root, run `slasher/system/foundation/load-rules.sh a-bare-slasher-offers-topics-to-learn-about`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. Otherwise, do nothing, and say nothing.
