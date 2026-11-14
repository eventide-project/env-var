# The items directory holds one file per item

**Trigger:** When creating an item, changing an item's state or content, or answering against what an item settled

- **Solubility:** 11
- **Original rank:** 1 of 106
- **Unclarity:** 0.82

`slasher/local/items/` holds the project's **items**: the thinking that settles what the work should be and how it should go. **An item is an item**, and that is the whole of what a record here is.

**An item may carry tags, such as `[design]`, `[plan]`, or `[aspiration]`.** The set is open, and an item may carry several. The tags are the ordinary square-bracket tags every working-state artifact takes.

**An item with no tag is tagged `[idea]`.** No other tag is added by default, and an item that already has a tag is not also given `[idea]`. Write `[aspiration]` only where an aspiration was asked for.

## Kinds of item

**An item is created as a kind by tagging it with that kind's name.** An item created as a `[mistake]` carries `**Tags:** [mistake]`. A kind needs no description beyond its name, and a kind not named below is as good as one that is. An item created with no kind is tagged `[idea]`.

**As the engineer stated it:** do both: describe each kind, and let any kind be created by its name.

**The kinds in common use, and what each holds:**

- **`[idea]`** — a thought about what the work could be, proposed and not yet settled.
- **`[improvement]`** — a proposed change to something that already exists, not yet settled. An idea proposes something new. An improvement concludes Realized when the change exists.
- **`[correction]`** — a proposed change that puts right something that exists and is wrong, such as a false statement in a rule. An improvement changes something that is not wrong. A correction carries `[correction]`, `[work]`, and `[rework]` together, and concludes `Corrected` when the fix exists.
- **`[rework]`** — work to redo something already produced that turned out wrong. A rework item carries `[rework]`, `[work]`, and `[correction]` together: it is a correction, and a piece of work to be done. As a work item it concludes `Done`. A correction and a rework item carry the same three tags. The first tag names which was asked for, and decides how the item concludes.
- **`[design]`** — settled direction, recorded as dated **Settled** resolutions.
- **`[plan]`** — a sequence of work, with checkbox tasks stating behavior and no code.
- **`[aspiration]`** — an outcome hoped for, written only where an aspiration was asked for.
- **`[goal]`** — an outcome the project means to reach, which other items serve. It names the end the work is for, and stays open until that end is reached or given up.
- **`[problem]`** — something wrong or in the way, recorded before anyone knows what to do about it. It states the difficulty on its own, so that it is kept without a solution being named.
- **`[mistake]`** — something done wrong, recorded with what went wrong and why. A problem may have no author. A mistake is an act that should have gone otherwise, and recording it keeps what was learned from it.
- **`[brainstorm]`** — the points of a brainstorm begun with no kind, reframed, above the engineer's own words. It starts Recorded and stays Recorded, as a note does. See the brainstorming rule.
- **`[note]`** and **`[work]`** — each has a rule of its own: the notes rule, and the work-item section below.

**A kind takes the states every item takes**, and starts and concludes as the table under *The states* gives. Where its own rule says otherwise, as the notes rule and the work-item section do, that rule decides.

## Two optional lines any item may carry

**`**Waits for:**` states what must finish before the item is actionable.** That is the whole of what it does. It does not say what to work next.

**`**Priority:**` holds a rank** — `- **Priority:** 3`. Ranks are 1 through N, contiguous, one item per number, and rank 1 is worked next among the items that are actionable.

**Rank is not the wait.** An item that is waiting may still be ranked, and a rank does not clear a wait.

**Both are optional and most items carry neither.** An item is frequently written at the moment its material is at hand, which is exactly when a ranking decision is what is being put off. An unranked item is not a defect.

**Renumbering on insert is the cost, and it is accepted.** Putting an item at a given rank moves every item below it, so a change of priority changes several files. That is the cost of each item stating its own position in a form that reads as the order the engineer gave.

