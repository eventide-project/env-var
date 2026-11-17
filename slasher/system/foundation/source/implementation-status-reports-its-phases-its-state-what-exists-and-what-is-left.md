# Implementation status reports its phases, its state, what exists, and what is left

**Trigger:** When the engineer types `/feature status` or `/experiment status`, or asks for the status of a feature or an experiment

**`/feature status` and `/experiment status` report the status of one implementation.** A bare `/feature status` reports on the feature the conversation is on. Where that is not clear, it reports on the one feature whose `**State:**` line reads Active. Where no feature is Active, or more than one is, ask which feature is meant, through the selection interface, each Active feature an option where there are any. `/experiment status` does the same for an experiment.

**As the engineer stated it:** Add the "status" subcommand to implementations

**`/feature status <feature>` reports on the feature the identifier names**, and `/experiment status <experiment>` on the experiment. An identifier is any of three forms:

- **a number**, the ordinal of a row in the last list of features or experiments printed in the session, as `/feature status 2`
- **a datetime prefix**, the record's ISO-8601-UTC filename prefix, as `/feature status 2026-10-02T14-10-05Z`
- **words from the title**, which match the title of one record of the kind, as `/feature status cart payment`

**Where the identifier names no record of the kind, say so, and report nothing.** Where words match more than one record's title, ask which, through the selection interface, each match an option. Where a number is given and no list of the kind was printed in the session, say so, and report nothing.

**Name the implementation before the report**, by its record's title, so the engineer can see which one the identifier named.

**The report gives the phases, then the state, what exists, and what is left.** The phases are what the a-phase-starts-by-stating-its-goal rule prints for a status: the phases in the record's order, the current one emphasized, and the current phase's goal. Without phases, give the question or intent. Then each of the rest is a short list item:

- **State:** the word on its `**State:**` line.
- **What exists:** each thing the implementation's question or intent asks for that now exists on its branch, such as a command, a rule, or a file.
- **What is left:** each thing it asks for that does not exist yet, and any decision it waits on.

**Read the record, its branch, and the work when the command is typed, never from memory.**

**The report changes nothing.** It writes no record, changes no state, and offers no state change. Concluding the implementation is the engineer's to ask for.

**Why:** `/item status` reports where an item stands. A feature or an experiment is asked about the same way, and its phases are part of where it stands.

**How to apply:** on `/feature status` or `/experiment status`, find the record from the identifier, or the one the conversation is on, or the one Active record of the kind. Name it, give its phases or its question or intent, then its state, what exists, and what is left.

Related:

- the item-status-reports-an-items-state-what-exists-and-what-is-left rule — the same report for an item
- the a-phase-starts-by-stating-its-goal rule — the phases the report opens with
- the the-implementations-directory-holds-one-record-per-implementation rule — an implementation's record and its states
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the lists whose numbers an identifier may name

---

Authored by Scott Bellware on Mon Nov 16 2026 at 2:23:56 PM PT
