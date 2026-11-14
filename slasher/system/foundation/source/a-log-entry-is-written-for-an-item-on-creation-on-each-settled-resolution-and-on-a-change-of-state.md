# A log entry is written for an item on creation, on each settled resolution, and on a change of state

**Trigger:** When creating an item, adding a dated Settled resolution to it, changing its **State:** line

- **Solubility:** 17
- **Original rank:** 2 of 106
- **Unclarity:** 0.77

An **item** in `slasher/local/items/` pairs with a one-line entry in `slasher/local/logs/log/`. The entry is written at three moments, and at no others.

**Whatever the item is tagged does not matter here.** A `[design]`, a `[plan]`, an `[aspiration]`, or an item carrying no kind tag at all takes the same entry at the same moments. The tag describes the item and decides nothing about the log.

- **On creation.** That the item was recorded at all is itself a decision, and the entry records the item rather than the word.
- **On each `Settled` resolution.** A dated resolution is the unit an item records decisions in, so each one is a decision the log carries.
- **On a change of state.** The canonical `**State:**` line reaching any state word the the-items-directory-holds-one-file-per-item rule names is a decision: **Open**, **Active**, a concluding state such as **Realized**, **Done**, **Corrected**, **Resolved**, or **Completed**, or **Deferred**, **Suspended**, **Discontinued**, **Superseded**, **Abandoned**, or **Obsolete**. So is a state being taken back by resume. **A design and a note are `Recorded` and never move**, so each takes a creation entry and no other.

## What the entry says

**The entry names the record and what happened to it.** That is the record being written, or its `**State:**` line reaching a word. What the record settles may follow, attributed to the record rather than stated as the system's behavior.

**An entry never states an unbuilt direction in the indicative mood.** An item settles a direction and builds nothing. *The check runs at the engineer's first prompt* says the system does that, and while the record is `Open` or `Active` the system does not.

**The pull comes from the commit conventions, and they are right about commits.** The `git` package's write-subject-first-commit-messages rule asks for the changed thing and its new state, in passive voice and indicative mood. Its a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule asks for the fact rather than the clerical gesture. Each is written for a change to the software.

**An item is not a change to the software.** The fact about it is that it was recorded, or that its state moved. Writing what it settles in that grammar states a fact that did not happen, which is the one thing those rules never license.

**This reaches the commit subject the entry travels in**, which is the more-scanned surface. An entry corrected in the log while its commit subject carries the same claim is half corrected.

**No wording template is fixed.** *X is recorded as an item — Open because …* and *X is realized* are forms already in use. What is required is the record named and the mood honest, and a template would be the over-prescription the an-item-that-sequences-work-contains-no-code-samples rule warns against.

## What is not logged

**A completed task is not a decision.** An item's checkbox tasks are execution against direction already settled. Logging each one would put the build's every increment in a record whose unit is the decision, and the item already carries them.

**Prose that settles nothing is not a decision.** Reconciling a Background & Motivation section, correcting a summary, or rewording a substantive section changes how the artifact reads and changes no direction. The provenance footer records that the file was changed, which is what that footer is for.

## Why the obligation is stated here rather than in each convention

**Three conventions state their own log entry in full, and the the-items-directory-holds-one-file-per-item rule points here.** The a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule, the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule each state the pairing inline. The the-items-directory-holds-one-file-per-item rule requires the record, its dated resolutions, and its footer, and names the entry only by pointing to this rule.

**What reached the log anyway was the the-log-holds-one-file-per-entry-with-a-one-line-title rule's general trigger** — write an entry whenever a real decision is made, and when in doubt, log it. That is enough to produce the entries and not enough to make them reliable, since it rests on each writer reaching the same judgment about what counts.

**Stating it once covers every item.** The triggers above do not vary by what an item is tagged, and the exclusions are the more valuable half. Written into the the-items-directory-holds-one-file-per-item rule as well they would be two copies to keep true, which this system has already had drift on. This is the shape the working-state-artifacts-carry-a-provenance-footer rule takes for the same reason.

**Why:** the log is the project's record of what was decided and when, and direction is the most consequential thing a project decides. An artifact holds what the direction *is*. The log holds *when it moved*, which the artifact cannot carry — a resolution added today and one added in March read identically in the file, and their dates say when each was settled rather than what prompted it.

The exclusions are what keep the obligation worth having. A log that carried every completed task and every reworded paragraph would stop being skimmable, which is the one property a log of short entries is for.

**The mood is required because the log is the artifact a reader finds holding nothing else.** Every other record carries a `**State:**` line saying whether the thing exists. A log entry carries a title. Where the title asserts what a record only settles, the reader has nothing to weigh it against, and reads a proposal as the system's behavior.

**How to apply:** when an item is created, write a matching one-line entry in `slasher/local/logs/log/`. Write one for each `Settled` resolution added afterward, and one for each change of the `**State:**` line.

Write none for a completed task, and none for prose that settles nothing.

Name the record in the entry, and say what happened to it. State what the record settles as the record's, never as the system's behavior, and carry that into the commit subject the entry travels in. Fix no template for the wording.

## Compressed

