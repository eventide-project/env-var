# Next takes the next step of the work under way, and next? names it

**Trigger:** When the engineer types `/next`, `/next`, or `/next?`, or asks what is next

**`/next?` asks what the next step is, and `/next` takes it.** `/next?` is the engineer asking *What's next?*, and `/next` is the engineer saying *proceed*. `/proceed` and `/..` are aliases of `/next`. Neither names the work, because the work is the one the conversation is on.

**As the engineer stated it:** any kind of multi-step process. It stops me from having to say: What's next?

**The work under way is any work with steps still to take.** A plan's unchecked tasks, an implementation's phases, the design hinges of an outcome, a list of steps the agent gave, a procedure part done: each is one. Work that was interrupted, as by other requests, is still work under way, and `/next` resumes it at the step where it stopped. The next step is the first one not yet taken.

**`/next?` names the next step and does not take it.** Where the work was interrupted, that is the step where it stopped. It says what the step is and what it would do, in a sentence or two.

**`/next` takes the next step, as the engineer saying proceed would.** It does what that step involves and nothing beyond it, and then stops, as it would after any step.

**Where the agent is suggesting an action, that action is the next step, and `/next` carries it out.** A suggested action is one the agent's last response offered, such as running the suite or writing a record.

**Where more than one piece of work is under way, `/next` and `/next?` follow the one the conversation is on.** Where that is not clear, they ask which, through the selection interface. Where no work is under way, they say so.

**`/next` does not stand in for a decision a rule leaves to the engineer.** Where the next step is one the engineer has to decide or declare, such as affirming an experiment, committing on `master`, or deleting a branch, `/next` brings the step to that decision and asks it, as the step's own rule says.

**Why:** a conversation that works through steps asks *what's next* and says *proceed* again and again. A short command for each saves the engineer the words and keeps the meaning fixed: one asks, one acts, and neither decides for the engineer.

**How to apply:** on `/next?`, name the next step of the work the conversation is on, and stop. On `/next`, take that step, or the action the agent is suggesting, and stop. Ask which work is meant where it is not clear, and say so where none is under way. Where the step needs the engineer's decision, ask for it.

## Compressed

1. `/next?` asks what the next step is, as the engineer asking *What's next?* would. `/next` takes it, as the engineer saying *proceed* would. `/proceed` and `/..` are aliases of `/next`.
2. The work under way is any work with steps still to take: a plan's unchecked tasks, an implementation's phases, an outcome's design hinges, a list of steps the agent gave, a procedure part done. Interrupted work is still under way, and `/next` resumes it where it stopped. The next step is the first not yet taken.
3. On `/next?`, name the next step, or the step where interrupted work stopped, and what it would do, in a sentence or two, and do not take it.
4. On `/next`, take the next step and nothing beyond it, then stop. Where the agent is suggesting an action, one its last response offered, that action is the next step.
5. Follow the work the conversation is on. Where that is not clear, ask which, through the selection interface. Where no work is under way, say so.
6. `/next` does not stand in for a decision or declaration a rule leaves to the engineer, such as affirming an experiment, committing on `master`, or deleting a branch. It brings the step to that decision, and asks it as the step's rule says.

## Compression

- 2026-11-02, compressed: checked: 14 directives, 14 kept, 0 less precise, 0 lost
- 2026-11-05, revised: the commands are `/next-work` and `/next-work?`, a term swap the engineer settled; not re-checked
- 2026-11-05, revised: the commands are `/next` and `/next?` again, a term swap the engineer settled; not re-checked
- 2026-11-08, revised: interrupted work is resumed by `/next`, at the engineer's direction; not re-checked
- 2026-11-08, revised: `/next?` names the step where interrupted work stopped, at the engineer's direction; not re-checked
- 2026-11-11, revised: the command is `/proceed`, and `/next` is its alias, a term swap the engineer settled; not re-checked
- 2026-11-11, revised: the command is `/next` again, and `/proceed` is its alias, a term swap the engineer settled; not re-checked
- 2026-11-11, revised: `/next` carries out an action the agent is suggesting, at the engineer's direction; checked: 21 directives, 16 kept, 5 less precise, 0 lost, 3 repairs; re-checked: 21 directives, 20 kept, 1 less precise, 0 lost. Left less precise: a plain request for what is next is not stated as a trigger in the compressed text, which the rule's trigger line carries

## History

Until Thu Nov 12 2026 the shortcut of `/next` was `/>>`. The engineer changed it to `/..`.

Until Wed Nov 11 2026 the rule did not say that `/next` carries out an action the agent is suggesting.

For part of Wed Nov 11 2026 the command that takes the next step was `/proceed`, and `/next` was its alias. The engineer made `/next` the command again, since it pairs with `/next?`, and kept `/proceed` as its alias.

Until Sun Nov 8 2026 the rule did not say that `/next?` names the step where interrupted work stopped.

Until Sun Nov 8 2026 the rule did not say that `/next` resumes interrupted work.

On Thu Nov 5 2026 the commands were renamed `/next-work` and `/next-work?`, and then named `/next` and `/next?` again the same day.

Related:

- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question where the work is unclear

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:46:33 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 1:03:01 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:09:56 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:33 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:33:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:34:17 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:15:04 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:20:46 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:24:40 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:49:31 PM PT
