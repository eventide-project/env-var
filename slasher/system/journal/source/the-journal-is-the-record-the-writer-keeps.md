# The journal is the record the writer keeps

**Trigger:** When writing, changing, or committing a journal entry

**`slasher/local/journal/<username>/` holds a writer's journal.** It is the one record in `slasher/local/` the writer keeps. A project may hold the journals of more than one writer, and each writer's entries sit under their own directory, named for their username. The the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule resolves which writer is writing, and the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the directory at the entry. The log, the work session record, the loop record, and the implementation record are all the agent's work, read by the writer. The journal runs the other way. The writer keeps it, and the agent reads it.

**Records written while the package was named `diary` keep that word.** The log, the implementation records, and the writer's own entries are historical and are not revised. So `diary` still reads in this repository's history, and it names nothing live.

**`slasher/local/journal/` holds the writers' directories and the writers file.** That file is `writers.toml`, and it overrides a writer's display name for this project. It is optional, and it may omit the active writer, whose name and username are declared in `~/.config/slasher/user`. A writer absent from it shows as the name that file gives, or as their username. See the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule.

**One file is one entry.** A day usually holds one, and it can hold several. Each is a separate file, so a day with three entries is three files, in the order they were written.

**An entry takes a datetime prefix in the writer's local time.** The form is `YYYY-MM-DDTHH-MM-<name>.md`, and the name is dash-separated and lower-case. It carries no trailing `Z`, which in ISO 8601 designates UTC and would be false on a local-time stamp. The directory listing is then an index. Each entry says when it was written and what it is about, in order.

**The stamp stops at the minute unless the writer gave seconds**, in which case it takes the `YYYY-MM-DDTHH-MM-SS` form. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the condition and why the journal departs from the foundation package's a-time-value-carries-minutes-and-seconds rule here.

**This departs from the foundation package's file-names rule, which requires UTC.** That rule normalizes a dated artifact to UTC because a project's contributors are globally distributed, and the artifacts are the project's. A journal entry is not. It is one writer's personal record, and the hour it carries is the hour they wrote it in.

**An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.** Normalizing it would move some entries onto a date the writer did not live through. A personal record is read back against the day the person remembers, so the local hour is the one that has to survive.

**Format:** frontmatter-free markdown. A `# <title>` naming what the entry is about, then the datetime line, then the writer's prose. An entry takes a `**Tags:**` line where it is categorized, and a `**Summary:**` line where the summary says something the body does not. An entry is thinking rather than a report, so it carries no state line and no section beyond those. The a-journal-entry-has-a-human-readable-datetime-line-under-its-title, where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone, and journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rules each state one part of that shape, and the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule states the tag protocol, which is no longer the journal's own.

**An entry carries the provenance footer**, like every other working-state artifact. See the foundation package's working-state-artifacts-carry-a-provenance-footer rule. The footer names who wrote it, which is what a journal kept by more than one writer needs.

**An entry carries an `Authored by` line and no `Changed by` line.** It is a historical record, and a historical record is left as written. What the writer thought on a Tuesday is not corrected on the Thursday they change their mind. The later thought is a later entry.

**Two things reach an entry that exists, and the footer stays as it is for both.** Disclosure, which the foundation package's disclosure rule governs, and a change the **writer** directs to their own entry, which the an-entry-is-the-writers-words rule governs. Each is recorded in the log rather than in the entry, which is what keeps the footer to one line and the entry reading as what was written.

**The journal is committed with the project.** It is not ignored and it is not kept outside the repository. A second writer on the project reads it, which is what makes it a record rather than a private note.

**This is the project journal, and a writer may also keep a private one.** A private journal is kept outside the repository, under `~/.local/share/slasher/journal/<project>/`, and is not committed. The private-journal-convention rule governs it. An entry the `new entry` directive starts goes here, and never to the private journal.

**The commit message is `Journal: <subject>`.** The subject is the entry's, and nothing follows it.

