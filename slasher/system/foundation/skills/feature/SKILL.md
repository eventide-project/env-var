---
name: feature
description: Start a feature, show its status, or change its state.
argument-hint: "[new [with phases] | status | start | complete | affirm | refute | inconclusive | defer | suspend | discontinue | obsolete | supersede | abandon | resume | help]"
disable-model-invocation: true
---

The engineer typed `/feature $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. `new with phases` is one subcommand.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. Where nothing was typed, ask which subcommand is meant, through the selection interface, in these groups. Then ask again within the group selected, where it holds more than one.
   - **Start:** `new`, `new with phases`, `start`
   - **Conclude:** `complete`, `affirm`, `refute`, `inconclusive`
   - **Set aside:** `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`
   - **Other:** `resume`, `status`, `help`
5. **`new`**: create the feature's branch and write its record Open. Load the-implementations-directory-holds-one-record-per-implementation and an-implementation-runs-on-a-branch-to-a-declared-end. The words after it, where any were typed, state the feature's intent or question.
6. **`new with phases`**: create the feature as `new` does, and ask for its phases. Load a-phase-starts-by-stating-its-goal too.
7. **`status`**: show the feature's phases, its current phase, and that phase's goal. Load a-phase-starts-by-stating-its-goal.
8. **A change of state**, `start`, `complete`, `affirm`, `refute`, `inconclusive`, `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`, or `resume`: change the feature's state, as the root command of the same name does for a feature. Load an-implementation-runs-on-a-branch-to-a-declared-end and the-implementations-directory-holds-one-record-per-implementation. `affirm` is the engineer's declaration only, so the skill acts on it only when the engineer typed it.
9. **`realize` or `done`** maps to no state a feature takes. Say so, name `complete`, which concludes a feature, and do nothing more.
10. Steps 7 and 8 act on the feature the conversation is on. Where that is not clear, or more than one feature is open, ask which, through the selection interface.
11. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 4 does.
