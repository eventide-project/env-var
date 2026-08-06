# `waytide/local/plans/`, `intention/`, or `action/` — the docs that sequence a settled direction

`waytide/local/plans/` holds **implementation plans**: the sequenced, task-by-task build of a settled direction. A plan turns a design into an ordered set of increments a worker executes one at a time.

**Under intuitive mode this is `waytide/local/intention/` and the artifact is an intention; under OODA mode it is `waytide/local/action/` and the artifact is an action.** Everything in this rule holds unchanged for each — including supersession and the checkbox tasks, since the mode changes the vocabulary and the directory and not a single obligation (see the a-project-works-in-a-mode-chosen-at-initiation rule). The rule is written in the formal mode's terms because formal is the default; read *plan* as *intention* or *action*, and `plans/` as the directory your mode names.

- **Relationship to design:** a plan **realizes** an `waytide/local/design/` doc — it names its **Source design** and sequences the build the design settled. Under intuitive mode an intention realizes an aspiration, in `waytide/local/aspiration/`; under OODA mode an action realizes an orientation, in `waytide/local/orientation/`. Design settles *direction*; the plan settles *order*. A plan may exist without a separate design doc for small work, but when a design exists the plan points back to it.
- **Supersession:** a later plan may **supersede** one or more earlier ones, reshaping their pending tasks around a new direction while keeping each earlier plan's **completed tasks as history** (the superseded tasks are marked, not deleted). The later plan names them in its **Superseded plans** section — plural, since a plan may supersede a series that came before it.
- **Tasks:** each task is a single checkbox (`- [ ] Task N: <name>`) stating the intended **behavior**, not code. Completed tasks carry post-hoc notes inline — reworks, green-on-arrival drops, supersessions — so the plan doubles as a build record.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the plan-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.

**Why:** design and execution are distinct concerns — one decides what the shape should be, the other decides the order it gets built in. Keeping plans in their own directory, each pointing at the design it realizes, keeps the settled direction stable while the incremental build proceeds against it, and preserves the build history without cluttering the design.

**How to apply:** when a settled design is ready to build, add a plan here that names its source design and sequences the work as behavior-stated tasks. Supersede rather than rewrite when direction changes, keeping completed tasks as history. In an intuitive-mode project do all of that in `waytide/local/intention/`, calling the artifact an intention and pointing it at its source aspiration, and in an OODA-mode project in `waytide/local/action/`, calling it an action and pointing it at its source orientation; nothing else differs. Related: the design-convention, the plan-document-format and plans-no-code-samples rules, the a-project-works-in-a-mode-chosen-at-initiation rule (the mode that decides which directory this is), and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:35:20 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
