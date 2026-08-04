# Foundation — Vocabulary

The foundation package's vocabulary: the terms it defines and the word substitutions it
enforces. These are the terms every other package and every project uses, because foundation
defines the artifacts the rest of the system writes into. Binding — use these terms and swaps in
rules, artifacts, prose, and dialogue.

## Terms

### The three ways of saying "not now"

**These are the terms most easily confused, and they are confused because nothing has stated
them beside each other.** They differ in *what is set aside*, *where it goes*, and *what brings
it back*.

- **deferred** — a **design change** identified mid-task and postponed until the current task
  finishes. It goes into `waytide/local/deferred/` as a **queue, not a record**: an item is
  worked and then its file is **deleted**, leaving a decision-log entry as the durable trace. A
  deferred item is *waiting its turn* — the project still intends to do it. It carries a
  `**Gated on:**` line saying what must finish first, and may carry a `**Priority:**` rank. Its
  rule is the deferred-convention.
- **suspended** — something the project **stopped doing** and set aside rather than deleted: a
  rule that became ceremony, a procedure nobody runs. The thing **itself moves** into
  `waytide/local/suspended/`, intact, carrying its **return address** so the suspension can be
  reversed. A suspended thing is *not waiting its turn* — the project has stopped, and the
  resumption note states what would change that. Its rule is the suspended-convention.
- **out of scope** — what a **design deliberately excludes**. It is neither queued nor set
  aside; it is a boundary the design draws around itself, recorded in its trailing **Out of
  Scope / Deferred** section so a reader knows the omission was chosen rather than overlooked.
  Its rule is the design-convention.

The distinguishing question: **deferred** is *not yet*, **suspended** is *no longer*, **out of
scope** is *not here*.

### The rest

- **projection** — a **derived** artifact that reads a record **without destroying it**. A
  summary generated at read-time is a projection of the decision log; a work session record is a
  projection of the records it is reconstituted from. The term exists to name the alternative to
  consolidation: where the impulse is to merge, rewrite, or tidy a record into something more
  readable, a projection gives the readability and leaves the record as written. A projection is
  regenerated, never maintained — which is why the record it derives from is **not back-edited**
  to suit it.
- **reconcile** — to correct the **live, forward-looking** artifacts that cite something which
  has changed, moved, or been deleted. Reconciling is directed at what points *at* a thing, not
  at the thing itself, and it is confined to artifacts read as current: an observation, a
  design, a plan, another deferred item. **Historical records are left as written**, the one exception being a record that discloses what should not have been disclosed; see the disclosure rule. A design is
  reconciled **against** the records rather than **regenerated from** them: it is a source of
  truth a plan points back at, so rebuilding it from downstream work would invert the direction
  of authority.
- **working-state artifact** — a file holding the project's **own work** rather than an
  installed rule: everything under `waytide/local/` except `rules/` — log entries, deferred
  items, observations, designs, plans, work session records, loop records, feature records,
  experiments, migration records, suspended things. The class exists because a single set of
  obligations falls on all of them: the ISO-8601-UTC filename prefix, and the
  `Authored by … / Changed by …` provenance footer.
- **recognizable-content line** — a **bold label, a colon, and a value**, optionally as a list
  item — `- **Priority:** 3`, `**State:** active`, `**Origin:** waytide/system/…`. It is the
  system's one protocol for content that is read **mechanically** as well as by a person:
  `session-start.sh` parses these lines. One form across the system rather than a new one per
  directory. Frontmatter is permitted and would serve equally; it is not used where this form
  already fits.

## Substitutions

Foundation-domain word substitutions. When the impulse is a word in the **Don't say** column,
write the **Say** term.

| Say | Don't say | What it names |
|---|---|---|
| **work session record** | "session record" | the record of a stretch of work — see below |

### Finer distinctions

- **work session record** — always carrying **work**. Bare *session* is ambiguous: a reader can
  supply a shell session, a therapy session, or a parliamentary one, and the shell reading is
  the one a developer reaches first. The qualifier says which sense is meant. This holds in the
  prompt that offers to write one, in the record's own title (`# Work Session — <name> (<date>)`),
  in the directory name (`waytide/local/work-sessions/`), and in prose about either.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
