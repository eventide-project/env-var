# `waytide/plans/` — implementation plans that realize a design

`waytide/plans/` holds **implementation plans**: the sequenced, task-by-task build of a settled direction. A plan turns a design into an ordered set of increments a worker executes one at a time.

- **Relationship to design:** a plan **realizes** an `waytide/design/` doc — it names its **Source design** and sequences the build the design settled. Design settles *direction*; the plan settles *order*. A plan may exist without a separate design doc for small work, but when a design exists the plan points back to it.
- **Supersession:** a later plan may **supersede** an earlier one, reshaping its pending tasks around a new direction while keeping the earlier plan's **completed tasks as history** (the superseded tasks are marked, not deleted).
- **Tasks:** each task is a single checkbox (`- [ ] Task N: <name>`) stating the intended **behavior**, not code. Completed tasks carry post-hoc notes inline — reworks, green-on-arrival drops, supersessions — so the plan doubles as a build record.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the `plan` package's plan-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the agent-file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.

**Why:** design and execution are distinct concerns — one decides what the shape should be, the other decides the order it gets built in. Keeping plans in their own directory, each pointing at the design it realizes, keeps the settled direction stable while the incremental build proceeds against it, and preserves the build history without cluttering the design.

**How to apply:** when a settled design is ready to build, add a plan here that names its source design and sequences the work as behavior-stated tasks. Supersede rather than rewrite when direction changes, keeping completed tasks as history. Related: the agent-design-convention, the `plan` plan-document-format and plans-no-code-samples rules, and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
