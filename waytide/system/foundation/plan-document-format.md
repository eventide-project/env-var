# How an implementation plan reads — and an intention or an action, which read the same

An implementation plan (`waytide/local/plans/*.md`) is titled `# <Title> — Implementation Plan`.

**Under intuitive mode the document is an intention**, in `waytide/local/intention/`, titled `# <Title> — Intention`; **under OODA mode it is an action**, in `waytide/local/action/`, titled `# <Title> — Action`. **Its shape is this shape, entirely** — the same elements in the same settled order, the same behavior-stated checkbox tasks, the same **Superseded plans** section naming what it supersedes. The mode changes what the document is called and where it lives, and nothing about how it reads (see the a-project-works-in-a-mode-chosen-at-initiation rule).

**The elements below are the common ones, not an exclusive set.** A plan carries whatever
elements of planning the work actually has; these are the ones that recur, and where they
appear they appear in this order. A plan is not wrong for holding an element not named here, and
it is not obliged to hold one that the work does not call for.

- **Goals** — what the plan achieves. Plural where the work has more than one.
- **Source designs** — pointers to the direction artifacts the plan realizes. Plural: a
  plan may realize more than one. Omitted when there is no separate direction artifact.
- **Work sequences** — the orders in which the work can be done, where the plan has more than
  the single front-to-back reading its task list implies.
- **Superseded plans** — the plans this one supersedes, named, with what carries over from each as history. Plural: a plan may supersede a series that came before it. **Superseded** rather than *replaced* because it states the authority — a superseded plan is not merely earlier, it no longer governs.
- **Architecture** — the phases and how they group the tasks; characterize each phase (e.g. an atomic behavior-neutral conversion versus a test-first build).
- **Process notes** — how the tasks are worked (test-first, controls usage, and that **code is not specified in the plan** — see plans-no-code-samples).
- **Tasks** — each a single checkbox (`- [ ] Task N: <name>`) stating intended **behavior**, not code; completed tasks may carry inline notes recording reworks, drops, and supersessions.

**Two sections were removed on 2026-08-03, and the reason is the same for both: neither belonged to a plan.** **Commit policy** restated which of the `git` package's conventions applied, which is a second place to keep true and the package's own concern — the rule said as much while asking for the section anyway. **Tech Stack** was one line answering a question a project answers once, not per plan.

**The order is settled; the set is not.** A worker scanning a plan finds Goals before Tasks in every plan that has both, which is what makes the shape learnable. That is not the same as fixing which elements a plan may hold — a plan whose work has an element these do not name should carry it rather than omit it to fit.

**Why:** a plan is scanned by a worker executing it task by task, so a predictable order and behavior-stated tasks let them find the next increment and its intent without re-reading. Stating behavior rather than code keeps the interactive, incremental control over generation that the plans-no-code-samples rule protects.

**How to apply:** when writing a plan, carry the elements the work has, ordered as above where they appear, and state each task as a behavior with a single checkbox. Add an element the work calls for rather than forcing it into one of these. Point **Source design** at the design being realized, and keep code out of the document. Do not restate the commit conventions or the project's stack; the first is the `git` package's and the second does not vary by plan. Write an intention or an action exactly the same way, titled `— Intention` or `— Action`. Related: the foundation plans-convention (what the directory is), the a-project-works-in-a-mode-chosen-at-initiation rule (which of the two directories a project uses), plans-no-code-samples, and the `git` commit rules.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:30:52 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:35:20 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:40:24 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
