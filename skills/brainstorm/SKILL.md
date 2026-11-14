---
name: brainstorm
description: Begin, end, suspend, or resume brainstorming, recording points as they are said and organizing them at the end.
argument-hint: "[begin | end | suspend | resume | <kind> | help]"
disable-model-invocation: true
---

The engineer typed `/brainstorm $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md` in the `brainstorm` skill's directory, and do nothing more.
2. Otherwise, load the rule that governs brainstorming. From the project root, run `slasher/system/foundation/load-rules.sh brainstorming-records-points-as-they-are-said-and-organizes-them-at-the-end`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Read the first word typed as the subcommand. **Nothing typed, or `begin`**: begin brainstorming. **`end`**, **`suspend`**, or **`resume`**: do what the rule says of it. **A kind**, `idea`, `work`, `plan`, `design`, `aspiration`, `goal`, `note`, `mistake`, or `problem`: begin brainstorming into a new item of that kind, as the rule says.
4. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface, in these groups, then again within the group selected:
   - **Brainstorm:** `begin`, `end`, `suspend`, `resume`
   - **Brainstorm into an item:** a kind, asked next in three groups: `idea`, `aspiration`, `goal`; `work`, `plan`, `design`; `note`, `mistake`, `problem`
   - **Help:** `help`