**An item's content is point-in-time.** What an item says was true when it was written — the work that was in progress, the rules as they stood, the artifacts that existed. **A reference inside an item that time has overtaken is not a defect and is not chased.** An item waiting on an experiment does not stop being correct when that experiment is superseded, because it records what it was waiting for.

**Nothing derives from either line.** They are an item's own content, read by whoever reads the item.

## The shape

- **One file per item**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with its state in upper case (see the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule).
- **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**` line, then whatever the item has to say.
- **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer rule).
- **A log entry** pairs with it on creation and on each change of state (see the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule).
- **No code samples** (see the an-item-that-sequences-work-contains-no-code-samples rule).

**Nothing else is required.** An item that settles things records them as dated **Settled** resolutions and marks what it deliberately leaves out in an **Out of Scope / Deferred** tail. An item that sequences work carries checkbox tasks stating behavior. An item that does neither carries neither. **The four rules this replaces fixed a spine.** This one does not: an item is thinking, and a shape imposed on thinking is ceremony wherever the thinking does not have it.

## The states

Every item carries a `**State:**` line, from the moment it is written. **Each kind starts and concludes as this table gives:**

| Kind | Starts | Concludes when the work succeeds |
|---|---|---|
| Idea, improvement, plan | Open | Realized |
| Goal, aspiration | Recorded | Realized, only when the engineer says so |
| Work item, rework | Open | Done |
| Correction, mistake | Open | Corrected |
| Problem | Open | Resolved |
| Design | Recorded | does not change state |
| Note | Recorded | does not change state |
| Brainstorm | Recorded | does not change state |

A kind the table does not name starts Open and concludes Realized, as an idea does.

**The starting and in-progress states:**

- **Open** — the work has not started, whether the thinking is settled or not.
- **Recorded** — the starting state of a goal, an aspiration, a design, and a note. A design and a note never leave it. See the a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule. The engineer can make a goal or an aspiration Active, or leave it Recorded.
- **Active** — the work is in progress. An item becomes Active when its work starts, from Open, or from Recorded for a goal or an aspiration.
- **Implementation** — the item turned into a feature or an experiment, which carries its work. The item and the implementation record name each other.

**An item that turns into an implementation takes `Implementation`.** It takes it when the feature or the experiment is created for it. It follows the implementation: when the implementation is Completed or Affirmed, the item takes its kind's concluding state. When the implementation reaches any other concluding state, or is set aside, the agent asks the engineer what state the item takes. An item in Implementation is a current item, and its implementation is listed as current work too.

**As the engineer stated it:** When an item turns into an implementation, change its state to "implementation".

**The concluding states, by kind:**

- **Realized** — what the item describes exists. A goal or an aspiration is Realized only when the engineer says so.
- **Done** — the work is done. A work item and a rework item take it.
- **Corrected** — what was wrong is put right. A correction and a mistake take it.
- **Resolved** — the problem no longer stands. A problem takes it.
- **Completed** — the work is complete. Items take it, though no kind of item concludes with it yet.

**The states every item that changes state takes:**

- **Deferred** — kept to do later, with no date and nobody working toward it. **An item that is merely waiting its turn is not this** — it carries a `**Waits for:**` line and whatever state its thinking has reached.
- **Suspended** — paused, not ended.
- **Discontinued** — stopped, with no plan to do it. It is not current work, so the list of current items leaves it out. It means what it means for a feature or an experiment.
- **Obsolete** — it lost its relevance over time. **`Obsolete` and `Abandoned` differ in who acted:** abandoning is a decision, and an item becomes obsolete when nobody decides and the work moves past it.
- **Superseded** — another item replaced it, and the two name each other.
- **Abandoned** — dropped, by decision.

**Deferred and Discontinued differ in intent.** A Deferred item is kept to do later. A Discontinued item has no plan to do it.

**As the engineer stated it:** rename “lapse” to “obsolete”. And it should be applicable to all item categories, including work items.

**Absence is not a state**, and an item without a line is a defect.

**Any state but Open, Active, and Recorded can be taken back**, by resume. That includes every concluding state, and Deferred, Suspended, Discontinued, Obsolete, Superseded, and Abandoned. Resume returns the item to Open or to Active, as the engineer's words say. Where they do not say which, the agent asks.

**An item that carries two kind tags concludes as the kind its tags decide.** An item tagged both `[idea]` and `[design]` concludes as an idea. A correction and a rework item carry the same three tags, and the first tag decides: a correction concludes `Corrected`, and a rework item `Done`.

**An item whose work is done on an experiment's branch concludes when the work is done**, in its kind's concluding state. It does not wait for the experiment to merge. The item names the branch the work is on.

**Complete concludes an item in its kind's concluding state**, as the table gives.

**Where the engineer asks for an item to be concluded and names no state, the state is put to the engineer through the selection interface.** Each concluding state the item can take is an option. The agent does not choose the state, and does not conclude the item before the engineer selects one. *Conclude that item* names no state. *That item is done* names one. *Complete that item* names its kind's concluding state.

**As the engineer stated it:** When an item or an implementation is concluded without the engineer having given the concluding state, present the engineer with the state options using AskUserQuestion.

## A work item

**An item tagged `[work]` is a piece of work to be done, and it concludes as `Done`.** This rule names the tag and says what follows.

- **Done** — the work is done. It takes the place of `Realized`, which a work item does not take.
- **A work item takes the states every item that changes state takes**, as the list above gives.
- **A rework item is a work item**, and concludes `Done`. **A correction carries `[work]` too**, and concludes `Corrected`, since its first tag decides.

**Why:** a work item describes something to do rather than something to exist, so *realized* misstates its end. *Done* says what happened to it.

## Supersession

**A later item may supersede an earlier one.** The earlier takes `**State:** Superseded` and the two name each other in their prose. What the earlier one settled stays as written — a superseded item is a record of what was thought, not a draft.

**An item is amended by a dated addition rather than a rewrite.** A resolution that no longer holds keeps its date and its wording, and a later one states what changed. So an item reads as a history of thinking rather than as whatever is current.

**A question that runs against something an item settled has expanded the item.** The agent answers it and records the change. It does not refuse until the item is amended, which would stop the work to keep a record of it.

**A settled item is reconciled, never regenerated.** Where one item names another as the thing it realizes, the named one is a source of truth. Rebuilding it from the work downstream would invert that and would treat the implementation as correct every time.

**Why:** one directory and one class of record, because the six that came before it differed in what they were called and in nothing a rule depended on. What varies between them is a word, and a word is carried by a tag.

Keeping the shape thin is the other half. The rules this replaces fixed a spine for a design and an element order for a plan, and an item that is neither had nowhere to sit. What every item genuinely shares is a state, a tag, a footer, a log entry, and a name.

**How to apply:** write an item as a file in `slasher/local/items/`, with a `**State:**` line, a `**Tags:**` line saying what it is, and the ISO-8601-UTC prefix and state suffix in its name. Start it as its kind's row in the table gives, and make it **Active** when its work starts. Conclude it in its kind's concluding state. Conclude an item whose work is done on an experiment's branch when the work is done, not when the experiment merges.

Change the state as the item reaches another word, renaming the file with it, and write the log entry. Supersede rather than rewrite. Amend by dated addition. Add no spine the thinking does not have.

## Compressed

1. `slasher/local/items/` holds the project's items, one file per item. Every record there is an item, and only an item.
2. An item is the thinking that settles what the work should be and how it should go.
3. Name the file with the ISO-8601-UTC prefix, ending in its state in upper case.
4. Write the item as frontmatter-free markdown.
5. Give it, in this order, a `# <title>`, a `**State:**` line, a `**Tags:**` line, and whatever the item has to say. A provenance footer ends it.
6. Write a log entry when the item is created and at each change of its state.
7. Put no code samples in an item.
8. Nothing else is required. Add no shape the thinking does not have.
9. Where an item records decisions, record them as dated **Settled** resolutions.
10. Where an item that settles things deliberately leaves something out, mark it in an **Out of Scope / Deferred** tail.
11. An item that sequences work carries checkbox tasks stating behavior.
12. An item that neither settles things nor sequences work carries neither resolutions nor tasks.
13. An item may carry tags, such as `[design]`, `[plan]`, or `[aspiration]`.
14. Tag an item that has no tag at all `[idea]`.
15. Give `[idea]` to no item that already carries a tag.
16. Assign no tag but `[idea]` by default. Write `[aspiration]` only where an aspiration was asked for.
17. The tag set is open.
18. An item may carry several tags.
19. Tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-may-be-categorized-with-square-bracket-tags rule).
20. `[note]` and `[work]` mean what their rules say: the notes rule, and the work-item section below.
21. Create an item as a kind by tagging it with the kind's name. A kind needs no description beyond its name. A kind this rule does not list is as good as one it does. An item created with no kind is tagged `[idea]`.
22. `[idea]` is a thought proposed and not yet settled. An idea proposes something new. `[improvement]` is a proposed change to something that already exists, not yet settled, and concludes Realized when the change exists. `[correction]` is a proposed change that puts right something that exists and is wrong. It carries `[correction]`, `[work]`, and `[rework]` together, and concludes `Corrected` when the fix exists. An improvement changes something that is not wrong. `[rework]` is work to redo something already produced that turned out wrong, and carries `[rework]`, `[work]`, and `[correction]` together. Of the two, the first tag names which was asked for. `[design]` is settled direction, as dated Settled resolutions. `[plan]` is a sequence of work, as checkbox tasks stating behavior, with no code.
23. `[aspiration]` is an outcome hoped for, written only where one was asked for. `[goal]` is an outcome the project means to reach, which other items serve, open until reached or given up.
24. `[problem]` is something wrong or in the way, recorded without a solution named. `[mistake]` is an act that should have gone otherwise, recorded with what went wrong and why. `[brainstorm]` is the points of a brainstorm begun with no kind, reframed, under the brainstorming rule.
25. A kind takes the states every item takes, except where its own rule says otherwise.
26. An item may carry two optional lines, `**Waits for:**` and `**Priority:**`, and most items carry neither.
27. `**Waits for:**` states what must finish before the item is actionable, and nothing more.
28. `**Priority:** N`, written as `- **Priority:** 3`, ranks the item from 1 to N, contiguous, one item to a number.
29. Rank 1 is worked next among the actionable items.
30. Ranking an item renumbers those below it. The several files that changes are the accepted cost.
31. A waiting item may still be ranked, and a rank does not clear a wait.
32. Nothing derives from either line.
33. An item's content is point-in-time.
34. A reference in an item that time has overtaken is not a defect.
35. Do not chase such a reference.
36. Every item carries a `**State:**` line from the moment it is written, holding one of the words below and no other. Absence is not a state, and an item without the line is a defect.
37. Start an idea, an improvement, a plan, a work item, a rework item, a correction, a mistake, and a problem **Open**. **Open** means the work has not started, whether its thinking is settled or not. A kind not named here starts Open and concludes Realized.
38. Make an item **Active** when its work starts. **Active** is the in-progress state.
39. Start a goal, an aspiration, a design, a note, and a brainstorm **Recorded**. A design, a note, and a brainstorm stay Recorded. Make a goal or an aspiration Active from Recorded where the engineer asks, or leave it Recorded.
40. **Realized** — what it describes exists. An idea, an improvement, a plan, a goal, and an aspiration conclude Realized. A goal or an aspiration is Realized only when the engineer says so.
41. **Deferred** — kept to do later, with no date and no one working toward it.
42. An item merely waiting its turn is not **Deferred**. It carries `**Waits for:**` and whatever state its thinking has reached.
43. **Suspended** — paused, not ended.
44. **Superseded** — a later item replaced it, and the two name each other.
45. **Abandoned** — dropped by decision.
46. **Obsolete** — it lost its relevance over time, as the work moved past it with no one deciding. Where a decision dropped it, it is **Abandoned**. Any item that changes state takes it.
47. **Discontinued** — stopped, with no plan to do it. It is not current work, so the list of current items leaves it out. Deferred is kept to do later, and Discontinued has no plan to do it.
48. Take back any state but Open, Active, and Recorded with resume, to Open or Active as the engineer's words say. Where they do not say which, ask. Conclude an item whose work is done on an experiment's branch when the work is done, in its kind's concluding state. Do not wait for the merge, and name the branch.
49. At each change of state, change the `**State:**` line and rename the file.
50. At each change of state, write the log entry.
51. An item tagged `[work]` is a piece of work to be done.
52. **Corrected** — what was wrong is put right. A correction and a mistake conclude Corrected. **Resolved** — the problem no longer stands. A problem concludes Resolved. **Completed** — items take it, and no kind concludes with it yet.
53. A work item and a rework item conclude `Done`. Every item that changes state takes Deferred, Suspended, Discontinued, Obsolete, Superseded, and Abandoned.
54. A work item never takes `Realized`. Where an item carries two kind tags: `[idea]` with `[design]` concludes as an idea, and a correction or a rework item concludes as its first tag says.
55. Complete concludes an item in its kind's concluding state.
56. Supersede an item rather than rewrite it.
57. What a superseded item settled stays as written.
58. Amend an item by dated addition.
59. When amending, keep an outdated resolution's date and wording, and state what changed in a later resolution.
60. Answer a question that runs against what an item settled, and record the change.
61. Do not refuse to answer until the item is amended.
62. Where one item names another as what it realizes, the named item is the source of truth. Reconcile it; never regenerate it from the work downstream.
63. Where the engineer asks for an item to be concluded and names no state, put the concluding states the item can take to the engineer through the selection interface. Do not choose the state, and do not conclude the item before the engineer selects one. *Conclude that item* names no state. *That item is done* names one. The implementations rule asks the same for an implementation concluded with no state named. *Complete that item* names its kind's concluding state.
64. **Implementation** — when a feature or an experiment is created for an item, the item takes Implementation, and the two records name each other. It is a current item, and its implementation is listed as current work too.
65. When the implementation is Completed or Affirmed, the item takes its kind's concluding state. When it reaches another concluding state, or is set aside, ask the engineer what state the item takes.

