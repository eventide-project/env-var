# Copy-last-line copies the last line of the previous reply

**Trigger:** When the engineer types `/copy-last-line` or `/cll`, or asks for the last line of the output to be copied

**`/copy-last-line` copies the last line of the agent's previous reply to the clipboard.** `/cll` is its shortcut alias. The last line is the last line that is not blank, as it was written, with its markdown left as it is, except that a line that is wholly a path in backticks, alone or as a list item, is copied as the bare path, without the dash and the backticks. Where that reply ended with a record's path, as the a-reply-that-writes-a-record-ends-with-the-records-path rule has it, the path is what is copied.

**As the engineer stated it:** Add a "/copy-last-line" command that copies the last line of output to the clipboard

**As the engineer later stated it:** Give the "/copy-last-line" command the alias "/cll"

**As the engineer later stated it:** Proceed with both of those changes, of a record's path written in backticks, and copied without them

**Copy it with the platform's clipboard command:** `pbcopy` on macOS, and `wl-copy` or `xclip -selection clipboard` on Linux. Copy the line without a trailing newline. Where no clipboard command is found, say so, and print the line so the engineer can copy it by hand.

**Then say what was copied, in one line, with the line itself.** Do not copy anything else, and do not copy the reply that reports the copy.

**Where there is no previous reply, say so, and copy nothing.**

**Why:** Claude Code's `/copy` copies the whole of the last reply. A record's path, or one command, is usually the line the engineer wants, and it sits on the last line by design.

**How to apply:** on `/copy-last-line` or `/cll`, take the last line that is not blank from the previous reply, drop the list item's dash and the backticks where the line is a path in backticks, copy it with the clipboard command without a trailing newline, and report it in one line.

## History

Until Fri Nov 13 2026 only a line wholly in backticks was copied without them, and a list item was copied with its dash.

Until Fri Nov 13 2026 a line wholly in backticks was copied with its backticks.

Until Fri Nov 13 2026 `/copy-last-line` had no shortcut alias.

Related:

- the a-reply-that-writes-a-record-ends-with-the-records-path rule — why a record's path is the last line

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:57:57 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:00:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:01:18 PM PT
