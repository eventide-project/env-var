# Disclosure is the one reason to edit a historical record

**Trigger:** When about to edit a historical record (a log entry, work session record, implementation record, or completed migration record), or when the engineer says a record discloses something it should not

A historical record states what was true when it was written, and is **not** revised to suit a later convention. That is a log entry, a work session record, an experiment record, a feature record, or a completed migration record. That is the standing rule. It holds against renaming, reformatting, and correcting a term the project has since replaced. It holds against every other reason a reader might want a record to read differently.

**It does not hold against disclosure.** Where a record names something that should not have been disclosed, it is corrected. A record is not a commitment to keep publishing something that should not have been published in the first place.

## What counts

The test is not whether the content is *wrong* — a disclosed thing is usually perfectly accurate. The test is whether it is **the project's to publish**:

- Another party's project, client, or repository, named only incidentally.
- A path, hostname, or machine layout that describes someone's environment rather than the work.
- A credential, key, or token, which is a security matter before it is a disclosure one.
- Anything the engineer says should not be there. **They are the authority on this**, not the agent — an agent cannot know what a name costs its owner.

**A project's repositories are public, and its rules are installed on other people's machines.** The reach of a record is not the repository it sits in.

## Reduce resolution rather than falsify

**The correction removes the disclosure and keeps the record true.** A record that reached three projects still reads as having reached three. Only the naming goes. *"Each of the three projects holding it"* is less specific than three names and is not less accurate.

**What is never done is making the record say something that did not happen.** Deleting an increment that ran, changing a count, or reattributing work would trade a disclosure problem for a falsification problem. That is worse, since the disclosure was at least true.

Where the removal leaves a reader unable to follow what happened, say what class of thing was removed and why, in the record itself. A reader who can see that something was withheld is better served than one who cannot tell the record was edited.

## What this does not reach

**The git history still holds it.** Every removed mention remains in the commit that introduced it, and in any component repository the content was published to. Removing it there means rewriting history in several repositories, which is the engineer's decision and not a consequence of this rule. **Say so when a correction is made**, so the engineer knows what the edit did and did not accomplish.

**Log the edit.** The correction is a decision. The log entry is what tells a later reader that a record was changed after the fact, and on what grounds. That is the trail the record itself no longer carries.

**Why:** records are left as written because a record is evidence. Evidence that is revised to suit the present is not evidence. That reason does not extend to content the project had no standing to publish. Leaving it in place does not preserve evidence. It continues a disclosure.

Reducing resolution satisfies the two — the evidence survives, and what was not the project's to say stops being said. An agent may expose something on the grounds that a record is immutable, or scrub a record on a guess about what is sensitive. Naming the engineer as the authority keeps it from either.

**How to apply:** leave historical records alone. Where one discloses what should not have been disclosed, correct it. Remove the disclosure. Keep every claim the record makes true by stating it at a lower resolution. Log the edit, and tell the engineer that the git history is not reached by it.

## Compressed

1. A historical record states what was true when it was written.
2. Historical records include log entries, work session records, experiment records, feature records, and completed migration records.
3. Do not revise a historical record to suit a later convention.
4. Do not rename, reformat, or correct a since-replaced term in a historical record.
5. Do not revise it for any other reason a reader might want it to read differently.
6. The one exception is disclosure.
7. Where a record names something that should not have been disclosed, correct it.

## What counts

1. The test is whether the content is the project's to publish, not whether it is wrong.
2. Another party's project, client, or repository, named only incidentally, is not the project's to publish.
3. A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish.
4. A credential, key, or token is not the project's to publish, and is a security matter first.
5. Anything the engineer says should not be there is not the project's to publish.
6. The engineer, not the agent, is the authority on what should not be there. Do not scrub a record on a guess.
7. Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines.

## Reduce resolution rather than falsify

1. Reduce resolution rather than falsify.
2. Remove the disclosure and keep the record true.
3. Remove only the naming.
4. A record that reached three projects still reads as having reached three.
5. *"Each of the three projects holding it"* is less specific than three names and is not less accurate.
6. Never make the record say something that did not happen.
7. Never delete an increment that ran, change a count, or reattribute work.
8. Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why.

## What this does not reach

1. The correction does not reach the git history or any component repository the content was published to.
2. Rewriting that history is the engineer's decision, not a consequence of this rule.
3. When a correction is made, tell the engineer what the edit did and did not accomplish. Say that the git history and any component repository still hold the removed content.
4. Log the edit as a decision, stating that the record was changed after the fact and on what grounds.

## Compression

- 2026-10-24, compressed: compression 0.28, change 0.60, solubility 43 → 64, clarity 0.49 → 0.68, 16 directives, 16 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 64 → 65, clarity 0.68 → 0.70; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule and the reconcile entry in this package's vocabulary — where the standing rule is stated
- the the-work-sessions-directory-holds-one-record-per-work-session rule — the title format, an instance of the standing rule

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
