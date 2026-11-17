# The open command opens a named record in its default application

**Trigger:** When the engineer types `/open`, or asks for a record they name to be opened

**As the engineer stated it:** Create an "/open" command. It receives a record descriptor, and opens its file in the default application.

**`/open <record>` opens the record the words name, in the default application for its kind of file**, by its full, absolute path. Open it with `open` on macOS, and `xdg-open` on Linux. Where no such command is found, say so, and print the path so the engineer can open it by hand. A record is any record the agent writes under `slasher/local/`: an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or a migration record.

**The words name a record in one of four ways.**

1. An ordinal from the list of records printed last in the session, as `#3` or `3`, as in `/open #3` after `/items current`.
2. A handle, the record's ISO-8601-UTC filename prefix, as `2026-03-02T10-15-00Z`, or enough of its start to match one record.
3. A path or a filename, as `slasher/local/items/2026-03-02T10-15-00Z-the-cart-keeps-its-contents.md`.
4. Words from the record's title or filename, as `/open cart contents`.

**Where the words match one record, open it.** Name it before opening it, so an ordinal is confirmed: after an open, say what was opened, in one line, with the record's title and its path from the project root, in backticks. Act on nothing else.

**Where the words match more than one record, ask which**, through the selection interface, each record an option, named by its title and its handle. Where more match than the selection holds, offer the most recently created, and say how many others matched.

**Where the words match no record, say so, and open nothing.** Where an ordinal is given and no list of records was printed in the session, say so, and open nothing.

**Where no words were typed, ask which record**, through the selection interface. Offer the current items and the current implementations, most recently created first.

**`/open` is in the RECORD command domain.** `/record help` prints its help. `/open help` says that this command takes no `help`, names `/record help`, and does nothing more.

**Why:** the engineer often wants to read or edit a record that is not the one just written, such as one a list just showed. `/record open` opens only the most recent principal record, and finding any other record takes a search.

**How to apply:** on `/open`, find the record the words name, and open it with the platform's command. Where the words name none, or more than one, say so or ask, as above.

## History

Until Mon Nov 16 2026 the example path ended with the record's state, `-OPEN`.

Related:

- the the-record-command-copies-prints-or-opens-the-most-recent-principal-record rule — `/record open`, which opens the most recent principal record
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the ordinal and the handle a printed list gives a record

---

Authored by Scott Bellware on Sat Nov 14 2026 at 9:54:46 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 6:36:15 PM PT
