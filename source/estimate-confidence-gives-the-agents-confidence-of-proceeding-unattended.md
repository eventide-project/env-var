# Estimate-confidence gives the agent's confidence of proceeding unattended

**Trigger:** When the engineer types `/estimate-confidence` or `/%`, or asks for the agent's confidence of proceeding unattended

**`/estimate-confidence` gives the agent's confidence of finishing the work under way on its own, from where the work stands.** `/%` is its alias. The work is the one the conversation is on, found as `/next?` finds it. Where that is not clear, ask which, through the selection interface. Where no work is under way, say so.

**Give five figures, each the agent's own estimate for this work, made when the command is typed.** Each figure is followed by its fixed sentence, in parentheses:

- Agent's confidence: 55% (how sure the agent is about working alone.)
- Risk of redo: 45% (how likely it is that you will have to redo work the agent does.)
- It'll work: 80% (how sure the agent is that what it builds on its own does what it says.)
- Your approval: 55% (how sure the agent is that it does what you would do: naming, shaping, and deciding things as you would.)
- Attended confidence: 85%

**The figures are worked out as they are where the work starts.** The agent's confidence is estimated directly, and is never higher than the lower of It'll work and Your approval. The risk of redo is 100% minus the agent's confidence, computed and not estimated. The attended confidence is about the It'll work figure, or a little higher. Where the agent's confidence is 70% or lower, end the figures with the line *When the agent's confidence is 70% or lower, intervention is indicated.*

**Below the figures, say what raises It'll work and what lowers Your approval**, each as a short list of what remains in the work. Change nothing. The command reports, and it does not switch the work to unattended or ask whether to.

**Why:** the engineer can ask, at any point in the work, how far the agent could be trusted to go on alone, in the same terms the work was started in.

**How to apply:** on `/estimate-confidence` or `/%`, estimate the figures for the rest of the work under way, print them with their sentences, add the warning line where it applies, list what drives the two figures, and stop.

## History

Until Thu Nov 12 2026 the command's alias was `/#`. The engineer changed it to `/%`, and `/#` became the alias of `/unattended`.

For part of Wed Nov 11 2026, the command's alias was `/%`. The engineer reverted it to `/#`.

Until Tue Nov 10 2026, for part of that day, the command's alias was `/???`. The engineer changed it to `/#`.

Until Tue Nov 10 2026, for part of that day, the command's alias was `/??`. The engineer replaced it with `/???`.

Until Tue Nov 10 2026 the command's alias was `/#`. The engineer removed it, and `/??` is its alias.

Related:

- the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule — the figures, as they are first asked at the start of the work
- the next-takes-the-next-step-of-the-work-under-way rule — how the work under way is found

---

Authored by Scott Bellware on Sun Nov 8 2026 at 2:30:48 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:37:43 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:43:22 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:18:35 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:58:17 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:03:09 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:48:54 PM PT
