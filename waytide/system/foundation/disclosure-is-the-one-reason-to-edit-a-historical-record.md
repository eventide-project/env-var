# Disclosure is the one reason to edit a historical record

A historical record — a decision-log entry, a work session record, an experiment record, a
feature record, a completed migration record — states what was true when it was written and is
**not** revised to suit a later convention. That is the standing rule, and it holds against
renaming, reformatting, correcting a term the project has since replaced, and every other reason
a reader might want a record to read differently.

**It does not hold against disclosure.** Where a record names something that should not have
been disclosed, it is corrected. A record is not a commitment to keep publishing something that
should not have been published in the first place.

## What counts

The test is not whether the content is *wrong* — a disclosed thing is usually perfectly
accurate. The test is whether it is **the project's to publish**:

- Another party's project, client, or repository, named only incidentally.
- A path, hostname, or machine layout that describes someone's environment rather than the work.
- A credential, key, or token, which is a security matter before it is a disclosure one.
- Anything the developer says should not be there. **They are the authority on this**, not the
  agent — an agent cannot know what a name costs its owner.

**A project's repositories are public, and its rules are installed on other people's machines.**
The reach of a record is not the repository it sits in.

## Reduce resolution rather than falsify

**The correction removes the disclosure and keeps the record true.** A record that reached three
projects still reads as having reached three; only the naming goes. *"Each of the three projects
holding it"* is less specific than three names and is not less accurate.

**What is never done is making the record say something that did not happen.** Deleting an
increment that ran, changing a count, or reattributing work would trade a disclosure problem for
a falsification problem, which is worse — the disclosure was at least true.

Where the removal leaves a reader unable to follow what happened, say what class of thing was
removed and why, in the record itself. A reader who can see that something was withheld is
better served than one who cannot tell the record was edited.

## What this does not reach

**The git history still holds it.** Every removed mention remains in the commit that introduced
it, and in any component repository the content was published to. Removing it there means
rewriting history across several repositories, which is the developer's decision and not a
consequence of this rule. **Say so when a correction is made**, so the developer knows what the
edit did and did not accomplish.

**Log the edit.** The correction is a decision, and the log entry is what tells a later reader
that a record was changed after the fact and on what grounds — which is the trail the record
itself no longer carries.

**Why:** the reason records are left as written is that a record is evidence, and evidence that
is revised to suit the present is not evidence. That reason does not extend to content the
project had no standing to publish: leaving it in place does not preserve evidence, it continues
a disclosure. Reducing resolution satisfies both — the evidence survives, and what was not the
project's to say stops being said. Naming the developer as the authority keeps an agent from
either exposing something on the grounds that a record is immutable, or scrubbing a record on a
guess about what is sensitive.

**How to apply:** leave historical records alone. Where one discloses what should not have been
disclosed, correct it: remove the disclosure, keep every claim the record makes true by stating
it at a lower resolution, log the edit, and tell the developer that the git history is not
reached by it. Related: the deferred-convention and the reconcile entry in this package's
vocabulary (where the standing rule is stated), and the work-sessions-convention (the title
format, an instance of the standing rule).

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
