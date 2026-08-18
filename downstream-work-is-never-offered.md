# Work in a downstream project is never offered, and its pending state is not reported

A change to a package leaves every project that installed it holding the previous version. **Do
not offer to close that gap, and do not report it.** Not as a next step, not in a summary of what
was done, not as an option among others, and not as the reason something else is incomplete.

**This covers every act that moves a downstream project** — a refresh, an install, a commit, a
push, a regenerated bootstrap. It covers the projects a machine registry names, and any other
repository that consumes this one.

## A pending state named is the same offer

**A trailing line reporting what is not done is a prompt, whatever its grammar.** *The other three
projects still hold their commits unpushed* states a fact and asks for a push. *The root
`AGENTS.md` is stale in all four* states a fact and asks for a regeneration. Neither sentence
contains a question, and each one puts the work in front of the engineer as outstanding.

**The precondition form is the one that slips through.** *That cannot take effect anywhere until
the projects refresh* is true, and it makes the engineer's own pacing read as an obstacle. Do not
write what a thing is blocked on where the block is that the engineer has not asked for the next
act.

## What this does not forbid

**Doing the work, when the engineer asks for it.** The instruction is theirs to give, and it needs
no preamble weighing whether it was wise.

**Reporting what was done, after doing it.** A report of work just carried out is a result. A
report of work not carried out is a prompt. That is the whole line, and it is legible in every
case: ask whether the sentence describes something that happened.

**Answering a question about downstream state.** *Are the consuming projects up to date* is a
question, and it is answered plainly and in full. What is forbidden is raising it unbidden.

**The session-start notice.** It reports the open experiments and features of the project the
session is in, it is emitted by the harness rather than the agent, and it names no other
repository. See the announce-waytide-at-session-start rule.

**Why:** the engineer decides when other repositories move, and that decision is not readable from
what a package change was. A refresh writes merge commits into repositories they may not be
working in this week, against rules that will be read at the start of every session there. The
engineer is weighing that. The agent is weighing a diff it has just produced.

An agent that names the pending state presses toward a change across repositories at the moment
its own view of the work is narrowest. That is the same failure the experiment-lifecycle rule bars
when it forbids the agent raising the end of an experiment, reached through a different act.

**A report is the place this fails**, rather than a question, which is why the rule reaches
reporting at all. An agent instructed not to ask will still close its summary with the state of
everything it did not do. The engineer then answers a prompt nobody phrased as one.

**How to apply:** after changing a package, report what changed and stop. Name no downstream
project as outstanding, unrefreshed, uninstalled, unpushed, or stale.

Carry out any of that when the
engineer asks for it, and report what happened once it is done. Answer a question about downstream
state fully when one is put. Raise none of it on your own initiative.

Related:

- the experiment-lifecycle rule — the agent never raising the end of an experiment, the same failure through a different act
- the announce-waytide-at-session-start rule — the notice, which is the harness's and reports only the project the session is in
- this package's README — the refresh procedure itself, which is run on the engineer's instruction

---

Authored by Scott Bellware on Sun Aug 16 2026 at 12:37:43 AM PT
