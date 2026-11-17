---
name: records
description: Print every record the previous reply wrote.
argument-hint: "[show | help]"
disable-model-invocation: true
---

The engineer typed `/records $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. **Nothing typed, or `show`**: load the rule that governs the records line. From the project root, run `slasher/system/foundation/load-rules.sh a-reply-that-writes-a-record-ends-with-the-records-path`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, for `/records show`.
3. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: `show` or `help`.
