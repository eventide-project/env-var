---
name: note
description: Record a note. An alias of /item note.
argument-hint: "[<text> | help]"
disable-model-invocation: true
---

The engineer typed `/note $ARGUMENTS`. `/note` is an alias of `/item note`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Load the rule that governs notes. From the project root, run `slasher/system/foundation/load-rules.sh a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. Record a note. The words typed are what it says. Where none were typed, ask what it says.
