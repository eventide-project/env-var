# `waytide/local/migration/` — execution plans for transitions of content between repository boundaries

`waytide/local/migration/` holds **migration records**: the execution plans for moving content
**across a repository boundary**, and the record of how the move actually went. Content leaving
this repository for another, or arriving from one, is planned and recorded here.

- **When to use:** content is to cross out of this repository or into it — a library extracted
  into its own repository, a body of work moved to a project that will own it, one repository
  split into several or several merged into one, or existing conventions migrated into an
  installed system. If the content ends up under a different repository's root, it belongs here.
- **What distinguishes it from a plan.** A `waytide/local/plans/` plan sequences a build
  **inside** this repository, against a design this repository settled. A migration plan
  sequences work that **crosses out of it**: the increments land in two repositories, the
  order matters because content is unavailable or duplicated in between, and the plan is not
  finished when this repository's part is done.
- **The record stays after the content has gone.** This is the reason the directory is separate
  and the reason a migration record is not deleted on completion. When content leaves, the trail
  of **where it went and why** leaves with it unless something here holds that trail. A reader
  asking what became of something finds the answer in the repository they are already in, rather
  than having to know which repository to look in next.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, then prose. State the
  **source and destination repositories** outright, the **increments in order**, and what is
  true in between — what is duplicated, what is unavailable, and what is authoritative while the
  move is under way. Record what actually happened against the plan as the work proceeds.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every
  working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Naming:** the filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
  **Records written before this convention reached a project keep the names they were given** —
  a datetime is not revised to a resolution it never had, per the
  a-time-value-carries-minutes-and-seconds rule.

**Why:** a transition across a repository boundary is the operation most likely to lose content
and least likely to be recoverable when it does. It is ordered — content has to arrive before it
can be depended on, and stop being authoritative in one place before it becomes authoritative in
another — and the state in between is a state no single repository fully describes. Planning it
in the repository the content is leaving puts the plan where the content still is, and keeping
the record afterward leaves a trail from the place a reader will look first. Without a named
home, such a plan goes into `plans/` where it reads as ordinary build work, or into a chat where
it does not survive the session.

**How to apply:** before moving content across a repository boundary, write a record here naming
the source and destination, the increments in order, and what is true while the move is under
way; record what happened against it as the work proceeds; and **keep the record** once the
content has gone. Do not use `waytide/local/plans/` for a move that crosses out of the
repository, and do not delete a migration record on completion. Related: the plans-convention
(the plan that sequences work *within* this repository), the design-convention (a migration may
realize a design, or may be mechanical enough to need none), the file-names rule (the filename
prefix), and the working-state-artifacts-carry-a-provenance-footer rule.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 8:13:27 PM PT
