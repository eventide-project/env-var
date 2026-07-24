# `waytide/observations/` — working hypotheses, not yet binding

`waytide/observations/` holds working hypotheses, definitions, and methods that are **not yet binding** — rule-candidates surfaced during open-ended discovery, before the thinking has stabilized enough to canonize. They are *not* read as binding at session start the way rules are; they record in-progress understanding.

- **When to use:** the material is genuinely useful to keep but still under active discovery, or it is a method/definition the user hasn't ratified as a convention. When in doubt between a rule and an observation, prefer an observation — promoting later is cheap, retracting a premature rule is not.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, the content in prose. Open with a `**Status:**` line stating that it is a working hypothesis under discovery and what would promote it. The filename follows the ISO-8601-UTC prefix convention (see the agent-file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Promotion:** when an observation stabilizes into a binding convention, lift it into `waytide/rules/` as a new local rule and leave the observation as the discovery record (note the promotion in both). Add a `waytide/log/` entry for the promotion.
- **Recording one:** add the file, and add a matching one-line entry to `waytide/log/` noting it was recorded as an observation (and why it isn't yet a rule).

**Why:** discovery produces valuable thinking before it is ready to be binding; a place for non-binding hypotheses keeps that thinking without prematurely imposing it as a rule. Preferring an observation when in doubt makes the cheap move (promote later) the default over the costly one (retract a premature rule).

**How to apply:** record an in-progress hypothesis or unratified method here with a `**Status:**` line, not as a rule. Promote it to `waytide/rules/` only once it stabilizes, leaving the observation as the discovery record. Related: the agent-rules rule and the decision-log rule.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
