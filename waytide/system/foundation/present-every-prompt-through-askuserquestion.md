# Present every prompt to the engineer through the selection UI

Every time you prompt the engineer to make a selection, a decision, or an answer, present it through the interactive **selection UI**. That is the `AskUserQuestion` tool. That holds for **any** prompt. Never use a prose question or a hand-typed list. Each genuine candidate is an option.

**Do not add a free-text option of your own.** The selection UI auto-supplies one, the **"Other"** answer. That built-in option *is* how the engineer answers outside the option set. The best answer is often one only they can produce, and a closed list must never foreclose it. Adding your own "Chat about this" duplicates it.

**Offer an `Explain` option.** It is not a free-text option and does not duplicate the built-in one: that is how an engineer **answers** outside the options. This is how they ask what the question **means** before answering at all. An engineer who does not understand the options cannot produce a better one. So the two serve opposite halves of the moment responsibility transfers to them.

- **What it does.** Selecting it is as if the engineer had asked for the question to be explained. It is answered with **a summary at the top followed by a normal level of explanation**. It is not a restatement of the options, and not the same framing a second time.
- **The selection prompt is then displayed again, with one substitution.** The explanation does not replace the decision. The same options are presented after it, so the engineer decides with the explanation in hand. The `Explain` option is the one thing that changes: on the second display it reads **`Explain briefly`**.
- **`Explain briefly` answers with the summary alone** — the shortest statement of what the question decides, and nothing under it. The prompt is then displayed a third time, still carrying `Explain briefly`. No further rung is invented, and the option does not change again however many times it is selected.
- **The second explanation is shorter rather than longer, and that is the point.** An engineer who selects `Explain` and then reaches for it again did not get what they needed from a normal-length explanation. Answering at that length repeats the attempt that already failed. The summary alone is a different cut at the question rather than more of the same. It is also the part the first explanation led with, so the engineer is given the one piece they may have read past.
- **Say that in the option's own description**, which is the sentence the engineer actually reads: *…then display this selection prompt again*. Not **put this question again** — *put* in the sense of *pose* is archaic, and an engineer meets the everyday sense first, where it says nothing about what will happen. **Display** names the act plainly, and **selection prompt** names the thing being displayed rather than leaving *question* to be resolved against the explanation that just preceded it. **`Explain briefly`'s description says its own length** — *…in a sentence or two, then display this selection prompt again* — so the engineer knows they are asking for something shorter rather than the same answer a second time.
- **It is offered on every prompt**, not only where the agent judges the question hard. That judgment is exactly what fails: an agent that could tell which of its questions were unclear would have written them clearly.
- **It costs one of the four option slots.** The selection UI takes at most four, so a prompt carrying `Explain` has three for genuine candidates. Most prompts have two or three, so it rarely binds. Where one genuinely has four, drop the fourth rather than the `Explain` — an engineer who cannot read the question cannot weigh a fourth candidate either.
- **Where it appears is not the agent's to choose.** The harness renders the built-in free-text answer last, so `Explain` sits among the supplied options rather than beneath it.

**The UI requires at least two options. Do not invent an option to reach the floor.** Present every genuine candidate the agent finds. Where it finds one, the second option is `Explain` — an account of that candidate.

**The agent cannot establish that no other option exists**, only that it found no other genuine one. Its candidates are drawn from what it has seen, and the best answer is often one only the engineer can produce. So a search made to reach two options finds something whether or not it is real, and presents an absurdity as a viable choice. Do not search to fill the place, and do not say the lone candidate is the only possibility. The built-in "Other" then carries the answer the options do not contain, so the engineer is never boxed into the set.

**Why:** the selection UI is what makes responsibility transfer legibly and the same way every time, and it already supplies the free-text option. Routing *all* prompts through it keeps the engineer's decision points consistent and easy to act on, and stops a decision from being buried inside prose. The two-option floor is a forcing function. It pushes toward finding the real decision rather than presenting a single proposal for approval. A single proposal puts the engineer in the position of ratifying an answer rather than producing one.

The `Explain` option answers the failure the rest of the rule cannot reach — a prompt that is well-formed, correctly presented, and **not understood**. Without it the engineer's recourse is the free-text box, which asks them to compose a request at the moment they are least equipped to. The agent's only signal is then a question going unanswered.

Making it an option rather than a judgment call is the point. The agent is the party that cannot tell which of its own questions are unclear.

**How to apply:** whenever you would ask the engineer to decide or answer. That covers a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations. Use the selection UI, one option per genuine candidate, plus `Explain`. Never add a free-text option of your own.

Present the genuine candidates you find. Where there is one, put `Explain` beside it. Never invent an option to reach two, and never claim the one you found is the only one.

When `Explain` is selected, answer with a summary first and a normal level of explanation beneath it. Then display the same selection prompt again, with `Explain` replaced by `Explain briefly` and every other option unchanged.

When `Explain briefly` is selected, answer with the summary alone and display the prompt again, carrying `Explain briefly` still. Do not add a third variant.

Word each option's own description *…then display this selection prompt again*, never *put this question again*, and say the brief one's length in its description. Reserve plain prose for statements, reports, and explanations that are **not** asking the engineer to choose.

Related:

- the `design-by-efferent` package's hinge-cycle and actuation-gate-options-or-chat rules — the gates this is the mechanism for, and the fuller account of why a gate offers alternatives rather than a single proposal
- its vocabulary — where **mean-bias** is defined
