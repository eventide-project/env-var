# Working-state artifacts carry a provenance footer

Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**. That is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format, with a local human-readable datetime. This covers **experiments, designs, plans, observations, deferred items, loop records, and work session records**.

- **Same footer, different reason than the rule files.** The rule-file footer exists because `git subtree` strips the composite's per-file history when a package is installed into a consuming project, so `git blame` can't show a rule's author there. That reason does **not** apply to a working-state artifact: it lives in the project's own `waytide/` tree, is never shipped by subtree, and keeps its git history intact. The footer is here for a different reason. **The file should be useful on its own.** These artifacts are written to be read as self-contained documents, so a reader should not have to leave the file and query the git log to learn who wrote it and when.
- **The format is the record-rule-authorship-in-a-footer format.** `Authored by <name> on <local datetime>` for the original author, a `Changed by <name> on <local datetime>` line appended for each later change — oldest first, never rewritten. The datetime is the artifact's true authoring time. For a dated artifact whose ISO-8601-UTC filename prefix records when it was created, that prefix is the authoritative time (a later git add-date from a migration is a false trail).

**The one exception — the decision log.** `waytide/local/logs/log/` entries do **not** carry a footer. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the decision-log-convention.

Its authoring time is already in its ISO-8601-UTC filename and its commit. A footer would contradict that shape and the log's no-reformat rule. The log records who and when by its filename and commit history, not by an in-file footer.

**Why:** a working-state artifact is a document meant to be read on its own. A narrative, a design, an experiment record. Its provenance — who wrote it, when, and who changed it since — is part of what a reader needs. So it belongs in the file rather than only in version-control history the reader would have to go query.

This is a different justification from the rule-file footer's (which recovers history that subtree strips). Stating it once, here, keeps every working-state convention from repeating it. The decision log is exempt because its one-line-per-file shape already carries its provenance in the filename, and a footer would break that shape.

**How to apply:** end a provenance footer on every one of these. That is an experiment, a design, a plan, or an observation. It is also a deferred item, a loop record, or a work session record. The format is the record-rule-authorship-in-a-footer format: `Authored by` on creation, and an appended `Changed by` line on each later change. Do not add a footer to a `waytide/local/logs/log/` entry.

Related:

- the record-rule-authorship-in-a-footer rule — the footer's format and the rule-file case
- the decision-log-convention — the exempt one-line log
- the artifact conventions that reference this one — implementations-convention, ideas-convention, observations-convention, work-sessions-convention, and DBE's loop-records

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
