# The implementations directory holds one record per implementation

**Trigger:** When starting an experiment or feature, or writing or changing an implementation record

`slasher/local/implementations/` holds **implementation records**: one file per implementation, carrying how it began, where it is being worked, and what became of it. An implementation is a bounded unit of work with a lifecycle, and the record is a persisted, dated artifact kept after it concludes.

**Two kinds, and a tag says which.** An **experiment** is tagged `[experiment]` and a **feature** is tagged `[feature]`. The tags are the ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule). **They name what the work is, and no rule reads them to decide how it runs.**

**Either kind opens with a question or an intent, whichever the work has.** An experiment may be built to an intent, and a feature to a question.

**As the engineer stated it:** change features and experiments so that both can have either an intent or a question. And: an intent can also bring a forecast and verdict.

**Whether the work states a forecast is asked at the start, and whether it reaches a verdict is asked at its end. The lifecycle reads both.** The forecast question is put to the engineer at the start and recorded as a confirmation, beside the working location and the participation. Only work with a forecast is asked the verdict question, when its work is complete. Neither follows from the kind, or from whether the work opens with a question or an intent.

## The record

Open with the **Question** or the **Intent**, then the setup:

- a **`**State:**`** line
- the **upstream branch** it merges into — `master` or another topic branch
- the **implementation branch**
- its **base**
- the **working location** chosen at the start
- **whether it states a forecast**, asked at the start, and the forecast where it states one
- **whether it reaches a verdict**, asked at the end of work with a forecast
- a **`**Tags:**`** line carrying `[experiment]` or `[feature]`

**Work with a forecast states it** — what is expected to happen — **before** the work. As the work proceeds it records what actually happened against that forecast, then the findings and any post-hoc misses. The outcomes the forecast did not account for are usually the most informative.

**Work without a forecast states none of that.** There is no comparison against a forecast, and no findings or misses. It concludes Completed, unless the engineer concludes it with a verdict word, which any implementation can take.

**Every record carries the confirmations the lifecycle required**, so the work's authority is auditable: the working-location selection at the start, the attended-or-unattended selection at the start, the forecast selection at the start, the verdict selection at the end where the work has a forecast, adding a worktree to work already under way, and branch deletion with worktree removal. **Work that reaches a verdict also records** the affirmation declaration, concluding a superseded one, and merging untested code.

## The state

**The state sits on a canonical `**State:**` line**, carrying one word and nothing else — `- **State:** Suspended`. It is written with the record, and changes as the record reaches another word. That line is the only authoritative statement of the state: the same words run through a record's prose freely, and nothing else in the file can be read as the state.

**`new` creates the branch and writes the record `Open`.** `start` makes it `Active`, the in-progress state, as it is for an item. Absence is not a state, and a record without a line is a defect.

**The state words every implementation takes:**

- **Open** — the record and the branch exist, and the work has not started.
- **Active** — the work is in progress.
- **Deferred** — kept to do later, with no one working toward it.
- **Suspended** — paused, not ended.
- **Discontinued** — stopped, with no plan to do it. It is not current work, so the list of current work and the session-start notice leave it out. What it recorded may be merged.
- **Obsolete** — it lost its relevance over time, as the work moved past it with no one deciding.
- **Superseded** — replaced by another implementation. The two records name the counterpart. An implementation can be superseded at any time, without first being suspended.
- **Abandoned** — dropped before concluding, by decision. Not merged, and the record is kept.

**Deferred and Discontinued differ in intent.** A Deferred implementation is kept to do later. A Discontinued one has no plan to do it.

**The concluding words:**

- **Completed** — integrated into the upstream branch. The ordinary conclusion.
- **Affirmed** — the question held, or the intent was met, as forecast where there is a forecast. The engineer declares it.
- **Refuted** — the question was disproven, or the intent was not met.
- **Inconclusive** — it ran and gave no clear verdict either way.

**Any implementation can take any concluding word, whether or not it has a forecast.** The engineer concludes it Affirmed, Refuted, or Inconclusive with `affirm`, `refute`, or `inconclusive`. **`complete` concludes an implementation without a forecast as Completed.** Where it has a forecast, the agent asks which concluding word it takes: Completed, Affirmed, Refuted, or Inconclusive.

**Where the implementation is created for an item, the item takes `Implementation`**, and the two records name each other. When the implementation is Completed or Affirmed, the item takes its kind's concluding state. When it reaches another concluding state, or is set aside, the agent asks the engineer what state the item takes. See the the-items-directory-holds-one-file-per-item rule.

