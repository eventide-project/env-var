# How an implementation plan reads

An implementation plan (`waytide/plans/*.md`) is titled `# <Title> — Implementation Plan` and reads in a settled order. The sections, in order:

- **Goal** — one paragraph: what the plan achieves.
- **Source design** — a pointer to the `waytide/design/` doc the plan realizes (omit only when there is no separate design).
- **Supersedes** — when the plan replaces an earlier one, name it and say what carries over as history.
- **Architecture** — the phases and how they group the tasks; characterize each phase (e.g. an atomic behavior-neutral conversion versus a test-first build).
- **Tech Stack** — one line.
- **Process notes** — how the tasks are worked (test-first, controls usage, and that **code is not specified in the plan** — see plans-no-code-samples).
- **Commit policy** — the commit granularity and constraints (the commit conventions themselves live in the `git` package; the plan only states which apply).
- **Tasks** — each a single checkbox (`- [ ] Task N: <name>`) stating intended **behavior**, not code; completed tasks may carry inline notes recording reworks, drops, and supersessions.

**Why:** a plan is scanned by a worker executing it task by task, so a predictable section order and behavior-stated tasks let them find the next increment and its intent without re-reading. Stating behavior rather than code keeps the interactive, incremental control over generation that the plans-no-code-samples rule protects.

**How to apply:** when writing a plan, follow the section order above and state each task as a behavior with a single checkbox. Point **Source design** at the design being realized, and keep code out of the document. Related: the foundation agent-plans-convention (what the directory is), plans-no-code-samples, and the `git` commit rules.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
