---
name: improvement
description: Create an item tagged [improvement]. An alias of /item improvement.
argument-hint: "[<text> | help]"
disable-model-invocation: true
---

The engineer typed `/improvement $ARGUMENTS`. `/improvement` is an alias of `/item improvement`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, create an item tagged `[improvement]`. Load the rule that governs items. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. The words typed are what the item says. Where none were typed, ask what it says.
