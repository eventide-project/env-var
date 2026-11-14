# When an implementation's phase starts, its goal is stated, and the phases are listed with the current one marked

**Trigger:** When starting a phase of an experiment or a feature, or when the engineer asks for the current phase or the list of phases, as with `/experiment status` or `/feature status`

**At the start of an experiment's or a feature's phase, state the goal of the phase to the engineer, before its work.** The goal is the phase's question or its intent, whichever it has, whatever the implementation's kind. For a question, the goal is what the phase is to establish. For an intent, it is what the phase is to build. Either way, say how it serves the implementation's question or intent.

**As the engineer stated it:** when starting an experiment's phase, state the goal of the phase.

**List the implementation's phases with it, in the order the record names them, and mark the current phase in the list.** The engineer then sees where the phase sits among the others, and which ones are done and which are still to come.

**As the engineer stated it:** also list the phases of the experiment, and indicate the current phase in that list.

**It is stated at each phase's start, and not only when the record is written.** The record names the phases and their order at the start of the implementation, and a phase with a forecast states it before its work. A phase can start many turns after the record was written, and the engineer then reads a branch switch and new work without the reason for either in front of them.

## On request

**When the engineer asks for the current phase, print its goal and its branch.** `/phase` and `/phase current` ask for it.

**When the engineer asks for the phases, list them in the record's order, with the current phase emphasized.** `/phases` asks for them.

**Why:** a phase is a question or an intent of its own that serves the implementation's, so its work is judged against that goal. Stated at the start, the goal is on screen when the engineer reads the phase's first work, and the work can be checked against it.

**How to apply:** when a phase starts, state its goal before its work, in the response that starts it. Say what the phase is to establish, or for an intent what it is to build, and how that serves the implementation's question or intent. List the implementation's phases in the record's order, and mark the current one.

**`/experiment status` and `/feature status` print the implementation's phases in the record's order, with the current phase emphasized, and the current phase's goal.** Where the implementation has no phases, they print its question or its intent, and its state.

## Compressed

1. At the start of an experiment's or a feature's phase, state the phase's goal to the engineer, before its work, in the response that starts it.
2. The goal is the phase's question or intent, whichever it has, whatever the kind. For a question, it is what the phase is to establish. For an intent, it is what the phase is to build. Say how it serves the implementation's question or intent.
3. List the implementation's phases with it, in the order the record names them, and mark the current phase, so the engineer sees which phases are done and which are still to come.
4. State the goal and the list at each phase's start, not only when the record is written. The record's naming of the phases, and a phase's forecast, do not stand in for them.
5. When the engineer asks for the current phase, as with `/phase` or `/phase current`, print its goal and its branch.
6. When the engineer asks for the phases, as with `/phases`, list them in the record's order, with the current phase emphasized.
7. `/experiment status` and `/feature status` print the phases in the record's order, the current one emphasized, and the current phase's goal. Without phases, they print the implementation's question or intent, and its state.

## Compression

- 2026-10-29, compressed during the merge from master; not checked
- 2026-10-29, merge from master re-checked: 5 directives, 5 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-29, revised: a feature's phase states its intent as its goal; checked: 7 directives, 5 kept, 2 less precise, 0 lost, 1 repair; re-checked: 7 directives, 6 kept, 1 less precise, 0 lost. Left less precise: the reason for marking the current phase, that the engineer sees which phases are done and which are to come, since the compressed text carries no reasons and this one constrains nothing.
- 2026-10-29, revised: a phase's goal is its question or its intent, whatever the kind; checked: 12 directives, 10 kept, 1 less precise, 1 lost, 2 repairs; re-checked: 12 directives, 11 kept, 1 less precise, 0 lost. Left less precise: the forecast named without its verdict qualifier, since only work with a verdict forecasts
- 2026-11-02, revised: the current phase and the phases are printed on request; checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-11-03, revised: /experiment status and /feature status are named; checked: 14 directives, 14 kept, 0 less precise, 0 lost
- 2026-11-08, revised: a phase with a forecast states it, as the forecast becomes a question asked when a phase is added; not re-checked

## History

Until Mon Nov 2 2026 the status commands were not named.

- **2026-11-02** — the rule said what is printed at a phase's start, and not what is printed when the engineer asks.
- **2026-10-29** — the goal followed the kind: an experiment's phase stated what it was to establish, and a feature's phase its intent. It follows whether the phase has a question or an intent, whatever the kind.
- **2026-10-29** — the rule reached an experiment's phase alone. A feature's phase was added, its goal being its intent.
- **2026-10-29** — the rule asked for the goal alone. The list of phases, with the current phase marked, was added the same day.

Related:

- the an-implementation-runs-on-a-branch-to-a-declared-end rule — an implementation in phases, the phase branch, and the forecast an experiment's phase states

---

Authored by Scott Bellware on Thu Oct 29 2026 at 11:18:21 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:19:08 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 2:42:07 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:02:31 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:41:02 PM PT
Changed by Scott Bellware on Mon Nov 2 2026 at 8:34:36 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 10:38:55 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:49:53 PM PT
