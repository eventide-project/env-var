# The actuation gate: offer candidate actuations as options; the human chooses one or originates their own

At the actuation gate — the first gate, where the cradle is set — the AI does not commit a single actuation and proceed. It presents the human a small set of **candidate actuations** as options to choose among. The human then either:

- **chooses** the option that reads as the more soluble use, or
- takes the **origination escape** — dictating the actuation outright, or opening a chat to work out what it should be.

This is how the highest-leverage hinge — the efferent shape of the actuation — is handed over for deliberation: by comparing concrete alternatives, with an always-open escape into dictation or dialogue when the right shape isn't among the options.

The form is deliberate. It is the operationalization of the two results the gates rest on (see the DBE vocabulary):

- **Provoke origination, not mean-bias — so present alternatives, not a fait accompli.** A single proposed actuation ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer, exerting mean-bias and lowering the human toward the average. Offering several genuine options keeps the human originating — comparing real candidate shapes for solubility — rather than ratifying.
- **The best options are ones the AI can't produce — so the escape is mandatory.** The option set is the AI's own, drawn from the average; the best actuation is often one only the human can produce, and showing a closed list tempts the human to pick from it instead of producing their own. The escape is what keeps the human above the AI's mean — never boxed into the AI's option set.

**Why:** The actuation is the cradle and the highest-leverage hinge (human-in-the-loop rule, step 1: "the AI may propose the actuation… asks rather than averaging"). Concrete alternatives make the deliberation tractable and provoke origination; the mandatory escape keeps the human above the AI's mean when the right actuation is one the AI couldn't produce. Together they let the AI carry the proposing work without pulling the human's judgment down to the mean.

**How to apply:** At the first gate, generate a few genuinely distinct candidate actuations — different efferent shapes, not cosmetic variants — each presented as it would read at the use site. Offer them through the selection UI, whose built-in free-text choice *is* the origination escape (do not add an escape option of your own — see the present-every-prompt rule). If the human chooses one, adopt it as the cradle. If the human originates instead, take their dictated actuation or enter a dialogue, and settle the actuation before writing the test file. Do not proceed to the test body until the actuation is settled. **When a hinge has no genuinely distinct candidates, do not manufacture them** — prompt the human to *accept* the single proposal instead, the escape still open. This options-or-accept-with-escape mechanism applies at **every** hinge of the cycle (actuation, observation, controls, implementation, naming), not only the actuation — see the hinge-cycle rule. Related: the hinge-cycle, human-in-the-loop, first-turn, DBE-as-design-tool, and present-every-prompt rules, and the DBE vocabulary.

---

Authored by Scott Bellware on Sat Jun 27 2026 at 1 PM PT
