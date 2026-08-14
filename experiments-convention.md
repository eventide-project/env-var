# `waytide/local/experiments/` — recorded experiments that test a question

`waytide/local/experiments/` holds **experiment records**. Each is deliberate work that tests a stated question or hypothesis about the code, or about the way of working. It carries a forecast made before the work, and the observed outcome after. An experiment record is a **persisted, dated artifact**, not throwaway scratch.

- **When to use:** you want to *learn* something the code alone won't tell you — whether an approach helps, where a process actually needs human attention, how a proposal behaves under real work. Frame it as a question and pursue it deliberately.
- **The default is one branch, worked to a verdict.** An experiment is normally a single line of work on its own branch, continued until the question is **resolved** — no run structure, no numbering. Most experiments are exactly this.
- **Record format:** open with the **Question**, the hypothesis, and the setup:
  - a **`**State:**` line**
  - the **upstream branch** it will merge into — `master` or another topic branch
  - the **experiment branch**
  - its **base**
  - the **working location** chosen at the start — branch only, or branch and worktree with the
    worktree's path

  State the **forecast** *before* the work — what you expect to happen. As the work proceeds,
  record **what actually happened** against the forecast. A per-decision or per-outcome table
  reads well. Then record **findings**, the **final state**, and any post-hoc **misses**. The
  outcomes the forecast did not account for are usually the most informative.
- **The state sits on a canonical `**State:**` line**, in the setup block, carrying one of the six state words and nothing else — `- **State:** Suspended`. **It is added when the record reaches one of those words**, and updated as the state changes after that — not when the experiment is started, because none of the six describes a record that has just been created. **That line is the only authoritative statement of the state**: the same words run all through a record's forecast, options, and findings prose ("would be **affirmed**", "predicted verdict: **refuted**"). Nothing else in the file can be read as the state. **Absence is the in-progress state**, so a record still being worked carries no line at all — do not add one to say so, and do not invent a word for it. That the state is legible at a glance and readable mechanically is what the line is for. The session-start notice reads this line to report open experiments (see the announce-waytide-at-session-start rule).
- **The working location is a short history, not a single fact.** It is written at the start, and changes only by a worktree being added for an experiment already under way — either because main-sequence work arrived and the user intends to keep working the experiment alongside it, or because the experiment was **escalated** — judged to need more isolation than the single working tree gives it (see the experiment-lifecycle rule, where the term is defined). The record then **gains a line** naming the worktree and its path. The original line is not rewritten, and the conclusion dispatches on the current location. (Suspension is the alternative to the first of those only — it answers an interruption, leaves the working location unchanged, and is recorded as the state.)
- **Lifecycle in the record:** the record also carries the experiment's lifecycle facts. The first is the **user confirmations** the work required — the working-location selection at the start, the attended-or-unattended selection at the start, the affirmation declaration, concluding a superseded experiment, merging untested code, suspension, adding a worktree to an experiment under way, and branch deletion with worktree removal. The second is the experiment's **state**, characterized as **Affirmed**, **Refuted**, **Inconclusive**, **Abandoned**, **Superseded**, or **Suspended**, so it is legible at a glance. On **Affirmed** the record's log is **copied into the project decision log** (`waytide/local/log/`). A **Refuted**, **Inconclusive**, **Abandoned**, or **Superseded** record is kept as evidence. When one experiment **supersedes** another, **the two records name the counterpart**, and the superseded one stays **Suspended** until the user explicitly concludes it as superseded. The lifecycle itself — branching, the states, the merge gate, DBE governance — is the experiment-lifecycle rule.
- **Runs are optional, not the default.** Split an experiment into **runs** only when you deliberately hold the question fixed and **vary one factor to compare** (e.g. an "AI-proposes" baseline versus an "originate-blind" run). Then each run is its own branch from the **same base**, carries its **own forecast**, and is titled `Run 1`, `Run 2`, …. A run is a deliberate variation, not a retry.
- **Format:** the same frontmatter-free markdown as rules — a `# Experiment — <name>` title (add `, Run N` only when the experiment actually has multiple runs), then prose and tables. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.

**Why:** a forecast recorded before the work is what turns work into an experiment. The gap between forecast and outcome is the finding, and it is only trustworthy if the forecast was committed in advance. Persisting the record (rather than discarding it as scratch) converts a one-off observation into evidence that can be cited and refined. Most questions resolve in a single branch. Multiple runs are the exception, reserved for when comparing a changed factor is worth the extra structure.

**How to apply:** when a question is worth a deliberate try, add a record here. It states the question. It names the upstream, experiment, and base branches, and the working location chosen at the start. It commits a forecast before the work. It then captures the observed outcome, findings, and misses against that forecast.

Work it on one branch to a verdict. Reach for runs only when deliberately comparing a varied factor. Record the user confirmations.

Add the canonical `**State:**` line when the record reaches one of the words. Those are **Affirmed**, **Refuted**, **Inconclusive**, **Abandoned**, **Superseded**, and **Suspended**. Update it as the state changes after that. Leave a record still being worked without the line, since absence is the in-progress state.

On affirmation, copy the experiment's log into `waytide/local/log/`. Keep it even after — it is evidence, not scratch.

Related:

- the experiment-lifecycle rule — the lifecycle
- the observations-convention — working hypotheses not yet binding
- the plans-convention
- the decision-log rule

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 7:41:05 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 10:12:41 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:17:08 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:18:56 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:03:25 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:44:33 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:50:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 2:01:18 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:38:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