## Compression

- 2026-10-21, compressed: compression 0.61, change 0.83, solubility 11 → 46, clarity 0.18 → 0.55
- 2026-10-22, checked: 75 directives, 49 kept, 23 less precise, 3 lost, one of them the engineer's chosen resolution of the source's contradiction
- 2026-10-22, revised: restored directives 14 and 17, compression 0.60, change 0.83
- 2026-10-24, revised: written as a numbered list; checked twice, 3 repairs, re-checked kept
- 2026-10-27, revised: Active is the in-progress state, and an item done on an experiment's branch concludes when the work is done; checked: 63 directives, 34 kept, 29 less precise, 0 lost, 25 repairs; directives 10, 11, 12, and 52 follow the engineer's resolution of the reserved tags
- 2026-10-27, re-checked: 63 directives, 56 kept, 7 less precise, 0 lost, 3 repairs; directives 10, 11, 12, and 52 follow the engineer's resolution of the reserved tags
- 2026-10-27, re-checked: 63 directives, 56 kept, 7 less precise, 0 lost, every repair kept; 53, 56, and 61 are kept by the earlier checks
- 2026-10-27, revised: the claim that no tag is reserved is removed, and a tag means what a rule about it says; checked: 71 directives, 69 kept, 2 less precise, 0 lost; 62 and 69 are kept by the earlier checks
- 2026-10-28, revised: Why points removed, solubility 46 → 45, clarity 0.55 → 0.71; checked: 57 directives, 57 kept, 0 less precise, 0 lost
- 2026-10-28, revised: an observation's state is `Recorded`, not `Stated`, a term the engineer settled; not checked
- 2026-10-29, merge from master re-checked: 67 directives, 64 kept, 3 less precise, 0 lost, 2 repairs
- 2026-10-30, revised: Lapsed is renamed Obsolete, and a work item may take it; checked: 56 directives, 56 kept, 0 less precise, 0 lost
- 2026-11-02, revised: each kind in common use is described, and any kind is created by its name; checked: 62 directives, 60 kept, 2 less precise, 0 lost, 1 repair; re-checked: 62 directives, 62 kept, 0 less precise, 0 lost
- 2026-11-06, revised: a concluding state the engineer did not name is put to the engineer through the selection interface; checked: 103 directives, 100 kept, 2 less precise, 1 lost, 1 repair; re-checked: 103 directives, 101 kept, 2 less precise, 0 lost. Directives 24 and 70, the problem and mistake contrast and the description of Recorded, are less precise in text this revision did not change, and are left as they are
- 2026-11-07, revised: `[improvement]` is described, as a proposed change to something that already exists; checked: 80 directives, 74 kept, 6 less precise, 0 lost, 1 repair; re-checked: 80 directives, 76 kept, 4 less precise, 0 lost. Directives 11, 19, 20, and 60, on the idea, the problem, the mistake, and Recorded, are less precise in text this revision did not change, and are left as they are
- 2026-11-07, revised: `[correction]` is described, as a proposed change that puts right something that exists and is wrong; checked: 72 directives, 71 kept, 1 less precise, 0 lost. Left less precise, untouched by this revision: that a settled item is never regenerated, which the compressed text says only of an item another names as what it realizes
- 2026-11-08, revised: the `[rework]` kind, carrying `[work]` and `[correction]` and concluding as a work item; not re-checked
- 2026-11-08, revised: a correction carries `[work]` and `[rework]`, and concludes `Done`; not re-checked
- 2026-11-09, revised: the Discontinued state, which the engineer added; not re-checked
- 2026-11-09, revised: each kind starts and concludes as the harmonized-states plan's table gives, with Corrected, Resolved, and Completed, and resume takes back any state but Open, Active, and Recorded; not re-checked
- 2026-11-09, revised: the Implementation state, which the engineer added; not re-checked
- 2026-11-09, checked: 98 directives, 90 kept, 7 less precise, 1 lost, 4 repairs: a correction concludes Corrected throughout, the first tag names which was asked for, an implementation is current work in place of its item, the conclusion prompt holds for an implementation too, and the Implementation points are renumbered 64 and 65; re-checked: 98 directives, 95 kept, 3 less precise, 0 lost. Left less precise, in text this revision did not change: that Discontinued means the same for an item, the name of the selection tool, and that a settled item in general is never regenerated
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked
- 2026-11-13, revised: an item in Implementation is a current item; not re-checked
- 2026-11-13, revised: `[brainstorm]` is a kind that starts and stays Recorded; checked with the brainstorming rule, see its Compression section