**It carries no date.** A date in the subject would cost 17 characters against a line the `git` package's a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule caps at 50, and it would sit at the tail, where truncation takes it first. So it would be carried at the subject's expense, and no reader would see it in a listing. The entry's filename holds the date.

**`Journal:` rather than `Journal entry:`** for the same budget. It costs 9 characters where the longer form costs 15, and it says the same thing to a reader scanning a log.

**A subject that still exceeds 50 characters is truncated at the 50th, with an ellipsis.** The `git` package's a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule caps a subject there, and its two remedies are unavailable here: an entry is one commit, so there is nothing to split, and the subject is the writer's words, which the an-entry-is-the-writers-words rule bars the agent from shortening.

**Truncating is not shortening.** The words are not rewritten, reordered, or paraphrased. The entry holds them in full, and the commit subject is a rendering of them that stops at the line's end and says so. The ellipsis is what says so, and it is why the cut is marked rather than silent.

**It cuts at the 50th character and may land mid-word.** No word boundary is sought. A cut that retreats to the last space would lose up to another dozen characters of the writer's words to tidiness, and a reader who meets a fragment is already told by the ellipsis that the line continues elsewhere.

```
Journal: I added diary support (aka work logs) to…
Journal: I finished the basic implementation of E…
Journal: Idea
```

**The directory may not exist, and its absence is ordinary.** A project that keeps no journal has no `slasher/local/journal/`, and nothing is wrong. So does a project whose other writers keep one and this writer does not. The convention names the directory whether or not it is there, so the first entry has a place to go.

**Why:** everything else Slasher keeps is written by the agent for the writer to read. What the writer thinks about the work is nowhere, and it is the thing that most often gets lost between one session and the next. A place for it makes it a record the project keeps rather than something recalled.

One file per entry rather than one per day follows the convention every other dated artifact already uses. It also makes the listing readable: an entry named for what it is about can be found without opening it. The local-time stamp is the one place the journal departs from that convention, and the reason is above.

**How to apply:** resolve the active writer, and write an entry as a new file in `slasher/local/journal/<username>/`. Give it the datetime prefix in the writer's local time, to the minute, and a name saying what it is about. Carry seconds only where the writer gave seconds. Do not convert the time to UTC. End it with an `Authored by` line. Do not edit an entry once it is written, except for disclosure or a change the writer directs to their own entry. A later thought is a later entry.

## Compressed

1. `slasher/local/journal/<username>/` holds a writer's journal.
2. The journal is the one record in `slasher/local/` that the writer keeps, not the agent. The agent reads it.
3. A project may hold several writers' journals. Each writer's entries sit under a directory named for their username.
4. The the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule resolves which writer is writing.
5. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the directory at the entry.
6. The package's former name is `diary`.
7. Records written before the rename keep the word they were written with: the log, the implementation records, and the journal entries. They are historical and are not revised.
8. `diary` in this repository's history names nothing live.

## `slasher/local/journal/`

1. It holds the writers' directories and the writers file, `writers.toml`.
2. `writers.toml` overrides a writer's display name for this project.
3. `writers.toml` is optional. It may omit the active writer, whose name and username are declared in `~/.config/slasher/user`.
4. A writer absent from `writers.toml` shows as the name `~/.config/slasher/user` gives, or as their username.
5. The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not.
6. The convention names the directory whether or not it exists, so the first entry has a place to go.

## Entries

