# `waytide/local/plans/` — implementation plans that realize a design

`waytide/local/plans/` holds **implementation plans**: the sequenced, task-by-task build of a settled direction. A plan turns a design into an ordered set of increments a worker executes one at a time.

- **Relationship to design:** a plan **realizes** an `waytide/local/design/` doc — it names its **Source design** and sequences the build the design settled. Design settles *direction*; the plan settles *order*. A plan may exist without a separate design doc for small work, but when a design exists the plan points back to it.
- **Supersession:** a later plan may **supersede** one or more earlier ones, reshaping their pending tasks around a new direction while keeping each earlier plan's **completed tasks as history** (the superseded tasks are marked, not deleted). The later plan names them in its **Superseded plans** section — plural, since a plan may supersede a series that came before it.
- **Tasks:** each task is a single checkbox (`- [ ] Task N: <name>`) stating the intended **behavior**, not code. Completed tasks carry post-hoc notes inline — reworks, green-on-arrival drops, supersessions — so the plan doubles as a build record.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the plan-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.

**Why:** design and execution are distinct concerns — one decides what the shape should be, the other decides the order it gets built in. Keeping plans in their own directory, each pointing at the design it realizes, keeps the settled direction stable while the incremental build proceeds against it, and preserves the build history without cluttering the design.

**How to apply:** when a settled design is ready to build, add a plan here that names its source design and sequences the work as behavior-stated tasks. Supersede rather than rewrite when direction changes, keeping completed tasks as history. Related: the design-convention, the `plan` plan-document-format and plans-no-code-samples rules, and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:35:20 PM PT