## History

Until Fri Nov 13 2026 there was no brainstorm kind of item.

Until Fri Nov 13 2026 an item in Implementation was not a current item, since its implementation was listed as current work in its place.

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Mon Nov 9 2026 an item whose work a feature or an experiment carried stayed Open or Active, and was listed beside the implementation.

Until Mon Nov 9 2026 every item but an observation started Open, a design included, and concluded Realized, or Done for a work item, a correction included. Only Realized, Deferred, Discontinued, Open, and Done were taken back. The engineer settled the harmonized-states plan, which gives each kind its own start and concluding state, adds Corrected, Resolved, and Completed, and lets resume take back any concluding state.

Until Mon Nov 9 2026 an item had no Discontinued state. The engineer settled that it means what it means for a feature or an experiment, and that it is taken back.

Until Sun Nov 8 2026 a correction carried `[correction]` alone, and concluded `Realized` when the fix existed.

Until Sun Nov 8 2026 this rule described no `[rework]` kind.

Until Sat Nov 7 2026 this rule described no `[correction]` kind. The engineer settled that a correction is a proposed change that puts right something that exists and is wrong.

Until Sat Nov 7 2026 this rule described no `[improvement]` kind. A proposed change to something that already exists was written as an idea. The engineer settled that it is an improvement, and that ideas already written keep their tag.