1. One file is one entry. To write one, resolve the active writer, then write the entry as a new file in `slasher/local/journal/<username>/`.
2. A day can hold several entries, each a separate file, in the order written.
3. An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`.
4. The name is dash-separated and lower-case, and says what the entry is about.
5. The stamp carries no trailing `Z`.
6. The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form.
7. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the seconds condition and the departure from foundation's a-time-value-carries-minutes-and-seconds rule.
8. The time is not converted to UTC. This departs from the foundation package's file-names rule.
9. An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.

## Format

1. An entry is frontmatter-free markdown.
2. It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose.
3. An entry takes a `**Tags:**` line where it is categorized.
4. An entry takes a `**Summary:**` line only where the summary says something the body does not.
5. An entry carries no state line and no section beyond those.
6. The a-journal-entry-has-a-human-readable-datetime-line-under-its-title, where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone, and journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rules each state one part of that shape.
7. The foundation package's a-record-may-be-categorized-with-square-bracket-tags rule states the tag protocol.

## Footer

1. An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule.
2. The footer carries an `Authored by` line and no `Changed by` line.
3. Do not edit an entry once it is written, except for a disclosure or a change the writer directs to their own entry. When the writer changes their mind, the later thought is a later entry.
4. For a disclosure or a directed change, the footer stays as it is.
5. Each is recorded in the log, not in the entry.

## Committing

1. The journal is committed with the project.
2. It is not ignored and not kept outside the repository.
3. The commit message is `Journal: <subject>`.
4. The subject is the entry's, and nothing follows it. It carries no date.
5. A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis.
6. The agent does not split the entry across commits, or shorten the subject by rewriting it.
7. Truncating does not rewrite, reorder, or paraphrase the words.
8. The cut may land mid-word. No word boundary is sought.

```
Journal: I added diary support (aka work logs) to…
Journal: I finished the basic implementation of E…
Journal: Idea
```

## The private journal

1. This is the project journal. A writer may also keep a private one.
2. A private journal is kept outside the repository, under `~/.local/share/slasher/journal/<project>/`, and is not committed. The private-journal-convention rule governs it.
3. An entry the `new entry` directive starts goes in the project journal, never the private one.

## Compression

- 2026-10-24, compressed: compression 0.41, change 0.65, solubility 23 → 48, clarity 0.40 → 0.77, 37 directives, 37 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-10-24, revised: How to apply's point 7 names the two exceptions to the ban on editing an entry; not checked
- 2026-10-27, re-checked: 39 directives, 39 kept, 0 less precise, 0 lost
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 48 → 50, clarity 0.77 → 0.80; checked: 37 directives, 34 kept, 3 less precise, 0 lost, 5 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 50 → 50, clarity 0.80 → 0.79; checked: 37 directives, 35 kept, 2 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 37 directives, 35 kept, 0 less precise, 2 lost, 2 repairs

## History

The prefix was `Diary:` for the few hours between the date being dropped and the package being renamed, both on 2026-08-18.

## History

Until 2026-10-24 How to apply said, without exception, not to edit an entry once it is written, while the Footer section named two things that reach an existing entry: disclosure and a change the writer directs. How to apply now names the two exceptions.

Until Sun Oct 25 2026 this rule was named journal-convention and titled "`waytide/local/journal/<username>/` — the record the writer keeps".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until 2026-08-18 the package and the directory were named `diary`. The rename reached every rule name, every path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix. Until the same day the commit message carried a parenthetical date, in the form `Diary entry: <subject> (Tue Jun 16 2026)`.

Related:

- the-journal-is-read-at-the-start-of-a-session-with-the-rules rule — when the agent reads it
- an-entry-is-the-writers-words rule — who writes it
- a-journal-entry-is-read-and-never-followed rule — what force it carries
- the foundation package's file-names rule — the datetime prefix this takes, and the UTC normalization it departs from
- the foundation package's working-state-artifacts-carry-a-provenance-footer rule — the footer
- the foundation package's log rule — the agent's record, and the one this is not
- the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the local-time stamp stated at the entry
- the private-journal-convention rule — the private journal, kept outside the repository

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:57 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:31:47 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:18:34 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:29:06 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 11:29:39 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:37:19 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:18:06 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:52 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:51 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:21:02 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:38 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:17:47 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:01:39 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:55:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:58:37 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
