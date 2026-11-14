---
name: supersede
description: Make an item, a feature, or an experiment Superseded, naming the record that replaces it. An alias of /item supersede, /feature supersede, and /experiment supersede.
argument-hint: "[<item> | <feature> | <experiment> | help]"
disable-model-invocation: true
---

The engineer typed `/supersede $ARGUMENTS`. `/supersede` acts on an item, as `/item supersede` does, or on a feature or an experiment, as `/feature supersede` and `/experiment supersede` do.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Where the words name an item, make it Superseded, naming the item that replaces it, as `/item supersede` does. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`.
3. Where the words name a feature or an experiment, make it Superseded, naming the implementation that replaces it. It needs no suspension first, as `/feature supersede` or `/experiment supersede` does. From the project root, run `slasher/system/foundation/load-rules.sh` with `an-implementation-runs-on-a-branch-to-a-declared-end`, then with `the-implementations-directory-holds-one-record-per-implementation`.
4. Where the record named cannot take the state, say so, name the state its kind takes instead, and do nothing more.
5. Where no words were typed, or the words do not say which record is meant, ask which, through the selection interface. Offer the items, features, and experiments that can take the state.
6. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
