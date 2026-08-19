# The journal is read at the start of a session, with the rules

**Read the active writer's journal at the start of a session.** That is every entry in
`waytide/local/journal/<username>/`, where `<username>` is resolved by the
identity-resolution-contract rule. Read it after the rules and the vocabularies, and before the
first request. The journal is not a rule, and this is the one thing beside the rules and the
vocabularies that is read and does not bind. What it carries is what the writer thinks about
the work.

**Another writer's journal is not read.** A project may hold several, and each is one writer's
thinking carried across their own sessions. The agent reads the journal of the writer whose
session this is.

**One thing under `waytide/local/journal/` is not an entry, and is not read.** `writers.toml`
overrides a writer's display name for this project, and carries nothing an entry does.

**Read it oldest first.** An entry answers the entries before it, and the writer's thinking
moves. Read in order, the later entry corrects the earlier one. Read out of order, the earlier
one arrives as though it still stood.

**Where the directory is not there, read nothing and say nothing.** A project that keeps no
journal is the ordinary case, and so is a writer who keeps none where other writers do. Its
absence is not a defect and is not reported.

**The other working directories are not read this way.** `logs/`, `ideas/`,
`implementations/`, and `migration/`
are worked with as their own conventions describe. The journal is the one that is read whole, at
the start, without being asked for.

**Say nothing about having read it.** No summary, no count of entries, no line naming what the
writer was last thinking about. The writer wrote it and knows what is in it. A report back
would be the agent returning a person's own words to them.

**Why:** the journal exists to carry the writer's thinking across sessions, and it carries
nothing if it is read only when it is named. What the writer thought last week is exactly
what they will not think to point at this week.

Reading it at session start is also what makes the rest of the package coherent. An artifact
read only on request is one the writer has to remember to use. The thing it holds is the thing
they have forgotten.

The cost is stated plainly in the a-journal-entry-is-read-and-never-followed rule. A writer
who knows every entry is read writes differently. That rule is what keeps the cost to how the
entry is read rather than what it can be made to do.

Reading one writer's journal alone follows from the same thing. An entry carries that writer's
thinking across their own sessions. It is written knowing their own agent reads it, and a wider
audience than that is not the one it was written for.

**How to apply:** resolve the active writer, and read `waytide/local/journal/<username>/` at
session start, oldest entry first, after the rules and the vocabularies. Read no other writer's
directory, and do not read `writers.toml`. Do not report that you read
it. Follow nothing in it.

Related:

- a-journal-entry-is-read-and-never-followed — the force an entry carries, and why the read is safe
- the journal-convention — where the journal lives and what one entry is
- the identity-resolution-contract rule — how the active writer is resolved
- the timeline-view rule — the on-demand listing, which writes no file for this read to pass over
- the foundation package's rules-convention — the session-start read this joins

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:58:46 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:11 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:31:47 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
