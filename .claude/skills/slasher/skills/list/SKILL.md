---
name: list
description: List the items in a state. An alias of /item list.
argument-hint: "[<state> | help]"
disable-model-invocation: true
---

The engineer typed `/list $ARGUMENTS`. `/list` is an alias of `/item list`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, list the items in the state typed. `current` means Open, Active, and Implementation. Where no state was typed, ask which. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
