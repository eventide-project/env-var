# A reply that writes a record ends with the record's path

**A reply in which the agent wrote a record ends with the path of its principal record, under the heading *Record:*, in backticks.** The principal record is the record the reply's operation is about: the item, where the operation acts on an item, the implementation record, where it acts on a feature or an experiment, the rule, where it changes a rule, and so on. The other records the reply wrote, such as its log entries, are printed only on `/records show`. A record is an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or any other record the agent writes to disk. The path is the file's path from the project root, as it now stands, as `slasher/local/items/…`. A path from the project root is short enough that it seldom wraps. `/record copy` copies the absolute path.

**As the engineer stated it:** After any record is written to disk, eg: item, implementation, rule, log, journal, etc, print the written file path and name to the screen. It should be the last line printed so that the user can /copy it to their clipboard, or open it in their editor.

**As the engineer later stated it:** If the folder printed is the home folder, use the "~/" shortcut in the output

**As the engineer later stated it:** Can the list of written records have each record in blue the way the agent often outputs filepaths? Proceed with both of those changes

**As the engineer later stated it:** Write each filepath line as a "-" bullet list item, and print the heading "Recorded in:" above the list

**As the engineer later stated it:** Change "Recorded in:" to "Records:"

**As the engineer later stated it:** When a single record is printed, the heading should be "Record:" instead of "Records:". Don't print the bullet character, but do indent the line as if the bullet is printed.

**As the engineer later stated it:** the whole filepath should continue to be indented as if it were a bullet. That means a soft break across a line starts the new line with the same level of indentation

**As the engineer later stated it:** The blockquote isn't right. Then, of printing each path from the project root so it seldom wraps: Let's try option #5

**As the engineer later stated it:** Don't put a blank line between the "Record:" heading and the record filepath

**One record is printed under the heading *Record:*, on a line of its own, indented two spaces where a list item's dash would stand, then the path in backticks, with no dash.** The indent is two non-breaking spaces, since the terminal's markdown drops ordinary leading spaces. No blank line stands between the heading and the path: the heading line ends with a backslash, a hard line break, so the path starts the next line. A path that wraps starts its next line at the left edge, which the short path makes rare. **Two or more are printed under the heading *Records:*, each path a list item of its own, written `- ` and then the path in backticks.** The backticks make the terminal show the path in color, as a file path is usually shown. Nothing else goes on the line: no label, and no sentence. `/record copy` copies the principal record's path without the dash and the backticks.

**As the engineer later stated it:** Instead of proactively printing out the filepaths of the records written after an operation, only print them if the records command is issued. However, the principal record should always be printed. The principal record is the one that is the subject of the operation, ie: an item is written if the operation operates on an item, etc.

**Where the operation is about more than one record, each is a principal record, and each path takes a list item of its own**, as where two items are merged into a new one that supersedes both. A record changed by a rename is listed by its new path. Where the reply wrote records and none is the subject of its operation, as when it wrote only log entries a decision left, the reply ends with no records line.

**A record the agent did not write is not listed.** A log entry a hook writes, such as the one for a decision put through the selection interface, is the hook's.

**A record written in a worktree is listed by its path from the project root through the worktree**, as `../checkout-feature-worktree-receipt/slasher/local/…`, since that is where the file is until the work merges.

**A reply that wrote no record ends as it otherwise would.**

**`/records show` prints every record the previous reply wrote**, under the same heading, *Record:* or *Records:*, in the same form, the principal record last, after its log entries and any other record written beside it. A bare `/records` does the same. Each path is the file as it now stands, so a record renamed since is listed by its new path. Where the previous reply wrote no record, say so, and print no list. `/records show` writes nothing, so its own reply carries no records line.

**As the engineer stated it:** "/records" command. It shows the records line. The base command is "/records show"

**Why:** the engineer often wants to open the record just written, or to pass its path on. A path printed somewhere in the middle of a reply, or a name without its directory, has to be found and completed by hand. A full path on the last line is copied or opened at once.

**How to apply:** before sending a reply, check whether it wrote a record. Where it did, end the reply with the full path of its principal record. Print the other records it wrote only when the engineer types `/records show`.

## Compressed