1. An item in `slasher/local/items/` pairs with a one-line entry in `slasher/local/logs/log/`.
2. Write the entry at three moments, and at no others.
3. The item's kind tag, such as `[design]`, `[plan]`, or `[aspiration]`, makes no difference, and an item with no kind tag takes the same entries.
4. Write the entry on the item's creation.
5. Write the entry on each dated `Settled` resolution added after the item is created.
6. Write the entry on each change of the item's `**State:**` line.
7. A change of state is the line reaching any state word the items rule names: Open, Active, a concluding state such as Realized, Done, Corrected, Resolved, or Completed, or Deferred, Suspended, Discontinued, Superseded, Abandoned, or Obsolete.
8. A change of state is also the line taking a state back, by resume.
9. A design and a note are `Recorded` and never move, so each takes a creation entry only.
10. Do not log a completed checkbox task, because it carries out a direction already settled.
11. Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section.
12. The provenance footer records those unlogged changes.
13. The entry names the record and what happened to it: the record was written, or its state reached a word.
14. What the record settles may follow, attributed to the record.
15. Never state an unbuilt direction in the indicative mood.
16. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not.
17. The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software.
18. An item is not a change to the software, so do not use that form for it.
19. The fact about an item is that it was recorded, or that its state moved.
20. Carry the same into the commit subject the entry travels in: name the record, attribute what it settles to the record, and keep the mood. An entry corrected while its commit subject makes the same claim is half corrected.
21. Fix no wording template. *X is recorded as an item, Open because …* and *X is realized* are forms in use.
22. This rule states the obligation once, for every item.
23. The a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule, the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule state their own entries.
24. The the-items-directory-holds-one-file-per-item rule points here and keeps no second copy.
25. The the-log-holds-one-file-per-entry-with-a-one-line-title rule's general trigger is to log whenever a real decision is made, and when in doubt. It rests on each writer's judgment, so it does not make the entries reliable.

## Compression

- 2026-10-21, compressed: compression 0.62, change 0.80, solubility 17 → 35, clarity 0.23 → 0.20
- 2026-10-22, checked: 19 directives, 18 kept, 1 less precise, 0 lost
- 2026-10-22, revised: rewritten in short sentences, compression 0.59, solubility 35 → 44, clarity 0.20 → 0.47; checked: 19 directives, 16 kept, 3 less precise, 0 lost
- 2026-10-22, revised: restored directive 5, compression 0.58, change 0.80
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-27, revised: the log is one file per entry, of short entries, not one line or one file per decision, a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 44 → 51, clarity 0.47 → 0.70; checked: 20 directives, 18 kept, 2 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 20 directives, 19 kept, 1 less precise, 0 lost, 1 repair
- 2026-10-30, revised: Lapsed is renamed Obsolete; checked: 16 directives, 14 kept, 2 less precise, 0 lost, 2 repairs; re-checked: 16 directives, 14 kept, 2 less precise, 0 lost. Left less precise: the commit form's passive voice, which the git rules state, and "substantive" before section, neither of which changes what is logged
- 2026-11-07, revised: the entry for a reconciliation at a work session's close is removed, with that reconciliation, as the engineer directed; checked: 17 directives, 16 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: that what the record settles is never stated as the system's behavior, which points 14 to 16 carry by attributing it to the record and barring the indicative for an unbuilt direction
- 2026-11-09, revised: the Discontinued state, which the engineer added; not re-checked
- 2026-11-09, revised: any state the items rule names, and any state taken back by resume, is a change of state; not re-checked
- 2026-11-09, checked: 17 directives, 17 kept, 0 less precise, 0 lost
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Mon Nov 9 2026 the states that made a change of state were listed here, and only Realized, Deferred, Discontinued, Open, and a work item's Done were taken back.

Until Mon Nov 9 2026 an item had no Discontinued state.

Until Sat Nov 7 2026 a reconciliation at a work session's close that found the direction still standing was logged. The engineer removed that reconciliation as obsolete, and the entry with it.

Until Fri Oct 30 2026 the state word Obsolete was Lapsed.

Until Sun Oct 25 2026 this rule was named an-item-takes-a-log-entry and titled "An item takes a log entry — on creation, on each settled resolution, and on a change of state — and the entry names the record rather than asserting what the record settles".

Until Mon Oct 26 2026 this rule was named an-item-takes-a-log-entry-on-creation-on-each-settled-resolution-and-on-a-change-of-state and titled "An item takes a log entry on creation, on each settled resolution, and on a change of state".

Until Tue Oct 27 2026 this rule described the log as "a one-line-per-decision record". An entry can carry a body, and not every entry records a decision, so the engineer settled the wording on short entries, one file each.
- **Thu Oct 29 2026** — the tag for a piece of work to be done was `[work-item]`, and the record was called a work item. It is `[work]`, at the engineer's direction.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's form, and the general trigger this makes specific
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the entry a removal takes, which is the whole of that act
- the a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule, a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the three that already state their own pairing
- the working-state-artifacts-carry-a-provenance-footer rule — the same shape, one obligation stated once across several conventions
- the `git` package's write-subject-first-commit-messages and a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rules — the grammar that is right for a change to the software and wrong for a record that settles one
- the the-items-directory-holds-one-file-per-item rule — the record whose states an entry reports, and which this rule's name predates

---

Authored by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:38:02 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:07 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:53 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:33:23 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:15:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:49:53 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:27:16 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:39:29 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:49 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:43 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:02:10 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:34:30 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:29 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:26:13 AM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 3:13:33 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:00:03 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
