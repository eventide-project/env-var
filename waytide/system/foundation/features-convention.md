# `waytide/local/features/` — the record of a feature's lifecycle

`waytide/local/features/` holds **feature records**: one file per feature, carrying how the
feature began, where it is being worked, and what became of it. A feature record is a
persisted, dated artifact, kept after the feature concludes.

- **When to use:** every feature. A feature is a bounded unit of main-line work, built to
  an **intent** rather than to a question — nothing is being tested, so nothing is
  forecast and no verdict is reached. That is what separates a feature from an experiment.
- **Record format:** open with the **Intent** — what is being built and why — then the setup:
  - a **`**State:**` line**
  - the **upstream branch** it will merge into — `master` or another topic branch
  - the **feature branch**
  - its **base**
  - the **working location** chosen at the start — branch only, branch and worktree with the
    worktree's path, or the current branch

  As the work proceeds, record the **confirmations** the lifecycle required and any change of
  working location.
- **The state sits on a canonical `**State:**` line**, in the setup block, carrying one of
  the four state words and nothing else — `- **State:** Suspended`. **It is added when the
  record reaches one of those words**, and updated as the state changes after that — not
  when the feature is started, because none of the four describes a record that has just
  been created. That line is the **only** authoritative statement of
  the state. **Absence is the in-progress state**, so a feature still being built carries no
  line at all — do not add one to say so, and do not invent a word for it. That the state
  is legible at a glance and readable mechanically is what the line is for. The session-start notice reads this line to report features
  that have not concluded (see the announce-waytide-at-session-start rule). **The filename also ends
  with that word in upper case** — see the
  a-record-ends-with-its-state-in-upper-case rule.
- **The four states.** **Completed** — integrated into the upstream branch, the ordinary
  conclusion. **Abandoned** — dropped before completion. The branch is not merged and the
  record is kept. **Superseded** — replaced by a different design. The two records name the
  counterpart. **Suspended** — paused, not ended. They are derived from what becomes of a
  feature, not borrowed from the experiment's verdict vocabulary: a feature is not proven
  or disproven, so *affirmed*, *refuted*, and *inconclusive* have nothing to say about it.
- **A feature may be built on the current branch**, which an experiment may not — a feature
  *is* the main line, so a branch prevents nothing already ordinary, where an
  experiment is a deviation that must stay reversible. Where the current branch is chosen the
  record names the branch being built on, and there is no base, no feature branch, and no
  merge to record. See the feature-lifecycle rule.
- **The working location is a short history, not a single fact.** It is written at
  the start. It changes only by a worktree being added for a feature already under way. That
  happens for one of two reasons: other work arrived that the user intends to work alongside it,
  or the feature was **escalated** — judged to need more isolation than the single working tree
  gives it. The record then **gains a line**. The original is not rewritten.
- **The human's level of participation is recorded as a confirmation** — **attended** or **unattended**, chosen at the start beside the working location. DBE is in effect either way. What the decision settles is whether the loop stops at each hinge. See the design-by-efferent attended-or-unattended-is-chosen-at-the-start rule.
- **It is the feature's lifecycle record, not its design record.** The same feature's design. Each cycle's hinge, the options put to the engineer, and the decision — belongs in a loop record under `waytide/local/loops/` (see the design-by-efferent loop-records rule).
  The two divide by concern and **each names the other**. They are separate files because
  `waytide/local/loops/` is contributed by `design-by-efferent`, which includes `foundation`
  rather than the reverse. A foundation rule requiring fields in that directory would
  invert the package graph, and would make the feature lifecycle unavailable to a project
  that installs `foundation` alone.
- **Format:** the same frontmatter-free markdown as rules — a `# Feature — <name>` title,
  then prose. The filename follows the ISO-8601-UTC prefix convention (see the
  file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like
  every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer
  rule.
- **Log entry:** pair the record with a one-line `waytide/local/log/` entry on creation and on
  each change of the `**State:**` line. At the conclusion the entry is a **summary marker** where
  the feature integrated, and it **carries the substance** — the intent, the outcome, and what
  was found — where it did not. See the experiment-and-feature-records-take-a-log-entry rule.

**Why:** a feature currently starts and stops without a declared state, which makes it
impossible to say what is in progress and what concluded. Recording the lifecycle in one
file per feature makes each legible. Keeping the record after the feature concludes
preserves how it was built, rather than only what it produced. Keeping it separate from the
loop record trades a second file per feature for a correct package dependency. That
is the more expensive of the two to get wrong.

**How to apply:** when a feature is started, add a record here. It states its intent, its
branch topology, and the working location chosen at the start. It carries no state line, since
absence is the in-progress state.

Add the line when the record reaches one of the four words. Update
it as the state changes after that. Record each confirmation the lifecycle requires, and name
the feature's loop record. Keep the record after the feature concludes.

Related:

- the feature-lifecycle rule — the lifecycle
- the a-record-ends-with-its-state-in-upper-case rule — the upper-case suffix the state line also takes
- the experiment-and-feature-records-take-a-log-entry rule — the log entry this record pairs with, and what its concluding entry carries
- the experiments-convention — the capability this mirrors, and where it deliberately differs
- the design-by-efferent loop-records rule — the design record for the same feature
- the decision-log rule

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:31:14 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:03:25 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:12:40 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 2:01:18 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:38:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:12:15 AM PT
