# `waytide/local/implementations/` — the record of an implementation's lifecycle

`waytide/local/implementations/` holds **implementation records**: one file per implementation, carrying how it began, where it is being worked, and what became of it. An implementation is a bounded unit of work with a lifecycle, and the record is a persisted, dated artifact kept after it concludes.

**Two kinds, and a tag says which.** An **experiment** is tagged `[experiment]` and is built to a **question**. A **feature** is tagged `[feature]` and is built to an **intent**. The tags are the ordinary square-bracket tags (see the a-record-takes-category-tags rule), and they are **reserved**: the lifecycle turns on which one a record carries.

**That one difference accounts for every other.** A question is forecast and reaches a verdict. An intent is not forecast and reaches no verdict. Everything the two kinds do differently follows from it, and nothing else does.

## The record

Open with the **Question** or the **Intent**, then the setup:

- a **`**State:**`** line
- the **upstream branch** it merges into — `master` or another topic branch
- the **implementation branch**
- its **base**
- the **working location** chosen at the start
- a **`**Tags:**`** line carrying `[experiment]` or `[feature]`

**An `[experiment]` also states a forecast** — what is expected to happen — **before** the work. As the work proceeds it records what actually happened against that forecast, then the findings and any post-hoc misses. The outcomes the forecast did not account for are usually the most informative.

**A `[feature]` states none of that.** Nothing is being tested, so there is nothing to predict and nothing to compare a prediction against.

**Both record the confirmations the lifecycle required**, so the work's authority is auditable: the working-location selection at the start, the attended-or-unattended selection at the start, adding a worktree to work already under way, branch deletion with worktree removal, and — for an experiment — the affirmation declaration, concluding a superseded one, and merging untested code.

## The state

**The state sits on a canonical `**State:**` line**, carrying one word and nothing else — `- **State:** Suspended`. It is added when the record reaches one of the words, not when the work starts. That line is the only authoritative statement of the state: the same words run through a record's prose freely, and nothing else in the file can be read as the state.

**Absence is the in-progress state**, so work still under way carries no line. Do not add one to say so, and do not invent a word. **This is where an implementation differs from an idea**, which carries a state from the moment it is written — the session-start notice reports an open implementation, so absence here is answered elsewhere. See the a-record-ends-with-its-state-in-upper-case rule, which gives an open record no filename suffix for the same reason.

**The concluding words both kinds take:**

- **Abandoned** — dropped before concluding. Not merged, and the record is kept.
- **Superseded** — replaced by another implementation. The two records name the counterpart.
- **Suspended** — paused, not ended.

**The words an `[experiment]` alone takes**, because each judges a **question**:

- **Affirmed** — the question held. User-declared.
- **Refuted** — the question was disproven.
- **Inconclusive** — it ran and gave no clear verdict either way.

**The word a `[feature]` alone takes:**

- **Completed** — integrated into the upstream branch. The ordinary conclusion.

**A feature has no verdict words and an experiment has no `Completed`**, and neither is an oversight. *Affirmed*, *refuted*, and *inconclusive* judge a question a feature never asked. *Completed* names an intent finished, which is not what an experiment reaches.

## Runs

**Runs are optional and are an experiment's alone.** Split an implementation into runs only when the question is held fixed and one factor is varied to compare. Each run is its own branch from the same base, carries its own forecast, and is titled `Run 1`, `Run 2`, and so on. A run is a deliberate variation, not a retry. A feature has no question to hold fixed.

## It is the lifecycle record, not the design record

**The same work's design belongs in a loop record** under `waytide/local/logs/loops/` — each cycle's hinge, the options put to the engineer, and the decision. The two divide by concern and each names the other.

**They are separate files because of the package graph, and that is a refused dependency.** `waytide/local/logs/loops/` is contributed by `design-by-efferent`, which includes `foundation` rather than the reverse. A foundation rule requiring fields in that directory would invert the graph, and would make the implementation lifecycle unavailable to a project that installs `foundation` alone. Naming the loop record in prose is a **citation** and costs nothing. See the a-citation-is-not-a-dependency rule, which works this case through in full.

## Format

The same frontmatter-free markdown as rules — a `# Experiment — <name>` or `# Feature — <name>` title, then prose and tables. **The kind reads in the title and is stated as data in the `**Tags:**` line.** The title is prose and the tag is what the lifecycle reads, so a record whose title says one kind and whose tag says another is a defect in the record. The filename takes the ISO-8601-UTC prefix (see the file-names rule) and, once the record concludes, the state suffix. End the file with the provenance footer, and pair it with a log entry (see the implementation-records-take-a-log-entry rule).

**Why:** an experiment and a feature had two conventions and two lifecycles that agreed on almost everything. Both are bounded work on a branch, with a working location chosen at the start, a declared end, and recorded confirmations. What they did not share follows from one difference — a question against an intent — which a tag states and the lifecycle reads.

Four rules stating one lifecycle twice is four places to keep true, and the two pairs had already drifted in their wording of the same clauses.

**How to apply:** record every implementation here, tagged `[experiment]` or `[feature]`. Open with the question or the intent, then the branch topology and the working location. Forecast before the work where it is an experiment, and record what happened against the forecast.

Leave the state line off while the work is under way. Add it when the record reaches a word, and update it as the state changes. Record each confirmation the lifecycle requires.

Related:

- the implementation-lifecycle rule — the lifecycle this records
- the a-record-takes-category-tags rule — the tags, and what a reserved tag is
- the a-record-ends-with-its-state-in-upper-case rule — why an open record takes no suffix
- the announce-waytide-at-session-start rule — the notice that reports an open implementation
- the design-by-efferent loop-records rule — the design record for the same work, which names this one
- the ideas-convention — the other record that carries a state, and which has no in-progress absence

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
