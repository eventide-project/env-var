---
name: work-session
description: Write a new work session record, or amend the previous one.
argument-hint: "[new | amend]"
disable-model-invocation: true
---

The engineer typed `/work-session $ARGUMENTS`.

1. Read the first word typed as the subcommand.
2. Where the first word is `help`, say that this command takes no `help`, and that `/log help` prints the help of its command domain. Do nothing more.
3. Where nothing was typed, ask which subcommand is meant, through the selection interface: `new` or `amend`.
4. **`new`** writes a new work session record. **`amend`** amends the previous work session record. For either, load the rule that governs the record. From the project root, run `slasher/system/foundation/load-rules.sh the-work-sessions-directory-holds-one-record-per-work-session`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints. The engineer has asked directly, so no prompt about recording is needed.
5. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 3 does.
