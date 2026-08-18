# A direction artifact and a sequencing artifact each take a log entry — on creation, on each settled resolution, and on a change of state

A **direction artifact** — a design, an aspiration, or an orientation — and a **sequencing
artifact** — a plan, an intention, or an action — each pair with a one-line entry in
`waytide/local/logs/log/`. The entry is written at three moments, and at no others.

- **On creation.** That direction is settled at all, or that a settled direction is now being
  sequenced, is itself a decision. The record is written **Active**, and the entry records the
  artifact rather than the word.
- **On each `Settled` resolution.** A dated resolution is the unit a direction artifact records
  decisions in, so each one is a decision the log carries.
- **On a change of state.** The canonical `**State:**` line reaching **Active**, **Realized**, **Deferred**,
  **Superseded**, **Abandoned**, or **Suspended** — and **Implemented** in Realized's place for a
  sequencing artifact — is a decision. So is either reversible word being taken back: **Realized**
  when a design expands, and **Deferred** when the work is taken up.

## What is not logged

**A completed task is not a decision.** A sequencing artifact's checkbox tasks are execution
against direction already settled. Logging each one would put the build's every increment in a
record whose unit is the decision, and the plan already carries them.

**Prose that settles nothing is not a decision.** Reconciling a Background & Motivation section,
correcting a summary, or rewording a substantive section changes how the artifact reads and
changes no direction. The provenance footer records that the file was changed, which is what
that footer is for.

**A reconciliation that finds nothing is the exception worth naming, and it is logged.** The
work-sessions-convention puts the design reconciliation to the engineer at each work session's
close, and *the direction stands* is a real answer to it. That the artifacts were read against
new work and found still standing is not recoverable from the artifacts, since nothing in them
changed. This project's `The aspirations stand against …` entries are that case.

## Why the obligation is stated here rather than in each convention

**Four conventions already name their own log entry, and two did not.** The
observations-convention, the rules-convention, the deferred-queue-convention, and the
a-suspension-is-a-log-entry rule each state the pairing inline. The two planning conventions required the
artifact, its dated resolutions, and its footer, and named no entry. Those conventions were
decommissioned on 2026-08-18 with the mode mechanism, and this obligation outlived them.

**What reached the log anyway was the decision-log-convention's general trigger** — write an
entry whenever a real decision is made, and when in doubt, log it. That is enough to produce the
entries and not enough to make them reliable, since it rests on each writer reaching the same
judgment about what counts.

**Stating it once covers both artifacts and both conventions.** The triggers above are the same
for a direction artifact and a sequencing artifact, and the exclusions are the more valuable half.
Written into each convention separately they would be two copies to keep true, which this system
has already had drift on. This is the shape the
working-state-artifacts-carry-a-provenance-footer rule takes for the same reason.

**Why:** the log is the project's record of what was decided and when, and direction is the most
consequential thing a project decides. An artifact holds what the direction *is*. The log holds
*when it moved*, which the artifact cannot carry — a resolution added today and one added in
March read identically in the file, and their dates say when each was settled rather than what
prompted it.

The exclusions are what keep the obligation worth having. A log that carried every
completed task and every reworded paragraph would stop being skimmable, which is the one property
a one-line-per-decision record is for.

**How to apply:** when a direction artifact or a sequencing artifact is created, write a matching
one-line entry in `waytide/local/logs/log/`. Write one for each `Settled` resolution added afterward,
and one for each change of the `**State:**` line.

Write none for a completed task, and none for
prose that settles nothing. Write one where a reconciliation finds the direction still standing,
naming what it was read against.

Related:

- the decision-log-convention — the entry's form, and the general trigger this makes specific
- the a-suspension-is-a-log-entry rule — the entry a removal takes, which is the whole of that act state words they carried
- the observations-convention, rules-convention, deferred-queue-convention, and
  a-suspension-is-a-log-entry — the four that already state their own pairing
- the working-state-artifacts-carry-a-provenance-footer rule — the same shape, one obligation stated once across several conventions
- the work-sessions-convention — the reconciliation prompt whose *the direction stands* answer is logged

---

Authored by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
