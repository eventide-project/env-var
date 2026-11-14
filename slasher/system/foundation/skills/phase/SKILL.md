---
name: phase
description: Show the current phase, or add, start, or conclude a phase.
argument-hint: "[current | add <name> | start | complete | affirm | refute | inconclusive | help]"
disable-model-invocation: true
---

The engineer typed `/phase $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. The words after it are its arguments.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. **Nothing typed, or `current`**: show the current phase of the implementation the conversation is on, its goal, and its branch. Load a-phase-starts-by-stating-its-goal.
5. **`add <name>`**: add a phase named `<name>` after the last, and ask whether it states a forecast. Load an-implementation-runs-on-a-branch-to-a-declared-end and the-implementations-directory-holds-one-record-per-implementation. Where no name was typed, ask for one.
6. **`start`**: start the next phase. Load an-implementation-runs-on-a-branch-to-a-declared-end and a-phase-starts-by-stating-its-goal.
7. When a phase with a forecast is complete, ask the verdict question, as the rule says. **`complete`**: conclude a phase without a verdict, and merge it into the implementation's branch. Its commits are squashed when the implementation concludes. **`affirm`**, **`refute`**, or **`inconclusive`**: conclude a phase that reaches a verdict with that verdict. Each is the engineer's declaration, so the skill acts on it only when the engineer typed it. Load an-implementation-runs-on-a-branch-to-a-declared-end and the-implementations-directory-holds-one-record-per-implementation.
8. Each subcommand acts on the implementation the conversation is on. Where that is not clear, or more than one is open, ask which, through the selection interface.
9. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface, in these groups, then again within the group selected:
   - **Look:** `current`, `help`
   - **Add or start:** `add`, `start`
   - **Conclude without a verdict:** `complete`
   - **Conclude with a verdict:** `affirm`, `refute`, `inconclusive`
