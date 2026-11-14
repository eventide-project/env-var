# A reply that writes a record ends with the record's path

**A reply in which the agent wrote a record ends with a list of the records it wrote, under the heading *Recorded in:*, one full path to a list item, in backticks.** A record is an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or any other record the agent writes to disk. The path is the absolute path of the file as it now stands, with its state suffix where it has one. Where the path is under the home folder, it starts with `~/` in place of the home folder, as `~/projects/checkout/slasher/local/items/…`.

**As the engineer stated it:** After any record is written to disk, eg: item, implementation, rule, log, journal, etc, print the written file path and name to the screen. It should be the last line printed so that the user can /copy it to their clipboard, or open it in their editor.

**As the engineer later stated it:** If the folder printed is the home folder, use the "~/" shortcut in the output

**As the engineer later stated it:** Can the list of written records have each record in blue the way the agent often outputs filepaths? Proceed with both of those changes

**As the engineer later stated it:** Write each filepath line as a "-" bullet list item, and print the heading "Recorded in:" above the list

**The list opens with the line *Recorded in:*, and each path is a list item of its own, written `- ` and then the path in backticks.** The backticks make the terminal show the path in color, as a file path is usually shown. Nothing else goes on the line: no label, and no sentence. `/copy-last-line` copies the path without the dash and the backticks.

**Where the reply wrote several records, each path takes a list item of its own.** The record the reply is about comes last. Its log entries, and any other record written beside it, come before it. A record changed by a rename is listed by its new path.

**A record the agent did not write is not listed.** A log entry a hook writes, such as the one for a decision put through the selection interface, is the hook's.

**A record written in a worktree is listed by the worktree's path**, since that is where the file is until the work merges.

**A reply that wrote no record ends as it otherwise would.**

**Why:** the engineer often wants to open the record just written, or to pass its path on. A path printed somewhere in the middle of a reply, or a name without its directory, has to be found and completed by hand. A full path on the last line is copied or opened at once.

**How to apply:** before sending a reply, check whether it wrote a record. Where it did, end the reply with each record's full path on its own line, the record the reply is about last.

## Compressed

1. Before sending a reply, check whether it wrote a record. Where it did, end the reply with the line *Recorded in:*, then a list of each record's full, absolute path, as the file now stands. The path carries the state suffix where the record has one. Under the home folder, write `~/` in place of the home folder.
2. A record is an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or any other record the agent writes to disk.
3. Write each path as a list item, `- ` and then the path in backticks, so the terminal shows it in color. Put nothing else on the line: no label, and no sentence.
4. Where the reply wrote several records, give each path its own list item. Put the record the reply is about last, after its log entries and any other record written beside it. List a renamed record by its new path.
5. Do not list a record the agent did not write, such as a log entry a hook writes.
6. List a record written in a worktree by the worktree's path.
7. A reply that wrote no record ends as it otherwise would.

## Compression

- 2026-11-13, compressed: checked by one fresh agent that listed the directives before reading the compressed text: 12 directives, 9 kept, 2 less precise, 1 lost, 2 repairs, not re-checked
- 2026-11-13, revised: a path under the home folder starts with `~/`, a change the engineer stated; not re-checked
- 2026-11-13, revised: the path is written in backticks, so the terminal shows it in color, a change the engineer directed; not re-checked
- 2026-11-13, revised: the paths are a list under the heading *Recorded in:*, a change the engineer directed; not re-checked

## History

Until Fri Nov 13 2026 each path stood on a line of its own, with no heading and no bullet.

Until Fri Nov 13 2026 the path was written with no backticks around it.

Until Fri Nov 13 2026 a path under the home folder was printed with the home folder written out.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the log entries a reply writes
- the a-process-question-and-its-answer-are-logged rule — the log entries a hook writes, which are not listed

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:58:00 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:53:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:00:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:01:18 PM PT
