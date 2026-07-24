# Present every prompt to the developer through the selection UI

Every time you prompt the developer to make a choice, a decision, or an answer — not only hinge choices, but **any** prompt — present it through the interactive **selection UI** (the `AskUserQuestion` tool), never as a prose question or a hand-typed list. Each genuine candidate is an option.

**Do not add an escape option of your own.** The selection UI auto-supplies a free-text **"Other"** choice; that built-in escape *is* the mandatory origination escape — the best answer is often one only the human can produce, and a closed list must never foreclose it. Adding your own "Chat about this" duplicates it.

**The UI requires at least two options. Do not manufacture cosmetic options to reach the floor.** When the shape looks pinned, look harder for the **real underlying decision** the human should originate — an interface-contract choice (a keyword required vs. defaulting), a return-type choice, an identity-vs-value choice. A genuine hinge almost always has a real second candidate once examined; surface it. The built-in "Other" then carries the origination path, so the human is never boxed into the option set.

**Why:** the selection UI makes every handoff legible and uniform, and already supplies the free-text origination escape. Routing *all* prompts through it — not only hinge gates — keeps the developer's decision points consistent and easy to act on, and stops a choice from being buried inside prose. The two-option floor is a forcing function: it pushes toward finding the real decision rather than presenting a fait-accompli single proposal — provoke origination, not mean-bias.

**How to apply:** whenever you would ask the developer to decide or answer — a hinge choice, a "which approach," a confirmation to proceed / commit, a clarification between interpretations — use the selection UI, one option per genuine choice, never adding your own escape option. Find at least two genuine candidates by surfacing the real underlying decision; never pad with cosmetic variants. Applies at **every** hinge of the cycle — actuation, observation, controls, implementation, naming — and to every prompt beyond them. Reserve plain prose for statements, reports, and explanations that are **not** asking the developer to choose. Related: the actuation-gate options-or-chat rule (the mechanism at the first gate), the hinge-cycle rule, and the DBE vocabulary.

---

Authored by Scott Bellware on Fri Jul 3 2026 at 8 AM PT
