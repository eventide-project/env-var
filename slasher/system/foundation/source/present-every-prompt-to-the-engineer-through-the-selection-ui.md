# Present every prompt to the engineer through the selection UI

Every time you prompt the engineer to make a selection, a decision, or an answer, present it through the interactive **selection UI**. That is the `AskUserQuestion` tool. That holds for **any** prompt. Never use a prose question or a hand-typed list. Each genuine candidate is an option.

**The UI requires at least two options. Do not invent an option to reach the floor.** Present every genuine candidate the agent finds.

**The agent cannot establish that no other option exists**, only that it found no other genuine one. Its candidates are drawn from what it has seen, and the best answer is often one only the engineer can produce. So a search made to reach two options finds something whether or not it is real, and presents an absurdity as a viable choice. Do not search to fill the place, and do not say the lone candidate is the only possibility.

**Where there is one genuine candidate, offer it and its negative.** The negative reads *Something else — say what to change*, so its label says what happens next: the engineer describes the alternative. The negative is a real answer to the question, not an invented option.

**As the engineer stated it:** The option "Don't accept" is hard to understand when presented to the user as a selection.

**Why:** the selection UI is what makes responsibility transfer legibly and the same way every time. Routing *all* prompts through it keeps the engineer's decision points consistent and easy to act on, and stops a decision from being buried inside prose. The two-option floor is a forcing function. It pushes toward finding the real decision rather than presenting a single proposal for approval. A single proposal puts the engineer in the position of ratifying an answer rather than producing one.

**How to apply:** whenever you would ask the engineer to decide or answer. That covers a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations. Use the selection UI, one option per genuine candidate.

Present the genuine candidates you find. Never invent an option to reach two, and never claim the one you found is the only one.

Reserve plain prose for statements, reports, and explanations that are **not** asking the engineer to choose.

**Where the engineer escapes a selection, do not put it again on your own.** The engineer escapes it by refusing it, by stopping it to clarify, or by interrupting it. Say where the work stopped, and wait. Put the question again only when the engineer asks for it, as with `/ask-again` or `/aa`, or after a clarification the engineer asked for. The question the work reaches next is still put without waiting.

**As the engineer stated it:** Desist from presenting the selection UI in a loop automatically. It doesn't provide opportunity for the user to digest. And: I want the original question put to the user automatically, but not the repeat of the question if the user escapes the selection UI.

## Compressed

1. Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool.
2. This holds for any prompt.
3. Never use a prose question or a hand-typed list.
4. Each genuine candidate is an option.
5. The UI requires at least two options. Do not invent an option to reach that floor.
6. Present every genuine candidate you find.
7. Do not search for options just to fill the second place.
8. Do not say that a lone candidate is the only possibility.
9. Where there is one genuine candidate, offer it and its negative, labelled *Something else — say what to change*. The negative is a real answer, not an invented option.
10. This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations.
11. Keep plain prose for statements, reports, and explanations that do not ask the engineer to choose.
12. Where the engineer escapes a selection, by refusing it, stopping it to clarify, or interrupting it, do not put it again on your own. Say where the work stopped, and wait. Put it again when the engineer asks, as with `/ask-again` or `/aa`, or after a clarification they asked for. Put the next question the work reaches without waiting.

## Compression

- 2026-10-24, compressed: compression 0.56, change 0.78, solubility 33 → 69, clarity 0.54 → 0.85, 28 directives, 28 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-25, revised: point 20 takes the new wording, that no candidate is dropped; not checked
- 2026-10-27, re-checked: 31 directives, 30 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 69 → 69, clarity 0.85 → 0.90; checked: 27 directives, 27 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 17 directives, 16 kept, 1 less precise, 0 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule
- 2026-11-10, revised: the negative reads *Something else — say what to change*, at the engineer's direction; not re-checked
- 2026-11-10, revised: an escaped selection is not put again unasked, at the engineer's direction; not re-checked
- 2026-11-11, revised: `/ask-again` and `/..` are named as how the engineer asks; not re-checked
- 2026-11-11, revised: the shortcut alias `/..` becomes `/,`, a swap the engineer settled; not re-checked
- 2026-11-11, revised: the shortcut alias `/,` becomes `/aa`, a swap the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 the rule named `/..` as the shortcut alias of `/ask-again`.

Until Wed Nov 11 2026 at 10:37:48 AM PT it named `/,`.

Until Tue Nov 10 2026 the rule did not say what follows an escaped selection.

Until Tue Nov 10 2026 the negative was given as *Don't accept*, beside *Accept*. The engineer found it hard to understand, and it reads *Something else — say what to change*.

Until 2026-10-25 the rule said that where a prompt has four genuine candidates, the fourth is dropped to keep `Explain`, while it also said to present every genuine candidate the agent finds. The engineer settled that where there are more than three, the question says so and points to `Explain`, whose answer gives every candidate, and that a candidate beyond the third is chosen through the "Other" answer.

Until Sun Oct 25 2026 this rule was named present-every-prompt-through-askuserquestion.

Until Thu Oct 29 2026 the rule told the agent to offer an `Explain` option on every prompt, which answered with a summary and an explanation, then redisplayed the prompt with `Explain briefly`, at the cost of one of the four option slots. It also said the harness supplies the free-text "Other" answer, that the agent adds no free-text option of its own, and that "Other" is how the engineer answers outside the options.

Related:

- the `design-by-efferent` package's the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming and the-actuation-gate-offers-candidate-actuations-as-options rules — the gates this is the mechanism for, and the fuller account of why a gate offers alternatives rather than a single proposal
- its vocabulary — where **mean-bias** is defined
- the ask-again-puts-the-last-question-again rule — how the engineer asks for a question again

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
Changed by Scott Bellware on Sun Aug 16 2026 at 1:04:10 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:49:17 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:54:56 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:27:43 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:12 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:34:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:40:05 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:06:08 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 6:32:55 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:30:49 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:33:27 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:37:48 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:48:44 AM PT
