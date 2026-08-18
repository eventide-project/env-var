# A suspension is a log entry tagged `[suspended]`, and nothing is moved anywhere

**When the project stops doing something, log it and tag the entry `[suspended]`.** That is the
whole of the act. There is no directory the thing moves to, and nothing is kept beside the entry.

**What can be suspended** is anything the project *did*: a rule that became ceremony, a procedure
nobody runs, a report nobody reads, a step that costs more than it is worth. **Not** something the
project only wanted — an idea set aside takes `**State:** Suspended` and stays where it is, which
is a different act with a different record.

## What the entry carries

**A title stating what was suspended and why**, like every log entry — what it cost, and
what it stopped buying. The reason is the substance, because it is what a later reader is deciding
against.

**Name what else changed.** Stopping something is never one file: removing a rule means dropping
it from the `Related:` lists that cite it and from the package README's summary, per the
rules-convention. The entry says so in its own clause. That is the record of the whole act rather
than of its first step.

**The file is removed in the same commit.** Git holds the text, reachable by path from `master`'s
history, which is the ordinary case this system relies on everywhere else.

## The tag

**The entry carries `**Tags:** [suspended]` under its title**, separated by a blank line:

```
# The no-stored-recap rule is suspended, its one sentence folded into the log convention

**Tags:** [suspended]
```

**That is the one form every record uses.** The a-record-takes-category-tags rule excludes no
record and offers no second shape, so a log entry's tags sit where an idea's and an
implementation record's do. A leading-tag form was written on 2026-08-18 and superseded the same
day.

**A log entry may carry other tags beside this one.** Nothing here reserves the line, and nothing
excludes any record from tagging.

**`[suspended]` is a reserved tag.** What it marks is fixed here, and the set of suspensions is
read from it.

**Why:** an undo queue held the suspended thing itself under `waytide/local/suspended/`, with a
return address and a list of reconciliations to reverse. It ran from 2026-08-03 to 2026-08-18 and
accumulated eleven items. **Not one was restored.** The mechanism was built for a reversal that
never happened, and its cost was paid on every suspension: a file to place, four canonical lines
to write, and a growing directory that a reader had to be told the purpose of.

What the queue was really protecting against is a thing coming back different, reconstructed from
memory and argument. The log entry protects against that at a fraction of the cost. It names what
was stopped, why, and what else changed — which is what someone reconsidering the decision needs.
The text itself is in git, where every other removed file in this project already is.

**How to apply:** when something the project does is no longer justified, remove it, reconcile
what cites it, and write one log entry tagged `[suspended]` saying what was stopped, why, and what
else changed. Commit the removal and the entry together.

Do not keep a copy of the removed
thing. Do not tag an idea's log entry this way — an idea set aside carries `**State:** Suspended`
and is not removed.

Related:

- the a-record-takes-category-tags rule — the universal tag protocol, and its one form
- the decision-log-convention — the entry's form
- the rules-convention — removing a rule, and the reconciliation the entry names
- the ideas-convention — the `Suspended` **state**, which is what an idea takes instead
- the deferred-queue-convention — the other reserved tag, and the queue read from it

---

Authored by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
