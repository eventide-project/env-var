---
name: item
description: Create, list, or change the state of an item.
argument-hint: "[new [<kind>] | <kind> | list <state> | <state change> <item> | help]"
disable-model-invocation: true
---

The engineer typed `/item $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. The words after it are its arguments.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. Where nothing was typed, ask which subcommand is meant, through the selection interface, in these groups. Then ask again within the group selected.
   - **Ideas and goals:** `idea`, `improvement`, `correction`, `aspiration`, `goal`
   - **Work and plans:** `work`, `plan`, `design`
   - **Findings:** `note`, `mistake`, `problem`
   - **Other:** `list`, a state change, `help`
5. **`new [<kind>]`**, or **`<kind>`** where the kind is not one of this command's subcommands: create an item tagged `[<kind>]`, or `[idea]` where no kind is named. Load the-items-directory-holds-one-file-per-item. The words after the kind are what the item says. Where none were typed, ask what it says.
6. **`note`**: record a note. Load a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes.
7. **`list <state>`**: list the items in that state. `current` means Open, Active, and Implementation. Load a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows. Where no state was typed, ask which.
8. **A state change**, `start`, `complete`, `realize`, `done`, `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`, or `resume`, followed by the item: change that item's state, as the root command of the same name does for an item. Load the-items-directory-holds-one-file-per-item. Where no item was named, or the words name more than one, ask which, through the selection interface. Where the item cannot take the state, say so, name the state its kind takes instead, and do nothing more.
9. **`affirm`, `refute`, or `inconclusive`** maps to no state an item takes. Say so, name `complete`, which concludes an item in its kind's concluding state, and do nothing more.
10. Any other first word that is not a kind is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 4 does.