1. Before sending a reply, check whether it wrote a record. Where it did, end the reply with the line *Record:*, then the path of its principal record from the project root, as the file now stands. The principal record is the record the reply's operation is about, such as the item an operation acts on. Print no other record the reply wrote. Write a printed path in the home folder with the `~/` shortcut. `/record copy` copies the absolute path alone, with no dash or backticks.
2. A record is an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or any other record the agent writes to disk.
3. Write one record under *Record:*, indented two non-breaking spaces, with no dash, then the path in backticks. End the heading line with a backslash, so no blank line stands between it and the path. Write two or more under *Records:*, each a list item, `- ` and then the path in backticks. The backticks make the terminal show the path in color. Put nothing else on the line: no label, and no sentence.
4. Where the operation is about more than one record, list each, each path its own list item. List a renamed record by its new path. Where no record written is the subject of the operation, print no records line.
5. Do not list a record the agent did not write, such as a log entry a hook writes.
6. List a record written in a worktree by its path from the project root through the worktree.
7. A reply that wrote no record ends as it otherwise would.
8. `/records show`, or a bare `/records`, prints every record the previous reply wrote, in the same form, each path as the file now stands, the principal record last, after its log entries and any other record written beside it. Where the previous reply wrote no record, say so, and print no list. Its own reply carries no records line.

## Compression

- 2026-11-13, compressed: checked by one fresh agent that listed the directives before reading the compressed text: 12 directives, 9 kept, 2 less precise, 1 lost, 2 repairs, not re-checked
- 2026-11-13, revised: a path under the home folder starts with `~/`, a change the engineer stated; not re-checked
- 2026-11-13, revised: the path is written in backticks, so the terminal shows it in color, a change the engineer directed; not re-checked
- 2026-11-13, revised: the paths are a list under the heading *Recorded in:*, a change the engineer directed; not re-checked
- 2026-11-15, revised: `/records show` prints the previous reply's records line again, as point 8; not re-checked
- 2026-11-15, revised: a reply ends with its principal record alone, and `/records show` prints every record it wrote, as points 1, 4, and 8, a change the engineer stated; not re-checked
- 2026-11-15, revised: the heading reads *Records:*, a change the engineer stated; not re-checked
- 2026-11-15, revised: `/copy-record` replaces `/copy-last-line`, a body sentence only; not re-checked
- 2026-11-15, revised: one record is printed under *Record:*, indented, with no dash, as points 1 and 3, a change the engineer stated; not re-checked
- 2026-11-15, revised: one record is printed as a blockquote, so a wrapped path keeps its indent, as point 3, the form the engineer selected; not re-checked
- 2026-11-15, revised: each path is printed from the project root, and one record is indented with no dash, as points 1, 3, and 6, the option the engineer selected; not re-checked
- 2026-11-15, revised: no blank line stands between *Record:* and the path, as point 3, a change the engineer stated; not re-checked
- 2026-11-15, revised: `/record copy` replaces `/copy-record`; not re-checked
- 2026-11-16, revised: the path carries no state suffix, since a file name carries no state, which the engineer settled; checked: 23 directives, 21 kept, 1 less precise, 1 lost, 2 repairs: the `~/` shortcut for a path in the home folder, and a copied path with no dash or backticks; re-checked: 23 directives, 23 kept, 0 less precise, 0 lost

## History

Until Mon Nov 16 2026 the path carried the record's state suffix where it had one.

Until Sun Nov 15 2026 each path was the absolute path, with `~/` in place of the home folder. For part of that day one record was printed as a blockquote.

On Sun Nov 15 2026, for part of the day, one record was printed indented two spaces with no dash, and a path that wrapped started its next line at the left edge.

Until Sun Nov 15 2026 one record was printed under *Records:*, as a list item with a dash, as two or more are.

Until Sun Nov 15 2026 the heading read *Recorded in:*.

Until Sun Nov 15 2026 a reply ended with every record it wrote, the record it was about last, and `/records show` printed that list again.

Until Sun Nov 15 2026 the records line could not be printed again.

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
Changed by Scott Bellware on Sat Nov 14 2026 at 7:45:26 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 7:52:17 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 7:56:47 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:12:57 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:18:07 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:21:27 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:25:58 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:27:34 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:51:48 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 6:36:15 PM PT