**An item already on `master` takes each of these state changes on `master` too**, not only on the implementation's branch. Rename the item and write its log entry on `master`, with the same content as on the branch, so the two match when the branch merges. Contributors read `master`, so the items there show the state each item is in now.

**As the engineer stated it:** The records already on master should be up to date, because contributors all have access to master, and will need to understand the correct and current state of items.

**Any state but Open and Active can be taken back**, by `resume`, which returns the implementation to Active. What resuming a Completed implementation does to its merged branch is settled when it first occurs.

**Where the engineer asks for an implementation to be concluded and names no state, the state is put to the engineer through the selection interface.** Each concluding state the implementation can take is an option. The agent does not choose the state, and does not conclude the implementation before the engineer selects one. *Conclude the feature* names no state. *The feature is completed* names one.

**As the engineer stated it:** When an item or an implementation is concluded without the engineer having given the concluding state, present the engineer with the state options using AskUserQuestion.

## Runs

**Runs are optional and belong to work that reaches a verdict.** Split an implementation into runs only when its question or intent is held fixed and one factor is varied to compare. Each run is its own branch from the same base, carries its own forecast, and is titled `Run 1`, `Run 2`, and so on. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

**The same work's design belongs in a loop record** under `slasher/local/logs/loops/` — each cycle's hinge, the options put to the engineer, and the decision. The two divide by concern and each names the other.

**They are separate files because of the package graph, and that is a refused dependency.** `slasher/local/logs/loops/` is contributed by `design-by-efferent`, which includes `foundation` rather than the reverse. A foundation rule requiring fields in that directory would invert the graph, and would make the implementation lifecycle unavailable to a project that installs `foundation` alone. Naming the loop record in prose is a **citation** and costs nothing.

## Format

The same frontmatter-free markdown as rules — a `# Experiment — <name>` or `# Feature — <name>` title, then prose and tables. **The kind reads in the title and is stated as data in the `**Tags:**` line**, and a record whose title says one kind and whose tag says another is a defect in the record. The filename takes the ISO-8601-UTC prefix (see the file-names rule) and the state suffix. End the file with the provenance footer, and pair it with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

**Why:** an experiment and a feature share one lifecycle. What differs between two implementations is whether the work is judged against a forecast, and that is a decision about this piece of work rather than about its kind. A forecast recorded at the start keeps a verdict possible, and the verdict is decided at the end, when the work has shown what it shows. The kind keeps naming what the work is.

**How to apply:** record every implementation here, tagged `[experiment]` or `[feature]`. Open with the question or the intent, then the branch topology, the working location, and whether it states a forecast. Forecast before the work where the engineer gives one, and record what happened against it. Record the verdict selection at the end, where the work has a forecast.

Write the state line as `Open` when `new` writes the record, make it `Active` when the work starts, and update it as the state changes. Record each confirmation the lifecycle requires.

## Compressed

1. `slasher/local/implementations/` holds implementation records, one file per implementation.
2. A record carries how the implementation began, where it is being worked, and what became of it.
3. An implementation is a bounded unit of work with a lifecycle.
4. The record is a persisted, dated artifact, kept after the implementation concludes.
5. An experiment is tagged `[experiment]`, and a feature is tagged `[feature]`. These are ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule).
6. The tags name what the work is. No rule reads them to decide how the work runs.
7. Either kind opens with a question or an intent, whichever the work has.
8. Whether the work states a forecast is asked at the start. Put it to the engineer, and record it as a confirmation beside the working location and the participation.
9. Whether the work reaches a verdict is asked at the end, of work with a forecast only, and recorded as a confirmation. The lifecycle reads both. Neither follows from the kind, or from whether the work opens with a question or an intent.

## The record

1. Open with the **Question** or the **Intent**.
2. Then give the setup: a `**State:**` line, the upstream branch it merges into, the implementation branch, its base, the working location chosen at the start, and whether it states a forecast. Add whether it reaches a verdict at the end.
3. The upstream branch is `master` or another topic branch.
4. The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
5. Work with a forecast states it, what is expected to happen, before the work.
6. As the work proceeds, it records what actually happened against the forecast.
7. It then records the findings and any post-hoc misses, including outcomes the forecast did not account for.
8. Work without a forecast records no comparison against one, and no findings or misses. It concludes Completed, unless the engineer concludes it with a verdict word.
9. Every record carries the confirmations the lifecycle required, so the work's authority is auditable.
10. Every record carries these: the working-location selection, the attended-or-unattended selection, and the forecast selection, each at the start, and the verdict selection at the end where the work has a forecast.
11. Every record also carries these: adding a worktree to work already under way, and branch deletion with worktree removal.
12. Work that reaches a verdict also records the affirmation declaration, concluding a superseded implementation, and merging untested code.

