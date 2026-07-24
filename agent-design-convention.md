# `waytide/design/` — design docs that settle direction

`waytide/design/` holds **design docs**: the settled *direction* of a piece of work, written before a plan sequences the build. A design decides what the shape should be — structure, construction, API, the model — and records the resolutions that later work rests on.

- **Relationship to plans:** a design settles direction; an `waytide/plans/` plan **realizes** it. The design is the stable reference the plan points back to (its **Source design**).
- **Two kinds:** a **feature/component design** (the structure, file layout, construction, and API of a unit of work) and a **methodology design** (a way of working, argued from a premise). Both live here; they share a spine, not a fixed section list.
- **Settled resolutions:** a design records **Settled** decisions with the date they were settled, so a reader knows what is fixed versus still open. A trailing **Out of Scope / Deferred** section marks what the design deliberately leaves out.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the `plan` package's design-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the agent-file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.

**Why:** deciding direction and executing it are separate acts, and the direction must stay stable while the build proceeds against it. A dedicated home for designs — distinct from the plans that realize them — keeps the settled shape and its dated resolutions readable on their own, and gives every plan one authoritative source to point at.

**How to apply:** before sequencing a build, settle its direction in a design here, dating each resolution as it is settled and marking what is out of scope. Point the realizing plan back at it. Related: the agent-plans-convention, the `plan` design-document-format and package-dependency-heading rules, and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
