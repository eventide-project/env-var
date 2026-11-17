# Item status reports an item's state, what exists, and what is left

**Trigger:** When the engineer types `/item status`, or asks for the status of an item

**`/item status` reports the status of one item.** A bare `/item status` reports on the current item, which is the one item whose `**State:**` line reads Active. Where no item is Active, or more than one is, ask which item is meant, through the selection interface, each Active item an option where there are any.

**As the engineer stated it:** A "status" subcommand for item. Bare, it gives the status of the current item. Otherwise, it receives an item identifier.

**`/item status <item>` reports on the item the identifier names.** An identifier is any of three forms:

- **a number**, the ordinal of a row in the last list of items printed in the session, as `/item status 6`
- **a datetime prefix**, the item's ISO-8601-UTC filename prefix, as `/item status 2026-10-02T14-10-05Z`
- **words from the title**, which match the title of one item, as `/item status cart payment`

**Where the identifier names no item, say so, and report nothing.** Where words match more than one item's title, ask which, through the selection interface, each match an option. Where a number is given and no list of items was printed in the session, say so, and report nothing.

**Name the item before the report**, by its title, so the engineer can see which item the identifier named. This matters most for a number, which the engineer typed from a list that may have changed.

**The report gives the item's state, what of it exists, and what is left.** Each is a short list item, under the a-response-is-clarified-twice-before-it-is-sent rule and the an-answer-is-a-list-and-prose-must-justify-itself rule:

- **State:** the word on its `**State:**` line.
- **What exists:** each thing the item asks for that now exists, such as a command, a rule, or a file.
- **What is left:** each thing the item asks for that does not exist yet, and any decision it waits on.

**Read the item and the work when the command is typed, never from memory.** The item's content is point-in-time. What exists is read from the project as it now stands.

**The report changes nothing.** It writes no record, changes no state, and offers no state change. Concluding the item is the engineer's to ask for.

**Why:** the engineer often asks where one item stands, as *#6 status*. One subcommand answers it the same way each time: which item, its state, what exists, and what is left.

**How to apply:** on `/item status`, find the item from the identifier, or the one Active item where none was given. Name it, then give its state, what exists, and what is left, each as a short list item.

Related:

- the the-items-directory-holds-one-file-per-item rule — an item's states
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the list whose numbers an identifier may name
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Mon Nov 16 2026 at 1:36:24 PM PT
