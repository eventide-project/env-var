---
name: done
description: Make a work item or a rework item Done. An alias of /item done.
argument-hint: "[<item> | help]"
disable-model-invocation: true
---

The engineer typed `/done $ARGUMENTS`. `/done` acts on an item, as `/item done` does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Where the words name an item, make it Done, as `/item done` does. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`.
3. Where the words name a feature or an experiment, say that an implementation takes no state `/done` gives, name the subcommand that concludes it, `complete`, and do nothing more.
4. Where the record named cannot take the state, say so, name the state its kind takes instead, and do nothing more.
5. Where no words were typed, or the words do not say which record is meant, ask which, through the selection interface. Offer the items, features, and experiments that can take the state.
6. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
