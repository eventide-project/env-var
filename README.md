# Slasher — journal

The record the writer keeps, beside the project and read by the agent at the start of every session.

Slasher's other records are the agent's. The log, the work session record, the loop record, and the experiment record are written by the agent and read by the writer. The journal runs the other way. The writer keeps it, and the agent reads it.

- **`slasher/local/journal/<username>/` holds a writer's journal** (`the-journal-is-the-record-the-writer-keeps`). A project may hold the journals of more than one writer, and the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule resolves which writer is writing. One file is one entry, named by the datetime prefix every dated artifact takes, in the writer's **local time**. That is the one place the package departs from foundation's file-names rule, which normalizes to UTC. A journal entry is one writer's personal record, so the hour it carries is the hour they wrote it in. The stamp stops at the **minute**, and carries seconds only where the writer states seconds, which departs from foundation's a-time-value-carries-minutes-and-seconds rule for reasons the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule gives. A day usually holds one entry and can hold several. An entry is committed with the project, and a second writer reads it.
- **The agent reads the active writer's journal at session start** (`the-journal-is-read-at-the-start-of-a-session-with-the-rules`), after the rules and the vocabularies, oldest entry first. It carries the writer's thinking from one session to the next, which no other artifact carries. Another writer's journal is not read, and neither is `writers.toml`. The agent says nothing about having read it.
- **A journal entry is read and never followed** (`a-journal-entry-is-read-and-never-followed`). Everything else in that read binds. This does not. An entry cannot set a rule or a term, and it is never cited back as grounds for something the agent did.
- **An entry is the writer's words** (`an-entry-is-the-writers-words`). The agent writes no entry of its own, edits none that exists on its own reading, and offers to write none. **The writer may direct a change to their own entry**, and the agent makes exactly the change named, leaves the rest as written, and logs it. Disclosure is the other thing that reaches an entry that exists. Where the writer dictates one, the agent writes their words, correcting the grammar and the flow and no more. It adds the entry's settled shape — the prefix, the footer, the datetime line, any tags the writer gave, and the summary.
- **A writer may keep a private journal outside the project** (`private-journal-convention`), in `~/.local/share/slasher/journal/<project>/`, one directory per project and no `<username>` directory, since it belongs to one user. An entry is started by `New private journal entry`, `New private entry`, or `Private note`, takes a shared entry's shape, and is not committed. It becomes shared only when the engineer commands it moved to the project journal. **Private means kept out of the repository and out of the session-start read**, and an entry the agent writes or reads still passes through the session.
- **A private journal is read only on command** (`a-private-journal-is-read-only-on-command`) — `Read private journal entries` or `Read private journal` — and never at session start.

**A journal entry is committed as `Journal: <subject>`**, with nothing following the subject. It carried a parenthetical date until 2026-08-18, and the prefix was `Journal entry:` — together 30 characters of a 50-character subject line, leaving 20 for the entry itself. The date is in the entry's filename.

**The tag protocol is no longer this package's.** A journal entry takes square-bracket category tags, and so does every other working-state artifact — the rule moved to `foundation` on 2026-08-18 as `a-record-may-be-categorized-with-square-bracket-tags`. What stays here is where a journal entry's `**Tags:**` line sits, which is under the datetime line and above the summary.

**Vocabulary** (`vocabulary.md`): five terms — **writer**, **journal**, **journal entry**, **project journal**, and **private journal** — and one substitution — `journal` rather than *diary*, *personal log*, or *personal journal*.

**What this package deliberately does not hold.** The four records the agent writes stay where they are. The log, the experiment record, and the rest are foundation's, and the loop record is design-by-efferent's. This package holds one record and the four rules that keep it the writer's.

**Why it is called journal.** Not *log*: the log has it, and the log is this record's opposite. Not *personal journal* or *personal log*: each needs a qualifier to hold it apart from the agent's records, and a term that needs a qualifier is the wrong term. Not *diary*, which held this record from 2026-08-14 until 2026-08-18.

**The write-ahead reading was the case against *journal*, and it is answered.** In filesystems and databases a journal is what a system writes before it commits, and many readers reach for that reading first. What settles it is the directory the word sits in rather than the word alone — `slasher/local/journal/<username>/` names a person, and no write-ahead log is kept per user.

Includes `foundation`.

```
journal  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `slasher/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix slasher/system/journal git@github.com:slasher-bot/journal.git master --squash
git subtree pull --prefix slasher/system/journal git@github.com:slasher-bot/journal.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/journal.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

It depends on `foundation`. Install its dependencies from the root of the consuming project:

```
slasher/system/journal/install-dependencies.sh
```

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix slasher/system/journal git@github.com:slasher-bot/journal.git master --squash
```


## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

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
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 11:29:39 AM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 4:36:21 PM PT