## The state

1. The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`.
2. Write the line with the record, as `Open`, and change it as the record reaches another word.
3. That line is the only authoritative statement of the state.
4. The state words may appear freely in the record's prose. Nothing else in the file is read as the state.
5. `Active` is the in-progress state, as it is for an item.
6. A record without a line is a defect. Absence is not a state.
7. Do not invent a state word.
8. `new` creates the branch and writes the record `Open`. `start` makes it `Active`.
9. The filename carries the state suffix, as `-OPEN` or `-ACTIVE` (see the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule).
10. The state words every implementation takes are these.
    - **Open**: the record and the branch exist, and the work has not started.
    - **Active**: the work is in progress.
    - **Deferred**: kept to do later, with no one working toward it.
    - **Suspended**: paused, not ended.
    - **Discontinued**: stopped, with no plan to do it. It is not current work: the list of current work and the session-start notice leave it out. What it recorded may be merged.
    - **Obsolete**: it lost its relevance over time, with no one deciding.
    - **Superseded**: replaced by another implementation. Each of the two records names its counterpart. Supersede at any time, without suspending first.
    - **Abandoned**: dropped before concluding, by decision. It is not merged, and the record is kept.
11. The concluding words are these, and any implementation takes any of them, whether or not it has a forecast.
    - **Completed**: integrated into the upstream branch. It is the ordinary conclusion.
    - **Affirmed**: the question held, or the intent was met, as forecast where there is one. The engineer declares it.
    - **Refuted**: the question was disproven, or the intent was not met.
    - **Inconclusive**: it ran and gave no clear verdict either way.
12. The engineer concludes an implementation Affirmed, Refuted, or Inconclusive with `affirm`, `refute`, or `inconclusive`. `complete` concludes work without a forecast as Completed. Where the work has a forecast, ask which concluding word it takes.
13. Where the implementation is created for an item, make the item Implementation, and name each record in the other. When the implementation is Completed or Affirmed, conclude the item in its kind's concluding state. Otherwise, at its conclusion or when it is set aside, ask the engineer what state the item takes.
    - Where the item is already on `master`, make each of these state changes on `master` too, not only on the implementation's branch. Commit the same item content and the same log entry on both, so the merge matches.
14. `resume` takes back any state but Open and Active, to Active. What resuming a Completed implementation does to its merged branch is settled when it first occurs.
15. Where the engineer asks for an implementation to be concluded and names no state, put the concluding states it can take to the engineer through the selection interface. Do not choose the state, and do not conclude the implementation before the engineer selects one. *Conclude the feature* names no state. *The feature is completed* names one.

## Runs

1. Runs are optional.
2. Only work that reaches a verdict has runs.
3. Split an implementation into runs only when its question or intent is held fixed and one factor is varied to compare.
4. Each run is its own branch from the same base.
5. Each run carries its own forecast.
6. Runs are titled `Run 1`, `Run 2`, and so on.
7. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

1. The same work's design belongs in a loop record under `slasher/local/logs/loops/`.
2. A loop record holds each cycle's hinge, the options put to the engineer, and the decision.
3. The implementation record and the loop record divide by concern. Each names the other.
4. Keep them as separate files. `slasher/local/logs/loops/` belongs to `design-by-efferent`, which includes `foundation`, not the reverse.
5. A foundation rule must not require fields in that directory. That dependency is refused.
6. Naming the loop record in prose is a citation and is permitted. It is the only reference permitted.

## Format

1. Use the same frontmatter-free markdown as rules: a title, then prose and tables.
2. The title is `# Experiment — <name>` or `# Feature — <name>`.
3. The kind reads in the title and is stated as data in the `**Tags:**` line.
4. A record whose title and tag name different kinds is defective.
5. The filename takes the ISO-8601-UTC prefix (see the file-names rule).
6. The filename also takes the state suffix.
7. End the file with the provenance footer.
8. Pair the record with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

## Compression

