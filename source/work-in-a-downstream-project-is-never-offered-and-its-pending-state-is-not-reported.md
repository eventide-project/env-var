# Work in a downstream project is never offered, and its pending state is not reported

A change to a package leaves every project that installed it holding the previous version. **Do not offer to close that gap, and do not report it.** Not as a next step, not in a summary of what was done, not as an option among others, and not as the reason something else is incomplete.

**This covers every act that moves a downstream project** — a refresh, an install, a commit, a push, a regenerated bootstrap. It covers the projects a machine registry names, and any other repository that consumes this one.

## A pending state named is the same offer

**A trailing line reporting what is not done is a prompt, whatever its grammar.** *The other three projects still hold their commits unpushed* states a fact and asks for a push. *The root `AGENTS.md` is stale in all four* states a fact and asks for a regeneration. Neither sentence contains a question, and each one puts the work in front of the engineer as outstanding.

**The precondition form is the one that slips through.** *That cannot take effect anywhere until the projects refresh* is true, and it makes the engineer's own pacing read as an obstacle. Do not write what a thing is blocked on where the block is that the engineer has not asked for the next act.

## What this does not forbid

**Doing the work, when the engineer asks for it.** The instruction is theirs to give, and it needs no preamble weighing whether it was wise.

**Reporting what was done, after doing it.** A report of work just carried out is a result. A report of work not carried out is a prompt. That is the whole line, and it is legible in every case: ask whether the sentence describes something that happened.

**Answering a question about downstream state.** *Are the consuming projects up to date* is a question, and it is answered plainly and in full. What is forbidden is raising it unbidden.

**The session-start notice.** It reports the open experiments and features of the project the session is in, it is emitted by the harness rather than the agent, and it names no other repository. See the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule.

**Why:** the engineer decides when other repositories move, and that decision is not readable from what a package change was. A refresh writes merge commits into repositories they may not be working in this week, against rules that will be read at the start of every session there. The engineer is weighing that. The agent is weighing a diff it has just produced.

An agent that names the pending state presses toward a change across repositories at the moment its own view of the work is narrowest. That is the same failure the an-implementation-runs-on-a-branch-to-a-declared-end rule bars when it forbids the agent raising the end of an experiment, reached through a different act.

**A report is the place this fails**, rather than a question, which is why the rule reaches reporting at all. An agent instructed not to ask will still close its summary with the state of everything it did not do. The engineer then answers a prompt nobody phrased as one.

**How to apply:** after changing a package, report what changed and stop. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.

Carry out any of that when the engineer asks for it, and report what happened once it is done. Answer a question about downstream state fully when one is put. Raise none of it on your own initiative.

## Compressed

1. A package change leaves every project that installed it on the previous version.
2. Do not offer to close that gap.
3. Do not report it.
4. This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete.
5. It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap.
6. It covers the projects a machine registry names, and any other repository that consumes this one.
7. After changing a package, report what changed and stop. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.
8. Carry out downstream work when the engineer asks, and report what happened once it is done.
9. Answer a question about downstream state plainly and in full.

## A pending state named is the same offer

1. A trailing line reporting what is not done is a prompt, whatever its grammar.
2. *The other three projects still hold their commits unpushed* is forbidden. It asks for a push.
3. *The root `AGENTS.md` is stale in all four* is forbidden. It asks for a regeneration.
4. A sentence counts as a prompt even when it contains no question.
5. The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*.
6. Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act.

## What this does not forbid

1. Doing the work, when the engineer asks for it.
2. Do it with no preamble weighing whether the instruction was wise.
3. Reporting what was done, after doing it.
4. A report of work carried out is a result. A report of work not carried out is a prompt.
5. To tell them apart, ask whether the sentence describes something that happened.
6. Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full.
7. Raising downstream state unbidden stays forbidden.
8. The session-start notice. The harness emits it, it reports only on the current project, and it names no other repository. See the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.53, solubility 34 → 66, clarity 0.29 → 0.68, 17 directives, 17 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 66 → 62, clarity 0.68 → 0.68; checked: 15 directives, 14 kept, 1 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 62 → 67, clarity 0.68 → 0.70; checked: 15 directives, 14 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named downstream-work-is-never-offered.

Related:

- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the agent never raising the end of an experiment, the same failure through a different act
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — the notice, which is the harness's and reports only the project the session is in
- this package's README — the refresh procedure itself, which is run on the engineer's instruction

---

Authored by Scott Bellware on Sun Aug 16 2026 at 12:37:43 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
