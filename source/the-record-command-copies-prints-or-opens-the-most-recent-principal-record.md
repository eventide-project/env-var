# The record command copies, prints, or opens the most recent principal record

**Trigger:** When the engineer types `/record`, or asks for the record just written to be copied, printed, or opened

**`/record` acts on the most recent principal record: that of the latest reply that had one, however many replies have passed since.** A reply that wrote no record, such as a `/records show` or a `/record print`, leaves it as it was. The principal record is the record a reply's operation was about, the one its records line gives, as the a-reply-that-writes-a-record-ends-with-the-records-path rule has it. `/record copy` copies its path, `/record print` prints its contents, and `/record open` opens it. A bare `/record` prints its path.

**As the engineer stated it:** Add a "/copy-last-line" command that copies the last line of output to the clipboard

**As the engineer later stated it:** Give the "/copy-last-line" command the alias "/cll"

**As the engineer later stated it:** Proceed with both of those changes, of a record's path written in backticks, and copied without them

**As the engineer later stated it:** Change "/copy-last-line" to "/copy-record". Remove the "/cll" command.

**As the engineer later stated it:** Create a "/open-record" command that opens the last record with the registered application

**As the engineer later stated it:** Consolidate "/copy-record" and "/open-record" in a "/record" command, with the subcommands "copy", "print", and "open"

**As the engineer later stated it:** The "/record" command should work on the most recent principal record, even if the previous reply wrote no record

**As the engineer later stated it:** A bare "/record" command prints the filepath of the most recent principal record

**A bare `/record` prints the record's path from the project root**, as the file now stands, in backticks, as a records line gives it. Print nothing else.

**`/record copy` copies the record's full, absolute path to the clipboard**, as the file now stands, with no dash and no backticks. Copy it with the platform's clipboard command: `pbcopy` on macOS, and `wl-copy` or `xclip -selection clipboard` on Linux. Copy the path without a trailing newline. Where no clipboard command is found, say so, and print the path so the engineer can copy it by hand.

**`/record print` prints the record's contents in the chat**, as the file now stands, under a line naming its path from the project root. Print the contents as they are, with nothing added and nothing left out.

**`/record open` opens the record in the default application for its kind of file**, by its full, absolute path. Open it with `open` on macOS, and `xdg-open` on Linux. Where no such command is found, say so, and print the path so the engineer can open it by hand.

**After a copy or an open, say what was copied or opened, in one line, with the record's path.** Act on nothing else.

**Where that reply had more than one principal record, ask which**, through the selection interface, each path an option.

**Where no reply in the session has had a principal record, say so, and act on nothing.**

**Why:** the engineer often wants to pass on, read, or edit the record just written. Claude Code's `/copy` copies the whole of the last reply, and finding a file to read or open it takes a search. One command acting on the principal record saves both.

**How to apply:** on `/record`, take the most recent principal record, and print its path, copy its path, print its contents, or open it, as the subcommand says. With no subcommand, print its path.

## History

Until Sat Nov 14 2026 a bare `/record` asked, through the selection interface, whether to copy, print, or open the record.

Until Sat Nov 14 2026 `/record open` was said to open the record in the application the system has registered for its kind of file.

Until Sun Nov 15 2026 this rule was named the-record-command-copies-prints-or-opens-the-previous-replys-principal-record, and `/record` acted only on the previous reply's principal record. Where that reply wrote none, it acted on nothing.

Until Sun Nov 15 2026 this rule was named copy-record-copies-the-previous-replys-principal-record-path, and its command `/copy-record` copied the path alone. The rule open-record-opens-the-previous-replys-principal-record, with its command `/open-record`, opened the record. `/record` took the place of both, and `/record print` was added.

Until Sun Nov 15 2026 the path was copied with `~/` in place of the home folder.

Until Sun Nov 15 2026 this rule was named copy-last-line-copies-the-last-line-of-the-previous-reply. Its command was `/copy-last-line`, with the shortcut alias `/cll`, and it copied the last line of the previous reply that was not blank.

Until Fri Nov 13 2026 only a line wholly in backticks was copied without them, and a list item was copied with its dash.

Until Fri Nov 13 2026 a line wholly in backticks was copied with its backticks.

Until Fri Nov 13 2026 `/copy-last-line` had no shortcut alias.

Related:

- the a-reply-that-writes-a-record-ends-with-the-records-path rule — which record is the principal record, and `/records show`, which prints every record a reply wrote

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:57:57 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:00:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:01:18 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:12:49 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:26:05 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:51:48 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:59:07 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 9:10:14 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 9:23:12 PM PT
