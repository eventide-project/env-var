# Working-state artifacts carry a provenance footer

**Trigger:** When creating or changing a working-state document under slasher/

- **Solubility:** 49
- **Original rank:** 52 of 106
- **Unclarity:** 0.52

Every working-state artifact under `slasher/` that is a document with a body ends with a **provenance footer**. That is the `Authored by … / Changed by …` block, in the record-a-rules-authorship-in-a-provenance-footer format, with a local human-readable datetime. This covers **implementation records (experiments and features), items (designs, plans, notes, and deferred work among them), loop records, and work session records**.

- **Same footer, different reason than the rule files.** The rule-file footer exists because `git subtree` strips the composite's per-file history when a package is installed into a consuming project, so `git blame` can't show a rule's author there. That reason does **not** apply to a working-state artifact: it lives in the project's own `slasher/` tree, is never shipped by subtree, and keeps its git history intact. The footer is here for a different reason. **The file should be useful on its own.** These artifacts are written to be read as self-contained documents, so a reader should not have to leave the file and query the git log to learn who wrote it and when.
- **The format is the record-a-rules-authorship-in-a-provenance-footer format.** `Authored by <name> on <local datetime>` for the original author, a `Changed by <name> on <local datetime>` line appended for each later change — oldest first, never rewritten. The datetime is the artifact's true authoring time. For a dated artifact whose ISO-8601-UTC filename prefix records when it was created, that prefix is the authoritative time (a later git add-date from a migration is a false trail).

**The one exception — the log.** `slasher/local/logs/log/` entries do **not** carry a footer. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the the-log-holds-one-file-per-entry-with-a-one-line-title rule.

Its authoring time is already in its ISO-8601-UTC filename and its commit. A footer would contradict that shape and the log's no-reformat rule. The log records who and when by its filename and commit history, not by an in-file footer.

**Why:** a working-state artifact is a document meant to be read on its own. A narrative, a design, an experiment record. Its provenance — who wrote it, when, and who changed it since — is part of what a reader needs. So it belongs in the file rather than only in version-control history the reader would have to go query.

This is a different justification from the rule-file footer's (which recovers history that subtree strips). Stating it once, here, keeps every working-state convention from repeating it. The log is exempt because its one-file-per-entry shape already carries its provenance in the filename, and a footer would break that shape.

**How to apply:** end a provenance footer on every one of these: an implementation record, whether an experiment or a feature; an item, whatever it is tagged; a loop record; and a work session record. The format is the record-a-rules-authorship-in-a-provenance-footer format: `Authored by` on creation, and an appended `Changed by` line on each later change. Do not add a footer to a `slasher/local/logs/log/` entry.

## Compressed

1. Every working-state artifact under `slasher/` that is a document with a body ends with a **provenance footer**.
2. The footer is the `Authored by … / Changed by …` block, in the record-a-rules-authorship-in-a-provenance-footer format, with a local human-readable datetime.
3. The footer goes on every implementation record, whether an experiment or a feature.
4. It goes on every item, whatever it is tagged, including designs, plans, notes, and deferred work.
5. It goes on every loop record and every work session record.
6. Write `Authored by <name> on <local datetime>` for the original author, on creation.
7. Append a `Changed by <name> on <local datetime>` line for each later change, oldest first.
8. Never rewrite an existing footer line.
9. The datetime is the artifact's true authoring time.
10. For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time.
11. A later git add-date from a migration is a false trail. Do not use it as the authoring time.

## The one exception — the log

1. Do not add a footer to a `slasher/local/logs/log/` entry.
2. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
3. A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer.

## Compression

- 2026-10-24, compressed: compression 0.42, change 0.64, solubility 49 → 80, clarity 0.48 → 0.81, 18 directives, 18 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, revised: the log is one file per entry, of short entries, not one line or one file per decision, a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 80 → 79, clarity 0.81 → 0.80; checked: 17 directives, 15 kept, 1 less precise, 1 lost
- 2026-10-29, merge from master re-checked: 14 directives, 14 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 this rule described the log as "its one-line-per-file shape". An entry can carry a body, and not every entry records a decision, so the engineer settled the wording on short entries, one file each.

Related:

- the record-a-rules-authorship-in-a-provenance-footer rule — the footer's format and the rule-file case
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the exempt one-line log
- the artifact conventions that reference this one — the-implementations-directory-holds-one-record-per-implementation rule, the-items-directory-holds-one-file-per-item rule, a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule, the-work-sessions-directory-holds-one-record-per-work-session rule, and DBE's a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:22:01 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:02:10 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
