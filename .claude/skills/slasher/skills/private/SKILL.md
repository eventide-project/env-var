---
name: private
description: Record anything given only in the private directory, outside the project's repository, as a document, an item, a log entry, or a journal entry, and read or list what is there.
argument-hint: "[<file path> | item | log | journal | session [<instruction> | end] | read | list | help]"
disable-model-invocation: true
---

The engineer typed `/private $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs private records. From the project root, run `slasher/system/foundation/load-rules.sh anything-given-to-private-is-recorded-only-in-the-private-directory`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. Read the first word typed as the subcommand. The words after it are its arguments.
4. **`item`**, **`log`**, or **`journal`**: write a private record of that kind. The words after it are what it says. Where none were typed, ask what it says.
5. **`read`**: read the private record the words after it name. Where none is named, or the name matches more than one, ask which, through the selection interface.
6. **`session`**: start a private session, and carry out the words after it as the engineer's instruction in it. **`session end`** ends the private session.
7. **`list`**: list the project's private records, of every kind, or of the kind the words after it name.
8. **Nothing typed**: ask what to record, through the selection interface, in these groups, then again within the group selected:
   - **Record:** a file path, `item`, `log`, `journal`, `session`
   - **Read:** `read`, `list`
   - **Help:** `help`
9. **Any other words**: where they are a path to an existing file, record that file. Otherwise, they are not guessed at. Say they are not one of this command's subcommands, and ask which is meant, in the groups above.
