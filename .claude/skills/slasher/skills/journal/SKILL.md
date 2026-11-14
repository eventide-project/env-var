---
name: journal
description: Write a journal entry, in the project journal or the private one, list the entries, or read or publish the private journal.
argument-hint: "[new | entry | private | read private | list [<timespan>] | publish-private | help]"
disable-model-invocation: true
---

The engineer typed `/journal $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. `read private` is one subcommand. The words after it are its arguments.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. **Nothing typed, `new`, or `entry`**: write a project journal entry. Load journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry. The words after `new` or `entry`, where any were typed, are the writer's words for the entry.
5. **`private`**: write a private journal entry. Load private-journal-convention. The words after it are the writer's words for the entry.
6. **`read private`**: read the private journal. Load a-private-journal-is-read-only-on-command.
7. **`list [<timespan>]`**: list the entries by date, all of them or those within the timespan. Load a-timeline-view-lists-every-journal-entry-by-its-datetime.
8. **`publish-private`**: move a private entry to the project journal, after the writer confirms it, as the rule requires. Load private-journal-convention. Where it is not clear which entry is meant, ask which, through the selection interface.
9. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface, in these groups, then again within the group selected:
   - **Write:** `new`, `private`
   - **Read:** `list`, `read private`
   - **Publish:** `publish-private`
   - **Help:** `help`
