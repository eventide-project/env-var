# `waytide/local/ideas/` — the project's ideas, one file per idea

`waytide/local/ideas/` holds the project's **ideas**: the thinking that settles what the work should be and how it should go. **An idea is an idea**, and that is the whole of what a record here is.

**A tag may describe an idea, and nothing about it is strict.** A design idea is tagged `[design]`, a plan idea `[plan]`, an aspiration `[aspiration]`. The tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-takes-category-tags rule), the set is open, and an idea may carry several or none at all.

**No kind tag is assigned by default, and `[aspiration]` least of all.** It is written where an aspiration is what was asked for, and never as the dress a design idea is put in because something had to go on the line. An idea that nobody called anything carries no kind tag, and that is not an omission.

**The tag describes and decides nothing.** No rule reads a kind tag, no report groups by one, and no filename derives from one. What the record *is* is in the record.

**This is the last of the mode vocabulary, and it is gone with it.** A project once worked in one of three modes, and the mode fixed what a planning record was called — a design, an aspiration, or an orientation in one; a plan, an intention, or an action in another. The mechanism was decommissioned on 2026-08-18 and the six words outlived it as a tag set that still read as exhaustive.

**No tag is reserved here, and none is read mechanically.** `[deferred]` marked work postponed until the current task finishes, and the ideas carrying it were a queue with a rule of its own. That convention was suspended on 2026-08-25 — what made it a queue was a session-start print and a command, and both are gone. The tag is freeform like any other, and what it used to carry is the two lines below.

## Two optional lines any idea may carry

**`**Waits for:**` states what must finish before the idea is actionable.** That is the whole of what it does. It does not say what to work next.

**`**Priority:**` holds a rank** — `- **Priority:** 3`. Ranks are 1 through N, contiguous, one idea per number, and rank 1 is worked next among the ideas that are actionable.

**Rank is not the wait.** An idea that is waiting may still be ranked, and a rank does not clear a wait.

**Both are optional and most ideas carry neither.** An idea is frequently written at the moment its material is at hand, which is exactly when a ranking decision is what is being put off. An unranked idea is not a defect.

**Renumbering on insert is the cost, and it is accepted.** Putting an idea at a given rank moves every idea below it, so a change of priority changes several files. That is the cost of each idea stating its own position in a form that reads as the order the engineer gave.

**An idea's content is point-in-time.** What an idea says was true when it was written — the work that was in progress, the rules as they stood, the artifacts that existed. **A reference inside an idea that time has overtaken is not a defect and is not chased.** An idea waiting on an experiment does not stop being correct when that experiment is superseded, because it records what it was waiting for.

**Nothing derives from either line.** They were a queue's mechanism until 2026-08-25 and are now an idea's own content, read by whoever reads the idea.

## The shape

- **One file per idea**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with its state in upper case (see the a-record-ends-with-its-state-in-upper-case rule).
- **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**` line, then whatever the idea has to say.
- **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer rule).
- **A log entry** pairs with it on creation and on each change of state (see the an-idea-takes-a-log-entry rule).
- **No code samples** (see the plans-no-code-samples rule).

**Nothing else is required.** An idea that settles things records them as dated **Settled** resolutions and marks what it deliberately leaves out in an **Out of Scope / Deferred** tail. An idea that sequences work carries checkbox tasks stating behavior. An idea that does neither carries neither. **The four rules this replaces fixed a spine.** This one does not: an idea is thinking, and a shape imposed on thinking is ceremony wherever the thinking does not have it.

## The states

Every idea carries a `**State:**` line, from the moment it is written:

- **Open** — the thinking is not settled. Where an idea starts when it is a hypothesis rather than a direction.
- **Active** — settled, and the work is expected. Where an idea starts when it settles something.
- **Realized** — what the idea describes exists.
- **Deferred** — kept deliberately, with no date and nobody working toward it. **An idea that is merely waiting its turn is not this** — it carries a `**Waits for:**` line and whatever state its thinking has reached.
- **Suspended** — paused, not ended.
- **Superseded** — another idea replaced it, and the two name each other.
- **Abandoned** — dropped, by decision.
- **Stated** — an observation, and an observation only. It is the one state that never changes: an observation has no lifecycle, so it carries this word from the moment it is written and carries it for good. See the observations-convention.
- **Lapsed** — it lost its relevance over time. **`Lapsed` and `Abandoned` differ in who acted:** abandoning is a decision, and lapsing is what happens when nobody decides and the work moves past the idea.

**`Stated` is the third starting word and the only terminal one**, and an observation takes it alone. Every other idea takes one of the two below.

**`Open` and `Active` are the two starting words**, and which one an idea takes says what kind of record it is being written as. Absence is not a state, and an idea without a line is a defect.

**`Realized`, `Deferred`, and `Open` are taken back**, each returning to `Active` or to `Open` when the work resumes. The rest are not.

**One word covers what two used to.** `Realized` replaces the pair `Realized` and `Implemented`, which distinguished a direction taken up from a sequence built. That distinction went with the mode vocabulary, and one word is what remains of it.

## Supersession

**A later idea may supersede an earlier one.** The earlier takes `**State:** Superseded` and the two name each other in their prose. What the earlier one settled stays as written — a superseded idea is a record of what was thought, not a draft.

**An idea is amended by a dated addition rather than a rewrite.** A resolution that no longer holds keeps its date and its wording, and a later one states what changed. So an idea reads as a history of thinking rather than as whatever is current.

**A question that runs against something an idea settled has expanded the idea.** The agent answers it and records the change. It does not refuse until the idea is amended, which would stop the work to keep a record of it.

**A settled idea is reconciled, never regenerated.** Where one idea names another as the thing it realizes, the named one is a source of truth. Rebuilding it from the work downstream would invert that and would treat the implementation as correct every time.

**Why:** one directory and one class of record, because the six that came before it differed in what they were called and in nothing a rule depended on. What varies between them is a word, and a word is carried by a tag.

Keeping the shape thin is the other half. The rules this replaces fixed a spine for a design and an element order for a plan, and an idea that is neither had nowhere to sit. What every idea genuinely shares is a state, a tag, a footer, a log entry, and a name.

**How to apply:** write an idea as a file in `waytide/local/ideas/`, with a `**State:**` line, a `**Tags:**` line saying what it is, and the ISO-8601-UTC prefix and state suffix in its name. Start it **Open** where the thinking is unsettled and **Active** where it settles something.

Change the state as the idea reaches another word, renaming the file with it, and write the log entry. Supersede rather than rewrite. Amend by dated addition. Add no spine the thinking does not have.

Related:

- the a-record-takes-category-tags rule — the tags that say what an idea is
- the a-record-ends-with-its-state-in-upper-case rule — the filename suffix
- the an-idea-takes-a-log-entry rule — the log entry an idea takes
- the observations-convention — an observation, which is an idea and carries the promotion path to a rule
- the file-names, working-state-artifacts-carry-a-provenance-footer, and plans-no-code-samples rules
- the a-suspension-is-a-log-entry rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

---

Authored by Scott Bellware on Mon Aug 17 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