Until Mon Nov 2 2026 this rule named `[design]`, `[plan]`, and `[aspiration]` as examples, and said nothing of what a kind holds or of `[goal]`, `[problem]`, and `[mistake]`. The engineer settled that each kind in common use is described, and that any kind is created by its name.

Until Fri Oct 30 2026 the state an item reached when the work moved past it was Lapsed, and a work item did not take it. The engineer settled that it is Obsolete, and that every item takes it, a work item included.

**This is the last of the mode vocabulary, and it is gone with it.** A project once worked in one of three modes, and the mode fixed what a planning record was called — a design, an aspiration, or an orientation in one; a plan, an intention, or an action in another. The mechanism was decommissioned on 2026-08-18 and the six words outlived it as a tag set that still read as exhaustive.

`[deferred]` marked work postponed until the current task finishes, and the items carrying it were a queue with a rule of its own. That convention was suspended on 2026-08-25 — what made it a queue was a session-start print and a command, and both are gone.

**One word covers what two used to.** `Realized` replaces the pair `Realized` and `Implemented`, which distinguished a direction taken up from a sequence built. That distinction went with the mode vocabulary, and one word is what remains of it.

Until Sun Oct 25 2026 this rule was named items-convention and titled "`waytide/local/items/` — the project's items, one file per item".

