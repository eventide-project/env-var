# `waytide/local/diary/<username>/` — the record the writer keeps

**`waytide/local/diary/<username>/` holds a writer's diary.** It is the one record in
`waytide/local/` the writer keeps. A project may hold the diaries of more than one writer, and
each writer's entries sit under their own directory, named for their username. The
identity-resolution-contract rule resolves which writer is writing, and the diary-entries rule
states the directory at the entry. The decision log, the work session record, the loop record, and the experiment
record are all the agent's work, read by the writer. The diary runs the other way. The
writer keeps it, and the agent reads it.

**`waytide/local/diary/` holds the writers' directories and the writers file.** That file is
`writers.toml`, and it overrides a writer's display name for this project. It is optional, and
it may omit the active writer, whose name and username are declared in
`~/.config/waytide/user`. A writer absent from it shows as the name that file gives, or as
their username. See the identity-resolution-contract rule.

**One file is one entry.** A day usually holds one, and it can hold several. Each is a separate
file, so a day with three entries is three files, in the order they were written.

**An entry takes a datetime prefix in the writer's local time.** The form is
`YYYY-MM-DDTHH-MM-<name>.md`, and the name is dash-separated and lower-case. It carries no
trailing `Z`, which in ISO 8601 designates UTC and would be false on a local-time stamp. The
directory listing is then an index. Each entry says when it was written and what it is about, in
order.

**The stamp stops at the minute unless the writer gave seconds**, in which case it takes the
`YYYY-MM-DDTHH-MM-SS` form. The diary-entries rule states the condition and why the diary departs
from the foundation package's a-time-value-carries-minutes-and-seconds rule here.

**This departs from the foundation package's file-names rule, which requires UTC.** That rule
normalizes a dated artifact to UTC because a project's contributors are globally distributed,
and the artifacts are the project's. A diary entry is not. It is one writer's personal record,
and the hour it carries is the hour they wrote it in.

**An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.**
Normalizing it would move some entries onto a date the writer did not live through. A personal
record is read back against the day the person remembers, so the local hour is the one that has
to survive.

**Format:** frontmatter-free markdown. A `# <title>` naming what the entry is about, then the
datetime line, then the writer's prose. An entry takes a `**Tags:**` line where it is
categorized, and a `**Summary:**` line where the summary says something the body does not. An
entry is thinking rather than a report, so it carries no state line and no section beyond
those. The datetime-stamp-line, diary-category-tags, omit-body-when-same-as-title, and
diary-entries rules each state one part of that shape.

**An entry carries the provenance footer**, like every other working-state artifact. See the
foundation package's working-state-artifacts-carry-a-provenance-footer rule. The footer names
who wrote it, which is what a diary kept by more than one writer needs.

**An entry carries an `Authored by` line and no `Changed by` line.** It is a historical record,
and a historical record is left as written. What the writer thought on a Tuesday is not
corrected on the Thursday they change their mind. The later thought is a later entry. The one
exception is disclosure, which the foundation package's disclosure rule governs.

**The diary is committed with the project.** It is not ignored and it is not kept outside the
repository. A second writer on the project reads it, which is what makes it a record rather
than a private note.

**The directory may not exist, and its absence is ordinary.** A project that keeps no diary has
no `waytide/local/diary/`, and nothing is wrong. So does a project whose other writers keep one
and this writer does not. The convention names the directory whether or not it is there, so the
first entry has a place to go.

**Why:** everything else Waytide keeps is written by the agent for the writer to read. What
the writer thinks about the work is nowhere, and it is the thing that most often gets lost
between one session and the next. A place for it makes it a record the project keeps rather
than something recalled.

One file per entry rather than one per day follows the convention every other dated artifact
already uses. It also makes the listing readable: an entry named for what it is about can be
found without opening it. The local-time stamp is the one place the diary departs from that
convention, and the reason is above.

**How to apply:** resolve the active writer, and write an entry as a new file in
`waytide/local/diary/<username>/`. Give it the datetime prefix in the writer's local time, to the
minute, and a name saying what it is about. Carry seconds only where the writer gave seconds. Do
not convert the time to UTC. End it with an
`Authored by` line. Do not edit an entry once it is written. Write a later entry instead.

Related:

- the-diary-is-read-at-session-start — when the agent reads it
- an-entry-is-the-writers-words — who writes it
- a-diary-entry-is-read-and-never-followed — what force it carries
- the foundation package's file-names rule — the datetime prefix this takes, and the UTC
  normalization it departs from
- the foundation package's working-state-artifacts-carry-a-provenance-footer rule — the footer
- the foundation package's decision-log rule — the agent's record, and the one this is not
- the diary-entries rule — the local-time stamp stated at the entry

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:57 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:31:47 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