- 2026-10-24, compressed: compression 0.12, change 0.48, solubility 22 → 46, clarity 0.32 → 0.78, 54 directives, 54 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-25, revised: points 7 and 10 take the new wording, that Suspended is a state; not checked
- 2026-10-27, re-checked: 58 directives, 58 kept, 0 less precise, 0 lost
- 2026-10-27, revised: Active is the in-progress state; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-10-27, revised: `[experiment]` and `[feature]` are no longer called reserved tags, a term the engineer settled; not checked
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 46 → 46, clarity 0.78 → 0.79; checked: 55 directives, 54 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 46 → 46, clarity 0.79 → 0.79; checked: 41 directives, 41 kept, 0 less precise, 0 lost
- 2026-10-29, revised: either kind opens with a question or an intent, and the verdict is chosen at the start; checked: 52 directives, 52 kept, 0 less precise, 0 lost
- 2026-11-06, revised: a concluding state the engineer did not name is put to the engineer through the selection interface; checked: 76 directives, 75 kept, 0 less precise, 1 lost, 1 repair; re-checked: 76 directives, 76 kept, 0 less precise, 0 lost
- 2026-11-08, revised: the forecast is asked at the start and the verdict at the end; not re-checked
- 2026-11-09, revised: the Discontinued state, which the engineer added; not re-checked
- 2026-11-09, revised: a record starts Open, takes Deferred and Obsolete, takes any concluding word, and is superseded without suspension, as the harmonized-states plan settles; not re-checked
- 2026-11-09, revised: an item an implementation is created for takes Implementation, and follows it; not re-checked
- 2026-11-09, checked: 70 directives, 67 kept, 2 less precise, 1 lost, 1 repair: the affirm, refute, and inconclusive commands are named; re-checked: 70 directives, 67 kept, 2 less precise, 1 lost. The directive left lost is when the rule applies, which its Trigger line carries
- 2026-11-13, revised: an item already on `master` takes its implementation's state changes on `master` too; not re-checked

## History

Until Fri Nov 13 2026 an item's state change for its implementation was made on the implementation's branch only, so `master` showed the item's earlier state until the branch merged.

Until Mon Nov 9 2026 an implementation did not change the state of the item it was created for.

Until Mon Nov 9 2026 a record was written Active when its work started, took no Open, Deferred, or Obsolete, and took a verdict word only where it had a forecast and Completed only where it had none. Resume took back Suspended and Discontinued only.

Until Mon Nov 9 2026 an implementation had no Discontinued state. A paused implementation could only be Suspended, which stays in the list of current work.

Until Sun Nov 8 2026 whether the work forecast and reached a verdict was one choice, made at the start.

Until Thu Oct 29 2026 an experiment was built to a question and a feature to an intent, and that one difference decided the forecast, the verdict, the state words, and runs. The engineer settled that either kind opens with a question or an intent, that whether it forecasts and reaches a verdict is chosen at the start, and that the tags stay as names no rule reads.

Until 2026-10-25 Abandoned, Superseded, and Suspended were listed as "the concluding words both kinds take", though Suspended is defined as paused, not ended, and the filename took its state suffix "once the record concludes". That left open whether a suspended record takes the suffix, which the a-record-ends-with-its-state-in-upper-case rule gives to any record carrying a state line. The engineer settled that Suspended is a state and not a conclusion, and that the suffix follows the state line.

Until Sun Oct 25 2026 this rule was named implementations-convention and titled "`waytide/local/implementations/` — the record of an implementation's lifecycle".

Until Mon Oct 26 2026 this rule was named the-implementations-directory-records-each-implementations-lifecycle and titled "The implementations directory records each implementation's lifecycle".

Until 2026-10-26 the absence of a state line was an implementation's in-progress state. The line was added when the record reached a word, and an open record took no filename suffix. The engineer settled that implementations take the Active state, as items do, which makes the in-progress state a word on the line and in the filename.

Until Tue Oct 27 2026 this rule called `[experiment]` and `[feature]` reserved tags. The engineer settled that a tag means what a rule about it says, with no reserved category.

Related:

- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the lifecycle this records
- the a-record-may-be-categorized-with-square-bracket-tags rule — how a tag is written
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the filename suffix the state line gives
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — the notice that reports an open implementation
- the design-by-efferent a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — the design record for the same work, which names this one
- the the-items-directory-holds-one-file-per-item rule — the other record that carries a state, and whose in-progress state is also Active

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:38:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:55:37 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:38:42 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:29:16 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:36:13 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 2:59:48 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:00:40 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:25:25 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:19:24 PM PT