Until Mon Oct 26 2026 this rule was named the-items-directory-holds-the-projects-items-one-file-per-item and titled "The items directory holds the project's items, one file per item".

Until 2026-08-25 the `**Waits for:**` and `**Priority:**` lines were the deferred queue's mechanism.

Until 2026-10-26 **Active** meant settled, with the work expected, and **Open** meant the thinking is not settled. They were the two starting words, and an item started Active where it settled something, whether or not the work had begun. No state said the work was under way. The engineer settled that Active is the in-progress state, and that an item stays Open until its work starts, settled or not.

Until Tue Oct 27 2026 this rule said that no tag is reserved and that a tag decides nothing, while `[work-item]`, in this rule, and `[observation]`, in the observations rule, each decide what a record is. The engineer settled that a tag means what a rule about it says, so the general claim is removed rather than restated.
- **Thu Oct 29 2026** — the tag for a piece of work to be done was `[work-item]`, and the record was called a work item. It is `[work]`, at the engineer's direction.

Related:

- the a-record-may-be-categorized-with-square-bracket-tags rule — the tags that say what an item is
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the filename suffix
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the log entry an item takes
- the a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule — a note, which is an item whose one state never changes
- the file-names, working-state-artifacts-carry-a-provenance-footer, and an-item-that-sequences-work-contains-no-code-samples rules
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

---

Authored by Scott Bellware on Mon Aug 17 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:38:56 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:05:21 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:15:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:27:49 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 11:13:06 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:09:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:19:11 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:26:00 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:34:30 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:29 PM PT
Changed by Scott Bellware on Mon Nov 2 2026 at 6:49:58 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:45:17 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:29:16 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:30:03 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:36:57 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:18:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:22:50 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 3:13:12 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 8:59:34 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:25:25 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:23:43 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:44:35 PM PT
