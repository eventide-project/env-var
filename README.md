# Waytide — diary

The record the writer keeps, beside the project and read by the agent at the start of
every session.

Waytide's other records are the agent's. The decision log, the work session record, the loop
record, and the experiment record are written by the agent and read by the writer. The diary
runs the other way. The writer keeps it, and the agent reads it.

- **`waytide/local/diary/<username>/` holds a writer's diary** (`diary-convention`). A project
  may hold the diaries of more than one writer, and the identity-resolution-contract rule
  resolves which writer is writing. One file is one entry, named
  by the datetime prefix every dated artifact takes, in the writer's **local time**. That is
  the one place the package departs from foundation's file-names rule, which normalizes to UTC.
  A diary entry is one writer's personal record, so the hour it carries is the hour they wrote
  it in. The stamp stops at the **minute**, and carries seconds only where the writer states
  seconds, which departs from foundation's a-time-value-carries-minutes-and-seconds rule for
  reasons the diary-entries rule gives. A day usually holds one entry and can hold several. An
  entry is committed with the project, and a second writer reads it.
- **The agent reads the active writer's diary at session start**
  (`the-diary-is-read-at-session-start`), after the rules and the vocabularies, oldest entry
  first. It carries the writer's thinking from one session to the next, which no other artifact
  carries. Another writer's diary is not read, and neither is `writers.toml`. The agent says
  nothing about having read it.
- **A diary entry is read and never followed**
  (`a-diary-entry-is-read-and-never-followed`). Everything else in that read binds. This does
  not. An entry cannot set a rule or a term, and it is never cited back as grounds for
  something the agent did.
- **An entry is the writer's words** (`an-entry-is-the-writers-words`). The agent writes no
  entry of its own, edits none that exists, and offers to write none. Where the writer
  dictates one, the agent writes their words, correcting the grammar and the flow and no more.
  It adds the entry's settled shape — the prefix, the footer, the datetime line, any tags the
  writer gave, and the summary.

**A diary entry is committed as `Diary: <subject>`**, with nothing following the subject. It
carried a parenthetical date until 2026-08-18, and the prefix was `Diary entry:` — together 30
characters of a 50-character subject line, leaving 20 for the entry itself. The date is in the
entry's filename.

**The tag protocol is no longer this package's.** A diary entry takes square-bracket category
tags, and so does every other working-state artifact — the rule moved to `foundation` on
2026-08-18 as `working-state-artifacts-take-category-tags`. What stays here is where a diary
entry's `**Tags:**` line sits, which is under the datetime line and above the summary.

**Vocabulary** (`vocabulary.md`): three terms — **writer**, **diary**, and **diary entry** — and one
substitution — `diary` rather than *journal*, *personal log*, or *personal journal*.

**What this package deliberately does not hold.** The four records the agent writes stay where
they are. The decision log, the experiment record, and the rest are foundation's, and the loop
record is design-by-efferent's. This package holds one record and the four rules that keep it
the writer's.

**Why it is called diary.** Not *journal*: that word carries the write-ahead sense used in
filesystems and databases. There a journal is what a system writes before it commits, and many
readers reach for that reading first. Not *log*: the decision log has it, and the
decision log is this record's opposite. Not *personal journal* or *personal log*: each needs a
qualifier to hold it apart from the agent's records. A term that needs a qualifier is the wrong
term.

Includes `foundation`.

```
diary  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
git subtree pull --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
```

It depends on `foundation`. Install its dependencies from the root of the consuming project:

```
waytide/system/diary/install-dependencies.sh
```

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:11 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:41 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:18:34 AM PT
