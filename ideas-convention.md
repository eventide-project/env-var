# `waytide/local/ideas/` — the project's ideas, one file per idea

`waytide/local/ideas/` holds the project's **ideas**: the thinking that settles what the work
should be and how it should go. A design is an idea. An idea is a design. So is a plan, an
aspiration, an intention, an orientation, an action, a specification, and an observation.

**What each one is, is a tag.** An aspiration is an idea tagged `[aspiration]`. The tags are the
ordinary square-bracket tags every working-state artifact takes (see the
a-record-takes-category-tags rule), and the set is open — a project writes the tag
it needs.

**One tag is reserved and is read mechanically: `[deferred]`.** It marks work postponed until the
current task finishes, and the ideas carrying it are the deferred queue, printed at the start of
every session. It is independent of the state, and it is not the `Deferred` state. See the
deferred-queue-convention.

## The shape

- **One file per idea**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with
  its state in upper case (see the a-record-ends-with-its-state-in-upper-case rule).
- **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**`
  line, then whatever the idea has to say.
- **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer
  rule).
- **A log entry** pairs with it on creation and on each change of state (see the
  direction-and-sequencing-artifacts-take-a-log-entry rule).
- **No code samples** (see the plans-no-code-samples rule).

**Nothing else is required.** An idea that settles things records them as dated **Settled**
resolutions and marks what it deliberately leaves out in an **Out of Scope / Deferred** tail. An
idea that sequences work carries checkbox tasks stating behavior. An idea that does neither
carries neither. **The four rules this replaces fixed a spine.** This one does not: an idea is
thinking, and a shape imposed on thinking is ceremony wherever the thinking does not have it.

## The states

Every idea carries a `**State:**` line, from the moment it is written:

- **Open** — the thinking is not settled. Where an idea starts when it is a hypothesis rather than
  a direction.
- **Active** — settled, and the work is expected. Where an idea starts when it settles something.
- **Realized** — what the idea describes exists.
- **Deferred** — kept deliberately, with no date and nobody working toward it. **This is not the
  `[deferred]` tag**, which means queued rather than parked.
- **Suspended** — paused, not ended.
- **Superseded** — another idea replaced it, and the two name each other.
- **Abandoned** — dropped, by decision.
- **Lapsed** — it lost its relevance over time. **`Lapsed` and `Abandoned` differ in who acted:**
  abandoning is a decision, and lapsing is what happens when nobody decides and the work moves
  past the idea.

**`Open` and `Active` are the two starting words**, and which one an idea takes says what kind of
record it is being written as. Absence is not a state, and an idea without a line is a defect.

**`Realized`, `Deferred`, and `Open` are taken back**, each returning to `Active` or to `Open`
when the work resumes. The rest are not.

**One word covers what two used to.** `Realized` replaces the pair `Realized` and `Implemented`,
which distinguished a direction taken up from a sequence built. That distinction was dropped with
the direction-and-sequencing pairing on 2026-08-18, and one word is what remains of it.

## Supersession

**A later idea may supersede an earlier one.** The earlier takes `**State:** Superseded` and the
two name each other in their prose. What the earlier one settled stays as written — a superseded
idea is a record of what was thought, not a draft.

**An idea is amended by a dated addition rather than a rewrite.** A resolution that no longer
holds keeps its date and its wording, and a later one states what changed. So an idea reads as a
history of thinking rather than as whatever is current.

**A question that runs against something an idea settled has expanded the idea.** The agent
answers it and records the change. It does not refuse until the idea is amended, which would stop
the work to keep a record of it.

**A settled idea is reconciled, never regenerated.** Where one idea names another as the thing it
realizes, the named one is a source of truth. Rebuilding it from the work downstream would invert
that and would treat the implementation as correct every time.

**Why:** one directory and one class of record, because the six that came before it differed in
what they were called and in nothing a rule depended on. What varies between them is a word, and a
word is carried by a tag.

Keeping the shape thin is the other half. The rules this replaces
fixed a spine for a design and an element order for a plan, and an idea that is neither had
nowhere to sit. What every idea genuinely shares is a state, a tag, a footer, a log entry, and a
name.

**How to apply:** write an idea as a file in `waytide/local/ideas/`, with a `**State:**` line, a
`**Tags:**` line saying what it is, and the ISO-8601-UTC prefix and state suffix in its name.
Start it **Open** where the thinking is unsettled and **Active** where it settles something.

Change the state as the idea reaches another word, renaming the file with it, and write the log
entry. Supersede rather than rewrite. Amend by dated addition. Add no spine the thinking does not
have.

Related:

- the a-record-takes-category-tags rule — the tags that say what an idea is
- the deferred-queue-convention — the one reserved tag, and the queue it makes
- the a-record-ends-with-its-state-in-upper-case rule — the filename suffix
- the direction-and-sequencing-artifacts-take-a-log-entry rule — the log entry, whose name carries concepts this rule does not
- the observations-convention — an observation, which is an idea and carries the promotion path to a rule
- the file-names, working-state-artifacts-carry-a-provenance-footer, and plans-no-code-samples rules
- the a-suspension-is-a-log-entry rule — the other `Suspended`, which is an act on something the
  project did rather than a state on something it wanted

---

Authored by Scott Bellware on Mon Aug 17 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
