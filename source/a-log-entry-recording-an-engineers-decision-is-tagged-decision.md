# A log entry recording an engineer's decision is tagged `[decision]`

**Trigger:** When writing a log entry that records a decision, or when the engineer types `/decision`

**When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.** The tag says who decided.

**Every log entry states a decision, so the tag marks the engineer's.** Most entries record what the agent did under a rule, or what followed from the work. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.

**The engineer's decision is the engineer's own choice.** It may be stated in the engineer's words, or made by choosing among options the agent puts forward. An act the agent takes under a rule is not one, even when the engineer approved it.

## The tag

**The entry carries the tag under its title**, separated by a blank line, in the one form every record uses:

```
# The README item settles that the README's content is addressed with Slasher's website, and waits for it

**Tags:** [decision]
```

**An entry may carry other tags beside this one.** An engineer's decision to stop doing something is tagged `[decision] [suspended]`.

**What `[decision]` marks is fixed here**, and the set of the engineer's decisions is read from it.

**Why:** the log carries the agent's acts and the engineer's decisions in the same form, one line each. A reader who reconsiders a direction needs to know which were the engineer's. A decision the engineer made is changed by the engineer, and an act of the agent is corrected against the rule it followed. With the tag, the engineer's decisions are a set that one search finds.

**How to apply:** when the engineer makes a decision, write its log entry with `**Tags:** [decision]` under the title. Do not tag an entry for an act the agent took under a rule.

## The /decision command

**`/decision <text>` logs the text as the engineer's decision.** The text is the entry's title, in the engineer's words, with grammar and flow corrected and nothing added. The entry carries `**Tags:** [decision]` under it, and follows every convention of the log, per the the-log-holds-one-file-per-entry-with-a-one-line-title rule. The engineer typed it, so it is the engineer's decision, whether or not an option was put forward first.

**`/decision` alone logs the decision the conversation has just reached.** It states that decision as the title, as a bare `/log` states the work's, and tags it `[decision]`. Where the decision is the agent's act under a rule rather than the engineer's selection, it is not a decision this command logs, and the command says so and writes nothing. Where it is unclear which decision is meant, ask, through the selection interface. Where nothing has been decided, say so and write nothing.

**Commit the entry as the log rule says:** with the change it bears on, or on its own with a `Log:` prefix.

## Compressed

1. When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.
2. The tag says who decided. Every log entry states a decision, so the tag marks the engineer's.
3. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.
4. The engineer's decision is the engineer's own choice. It may be stated in the engineer's words.
5. It may also be made by choosing among options the agent puts forward.
6. An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it.
7. Do not tag an entry for an act the agent took under a rule. Do not tag such an entry `[decision]`.

## The tag

1. The entry carries the tag under its title, separated by a blank line.
2. The tag uses the one form every record uses:

```
# The README item settles that the README's content is addressed with Slasher's website, and waits for it

**Tags:** [decision]
```

3. An entry may carry other tags beside this one.
4. An engineer's decision to stop doing something is tagged `[decision] [suspended]`.
5. What `[decision]` marks is fixed here.
6. The set of the engineer's decisions is read from this tag.

## The /decision command

1. `/decision <text>` logs the text as the engineer's decision. The text is the entry's title, in the engineer's words, with grammar and flow corrected and nothing added.
2. The entry carries `**Tags:** [decision]` and follows every convention of the log, per the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
3. `/decision` alone logs the decision the conversation has just reached, stated as the title, as a bare `/log` states the work's, tagged `[decision]`.
4. Where that decision is the agent's act under a rule, say so and write nothing.
5. Where it is unclear which decision is meant, ask, through the selection interface. Where nothing has been decided, say so and write nothing.
6. Commit the entry with the change it bears on, or on its own with a `Log:` prefix.

## Compression

- 2026-10-24, compressed: compression 0.15, change 0.37, solubility 72 → 93, clarity 0.62 → 1.00, 8 directives, 8 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, revised: `[decision]` is no longer called a reserved tag, a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 93 → 93, clarity 1.00 → 0.99; checked: 10 directives, 10 kept, 0 less precise, 0 lost
- 2026-11-08, revised: the /decision command, a section of its own in the body and the compressed text; not re-checked

## History

Until Sun Nov 8 2026 there was no `/decision` command, and this rule's trigger named only writing a decision entry.

Until Sun Oct 25 2026 this rule was named a-decision-the-engineer-made-is-tagged-decision and titled "A log entry recording a decision the engineer made is tagged `[decision]`".

Until Tue Oct 27 2026 this rule called `[decision]` a reserved tag. The engineer settled that a tag means what a rule about it says, with no reserved category.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's form
- the a-record-may-be-categorized-with-square-bracket-tags rule — how a tag is written
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — `[suspended]`, the other tag the log reads

---

Authored by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:11:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:57:09 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 3:07:53 PM PT
