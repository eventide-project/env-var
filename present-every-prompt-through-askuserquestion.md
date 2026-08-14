# Present every prompt to the engineer through the selection UI

Every time you prompt the engineer to make a selection, a decision, or an answer, present it through the interactive **selection UI**. That is the `AskUserQuestion` tool. That holds for **any** prompt. Never use a prose question or a hand-typed list. Each genuine candidate is an option.

**Do not add a free-text option of your own.** The selection UI auto-supplies one, the **"Other"** answer. That built-in option *is* how the engineer answers outside the option set. The best answer is often one only they can produce, and a closed list must never foreclose it. Adding your own "Chat about this" duplicates it.

**Offer an `Explain` option.** It is not a free-text option and does not duplicate the built-in one: that is how an engineer **answers** outside the options. This is how they ask what the question **means** before answering at all. An engineer who does not understand the options cannot produce a better one. So the two serve opposite halves of the moment responsibility transfers to them.

- **What it does.** Selecting it is as if the engineer had asked for the question to be explained. It is answered with **a summary at the top followed by a normal level of explanation**. It is not a restatement of the options, and not the same framing a second time.
- **The selection prompt is then displayed again, unchanged.** The explanation does not replace the decision. The same options are presented after it, so the engineer decides with the explanation in hand.
- **Say that in the option's own description**, which is the sentence the engineer actually reads: *…then display this selection prompt again*. Not **put this question again** — *put* in the sense of *pose* is archaic, and an engineer meets the everyday sense first, where it says nothing about what will happen. **Display** names the act plainly, and **selection prompt** names the thing being displayed rather than leaving *question* to be resolved against the explanation that just preceded it.
- **It is offered on every prompt**, not only where the agent judges the question hard. That judgment is exactly what fails: an agent that could tell which of its questions were unclear would have written them clearly.
- **It costs one of the four option slots.** The selection UI takes at most four, so a prompt carrying `Explain` has three for genuine candidates. Most prompts have two or three, so it rarely binds. Where one genuinely has four, drop the fourth rather than the `Explain` — an engineer who cannot read the question cannot weigh a fourth candidate either.
- **Where it appears is not the agent's to choose.** The harness renders the built-in free-text answer last, so `Explain` sits among the supplied options rather than beneath it.

**The UI requires at least two options. Do not manufacture cosmetic options to reach the floor.** When the shape looks pinned, look harder for the **real underlying decision** the engineer should make. That is an interface-contract decision, such as a keyword required against defaulting. It is also a return-type decision, or an identity-against-value decision.

A genuine decision almost always has a real second candidate once examined. Surface it. The built-in "Other" then carries the answer the options do not contain, so the engineer is never boxed into the set.

**Why:** the selection UI is what makes responsibility transfer legibly and the same way every time, and it already supplies the free-text option. Routing *all* prompts through it keeps the engineer's decision points consistent and easy to act on, and stops a decision from being buried inside prose. The two-option floor is a forcing function. It pushes toward finding the real decision rather than presenting a single proposal for approval. A single proposal puts the engineer in the position of ratifying an answer rather than producing one.

The `Explain` option answers the failure the rest of the rule cannot reach — a prompt that is well-formed, correctly presented, and **not understood**. Without it the engineer's recourse is the free-text box, which asks them to compose a request at the moment they are least equipped to. The agent's only signal is then a question going unanswered.

Making it an option rather than a judgment call is the point. The agent is the party that cannot tell which of its own questions are unclear.

**How to apply:** whenever you would ask the engineer to decide or answer. That covers a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations. Use the selection UI, one option per genuine candidate, plus `Explain`. Never add a free-text option of your own.

Find at least two genuine candidates by surfacing the real underlying decision. Never pad with cosmetic variants.

When `Explain` is selected, answer with a summary first and a normal level of explanation beneath it. Then display the same selection prompt again, unchanged. And word that option's own description *…then display this selection prompt again*, never *put this question again*. Reserve plain prose for statements, reports, and explanations that are **not** asking the engineer to choose.

Related:

- the `design-by-efferent` package's hinge-cycle and actuation-gate-options-or-chat rules — the gates this is the mechanism for, and the fuller account of why a gate offers alternatives rather than a single proposal
- its vocabulary — where **mean-bias** is defined

---

Authored by Scott Bellware on Fri Jul 3 2026 at 8 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:11:13 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:40:54 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
