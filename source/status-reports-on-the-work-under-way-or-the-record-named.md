# Status reports on the work under way, or on the record named

**Trigger:** When the engineer types `/status`, or asks for the status of the work under way

**`/status` reports the status of one item, feature, or experiment.** It finds the record, then reports on it as the command of its kind does: an item as `/item status` does, a feature as `/feature status` does, and an experiment as `/experiment status` does. It is in the PROCESS command domain, so `/status help` says that the command takes no `help`, and names `/process help`.

**As the engineer stated it:** Add a root "/status" command

**A bare `/status` reports on the work under way.** That is the feature or experiment the conversation is on. Where the conversation is on none, it is the one implementation whose `**State:**` line reads Active, and where none is Active, the one Active item. Where more than one record is a candidate at the step that decides, ask which, through the selection interface, each candidate an option. Where no record is a candidate, say that no work is under way, and report nothing.

**`/status <record>` reports on the record the identifier names.** An identifier is any of three forms:

- **a number**, the ordinal of a row in the last list of items, features, or experiments printed in the session, as `/status 3`
- **a datetime prefix**, the record's ISO-8601-UTC filename prefix, looked for among the items and the implementations, as `/status 2026-10-02T14-10-05Z`
- **words from the title**, which match the title of one item or implementation, as `/status cart payment`

**Where the identifier names no record, say so, and report nothing.** Where words match more than one record's title, ask which, through the selection interface, each match an option. Where a number is given and no list of records was printed in the session, say so, and report nothing.

**The report changes nothing.** It writes no record, changes no state, and offers no state change.

**Why:** the engineer asks *where does this stand?* without stopping to name the kind of record. One root command finds the work under way, or the record named, and gives the report its kind gives.

**How to apply:** on `/status`, find the record from the identifier, or the work under way where none was given. Then report on it under the item-status-reports-an-items-state-what-exists-and-what-is-left rule for an item, or the implementation-status-reports-its-phases-its-state-what-exists-and-what-is-left rule for a feature or an experiment.

Related:

- the item-status-reports-an-items-state-what-exists-and-what-is-left rule — the report for an item
- the implementation-status-reports-its-phases-its-state-what-exists-and-what-is-left rule — the report for a feature or an experiment
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read, and why it takes no `help`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 2:26:06 PM PT
