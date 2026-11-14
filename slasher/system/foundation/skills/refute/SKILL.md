---
name: refute
description: Make a feature or an experiment Refuted. An alias of /feature refute and /experiment refute.
argument-hint: "[<feature> | <experiment> | help]"
disable-model-invocation: true
---

The engineer typed `/refute $ARGUMENTS`. `/refute` acts on a feature or an experiment, as `/feature refute` and `/experiment refute` do.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Where the words name an item, say that an item takes no state `/refute` gives, name the subcommand that concludes it, `complete`, and do nothing more.
3. Where the words name a feature or an experiment, make it Refuted, as `/feature refute` or `/experiment refute` does. From the project root, run `slasher/system/foundation/load-rules.sh` with `an-implementation-runs-on-a-branch-to-a-declared-end`, then with `the-implementations-directory-holds-one-record-per-implementation`.
4. Where the record named cannot take the state, say so, name the state its kind takes instead, and do nothing more.
5. Where no words were typed, or the words do not say which record is meant, ask which, through the selection interface. Offer the items, features, and experiments that can take the state.
6. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
