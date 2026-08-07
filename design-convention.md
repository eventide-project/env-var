# `waytide/local/design/`, `aspiration/`, or `orientation/` — the docs that settle direction

`waytide/local/design/` holds **design docs**: the settled *direction* of a piece of work, written before a plan sequences the build. A design decides what the shape should be — structure, construction, API, the model — and records the resolutions that later work rests on.

**Under intuitive mode this is `waytide/local/aspiration/` and the artifact is an aspiration; under OODA mode it is `waytide/local/orientation/` and the artifact is an orientation.** Everything in this rule holds unchanged for each — the mode changes the vocabulary and the directory, not a single obligation (see the a-project-works-in-a-mode-chosen-at-initiation rule). The rule is written in the formal mode's terms because formal is the default; read *design* as *aspiration* or *orientation*, and `design/` as the directory your mode names.

- **Relationship to the sequencing artifact:** a design settles direction; the project's sequencing artifact **realizes** it — a plan, an intention, or an action, whichever the mode names. The design is the stable reference it points back to (its **Source design**).
- **Two kinds:** a **feature/component design** (the structure, file layout, construction, and API of a unit of work) and a **methodology design** (a way of working, argued from a premise). Both live here; they share a spine, not a fixed section list.
- **Settled resolutions:** a design records **Settled** decisions with the date they were settled, so a reader knows what is fixed versus still open. A trailing **Out of Scope / Deferred** section marks what the design deliberately leaves out.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the design-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **How it stays current:** a design is **reconciled** against the records, never regenerated from them — it is a source of truth that a plan points back at, so rebuilding it from the work downstream would invert that. The reconciliation is prompted when a **work session record is written**, where the records have just been read and the session is closing; the developer decides which side is stale, since either may be. See the work-sessions-convention.

## A question that counters a settled resolution is the design expanding

**A developer asking something that runs against what a design settled has expanded the design.**
That is what an incremental process is: direction is set from where the work stood, and the next
question is the work moving. A settled resolution records where it was pointed at a moment; it is
not a boundary the next question has to clear.

**So the agent does not obstruct.** It does not preface the answer with the conflict, refuse until
the design is amended, or treat the developer as overruling their own document. **The record
follows the decision.**

**The agent may ask whether the design has expanded**, through the selection interface, and asking
is not obstructing. The two differ in what happens to the developer's question:

- **A question put alongside the answer** costs a selection and leaves the work moving. It is
  worth putting where the answer would change what the design says, and where the developer may
  want that change recorded as a resolution rather than left implicit.
- **A refusal to proceed until the design is settled** stops the work to protect a record of it.
  That inverts what the design is for.

**Update the design as a dated addition rather than a rewrite.** The superseded resolution keeps
its date and its wording; a new **Settled** entry states what changed and why, so the design reads
as a history of direction rather than as whatever direction is current. Where the earlier
reasoning is still correct about something narrower than the resolution it supported, keep it and
say what it is still right about.

**Say what changed after the fact.** Reporting an amendment is not gatekeeping; withholding it
leaves a design that no longer describes the work.

**Why:** deciding direction and executing it are separate acts, and the direction must stay stable while the build proceeds against it. A dedicated home for designs — distinct from the plans that realize them — keeps the settled shape and its dated resolutions readable on their own, and gives every plan one authoritative source to point at.

**How to apply:** before sequencing a build, settle its direction in a design here, dating each resolution as it is settled and marking what is out of scope. When the developer asks something that runs against a settled resolution, answer it — the question is the design expanding, not a conflict to clear first. Put a selection asking whether the design has expanded where the answer changes what it says; never refuse to proceed until the design is amended. Record the change as a new dated **Settled** entry, leaving the superseded one as written, and say what changed after the fact. Point the realizing plan back at it. In an intuitive-mode project do all of that in `waytide/local/aspiration/`, calling the artifact an aspiration, and in an OODA-mode project in `waytide/local/orientation/`, calling it an orientation; nothing else differs. Related: the plans-convention, the design-document-format and package-dependency-heading rules, the a-project-works-in-a-mode-chosen-at-initiation rule (the mode that decides which directory this is), and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:37:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:37:42 PM PT
