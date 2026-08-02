# `waytide/local/work-sessions/` — the narrative record of a work session

`waytide/local/work-sessions/` holds **session records**: the communicable, chronological narrative of a discrete work session between an engineer and Claude. A session is a unit of the engineer's work — it may run a few hours, a whole day, or span more than a day; its boundaries are the discrete piece of work, not a fixed clock.

- **What a session record is.** The **guided tour** of the session — what was asked and what was concluded at each step, in order, with the settled vocabulary defined as it arises. It is written to be *read by a person*, so its job is orientation and reasoning, not truth-of-record.
- **It is not the source of truth.** The durable records are: the binding rules (`waytide/system/`, `waytide/local/rules/`), working observations (`waytide/local/observations/`), the decision log (`waytide/local/log/`), experiments (`waytide/local/experiments/`), and plans (`waytide/local/plans/`). The session record **points to** them throughout; they are authoritative, and the session record is the narrative that ties them together and preserves the reasoning behind each fork.
- **When it is written.** At the close of a session that produced substantial dialogue, decisions, or discovery worth a durable narrative — on the engineer's request, or when the agent recognizes the session has accumulated such work and proposes recording it. A trivial session needs no record; the session record is not a per-session obligation.
- **How the recording is asked.** When the agent raises the question of recording a session, it puts the choice through the **AskUserQuestion** selection UI — not a free-text prose question — offering three options: **write a new session record** for the work, **append the previous session record**, or **don't write a session record**. The engineer's selection decides it. (A direct instruction from the engineer to write or append a record needs no such prompt — the question isn't being asked.)
- **Naming.** A session record is a dated working-state artifact, so it takes the ISO-8601-UTC filename prefix (see the file-names rule): `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a session record

Titled `# Session — <name> (<date>)`, it reads in this order:

- **Opening summary** — a short paragraph naming what the session *was*: its arc (began as X, became Y, ended with Z).
- **Framing note** — that this is the communicable record / guided tour, and that the durable records are the source of truth the narrative points to.
- **Chronological body** — numbered sections (`## 1.`, `## 2.`, …) walking the session in order: what was asked and concluded at each step, with settled vocabulary defined as it arises, and inline pointers to the durable records a step produced.
- **Takeaways** — the settled conclusions, compressed to a few bullets.
- **Glossary** — the terms settled during the session, each with its literal definition.
- **Where the durable records live** — pointers to the rules, observations, log entries, experiments, and code the session produced.
- Optionally, a **reflective closing note** on the session itself.
- A **provenance footer** — like every working-state artifact, a session record ends with the `Authored by … / Changed by …` footer, so the file stands on its own. See the working-state-artifacts-carry-a-provenance-footer rule (the shared convention and its reason) and record-rule-authorship-in-a-footer (the format).

## Reconcile the design once the record is written

**After the record is written, put the design to the developer through the AskUserQuestion selection UI**: does what this session produced change the design, or has the design fallen behind it? Three genuine options — **update the design**, **the design stands**, or **no design bears on this session**.

- **Why the prompt fires here.** Writing the record means reading the session's log entries, rules, and observations — the same material a reconciliation reads — so the reading is already done and the reconciliation costs almost nothing. The session is closing, so nothing is mid-flight and direction can still change cheaply. And deciding to write a record *is* the developer judging the work substantial, so no threshold has to be invented for when to ask.
- **Surface the candidates; do not decide.** Name what the session settled that the design does not reflect, and anything the design asserts that the session contradicts. **Either side may be the stale one** — a design can be out of date, and a design can be right about a direction the work drifted from. Only the developer can say which, which is why this is a prompt and not an edit.
- **A design is reconciled, never regenerated.** A session record is a projection and says so; a design is a source of truth that a plan points back at as its **Source design**. Read the records against the design and change neither on your own initiative. Regenerating a design from the work downstream of it would invert that relationship and would silently treat the implementation as correct every time.
- **Nothing to reconcile is a real answer.** Where the project has no design, or the session produced nothing bearing on one, say so and move on. Do not manufacture a divergence to justify the prompt.
- **What a projection cannot recover.** A design's **Out of Scope / Deferred** section records decisions *not* to do something, and its settled-but-unbuilt direction describes shape ahead of the code. Neither exists anywhere in the records, which is the second reason the design is read against rather than rebuilt.

**Why:** the durable records capture *what* was decided, but the reasoning and the arc of a session — how the thinking moved, why a fork was taken, what vocabulary settled — are easy to lose and expensive to reconstruct. A narrative session record preserves that arc as a communicable whole, and, because it points to the durable records rather than restating them, it stays a guided tour rather than a second source of truth. The format lives here, with the directory convention — not in the `plan` package: a session record is a record of the *past*, while `plan` governs the forward-looking documents (plans, designs), the same way the experiment and loop-record formats live with their own conventions.

**How to apply:** at a substantial session's close, write a session record here that narrates the session chronologically per the shape above, defines the settled vocabulary, points to the durable records it produced, and ends with a provenance footer in the record-rule-authorship-in-a-footer format. When *you* raise the question of recording — rather than being told to — put it through the AskUserQuestion selection UI with the three options (a new record, appending the previous record, or none), and let the engineer's selection decide. Once the record is written, put the **design reconciliation** through the same UI — update the design, the design stands, or no design bears on this session — surfacing what diverges and leaving the verdict to the engineer. Related: the plans-convention, design-convention, and experiments-convention (the sibling artifact conventions), the record-rule-authorship-in-a-footer rule (the footer's format), the design-by-efferent present-every-prompt-through-askuserquestion rule (why every prompt goes through the selection UI), the decision-log rule, and the observations rule.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:43:27 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:37:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
