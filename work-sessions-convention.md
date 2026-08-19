# `waytide/local/logs/work-sessions/` — the narrative record of a work session

`waytide/local/logs/work-sessions/` holds **work session records**: the communicable, chronological narrative of a discrete work session between an engineer and Claude. A work session is a unit of the engineer's work. It may run a few hours, a whole day, or span more than a day. Its boundaries are the discrete piece of work, not a fixed clock.

- **What a work session record is.** The **guided tour** of the work session — what was asked and what was concluded at each step, in order, with the settled vocabulary defined as it arises. It is written to be *read by a person*, so its job is orientation and reasoning, not truth-of-record.
- **It is not the source of truth.** The durable records are: the binding rules (`waytide/system/`, `waytide/local/rules/`), the project's ideas (`waytide/local/ideas/`), the decision log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`). The work session record **points to** them throughout. They are authoritative, and the work session record is the narrative that ties them together and preserves the reasoning behind each fork.
- **When it is written.** At the close of a work session that produced substantial dialogue, decisions, or discovery worth a durable narrative — on the engineer's request, or when the agent recognizes the work session has accumulated such work and proposes recording it. A trivial work session needs no record. The work session record is not a per-session obligation.
- **How the recording is asked.** When the agent raises the question of recording a work session, it puts the decision through the **AskUserQuestion** selection UI, not a free-text prose question. It offers three options, each naming it a **work session record**: **write a new work session record** for the work, **append the previous work session record**, or **don't write a work session record**. The engineer's selection decides it. **The prompt always says "work session"** — the directory is `work-sessions/`, a work session here is a unit of the engineer's work, and the shortened form invites the reader to supply some other sense of "session". (A direct instruction from the engineer to write or append a record needs no such prompt — the question isn't being asked.)
- **Naming.** A work session record is a dated working-state artifact, so it takes the ISO-8601-UTC filename prefix (see the file-names rule): `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a work session record

Titled `# Work Session — <name> (<date>)`, it reads in this order. **Records written before
2026-08-03 are titled `# Session — …`** and keep those titles. A record states what it stated
when it was written. Retitling it would edit a historical record to suit a later convention.

- **Opening summary** — a short paragraph naming what the work session *was*: its arc (began as X, became Y, ended with Z).
- **Framing note** — that this is the communicable record / guided tour, and that the durable records are the source of truth the narrative points to.
- **Chronological body** — numbered sections (`## 1.`, `## 2.`, …) walking the work session in order. Each states what was asked and concluded at that step, with settled vocabulary defined as it arises, and inline pointers to the durable records the step produced.
- **Takeaways** — the settled conclusions, compressed to a few bullets.
- **Glossary** — the terms settled during the work session, each with its literal definition.
- **Where the durable records live** — pointers to the rules, observations, log entries, experiments, and code the work session produced.
- Optionally, a **reflective closing note** on the work session itself.
- A **provenance footer** — like every working-state artifact, a work session record ends with the `Authored by … / Changed by …` footer, so the file stands on its own. See the working-state-artifacts-carry-a-provenance-footer rule (the shared convention and its reason) and record-rule-authorship-in-a-footer (the format).

## Reconcile the settled direction once the record is written

**This section says *design* throughout for readability, and means whichever settled idea the work session bears on.** A design is an idea, and an idea is a design — the kind is a tag rather than a class. Nothing in this section depends on which kind it carries.

**After the record is written, put the design to the engineer through the AskUserQuestion selection UI.** Does what this work session produced change the design, or has the design fallen behind it? Three genuine options — **update the design**, **the design stands**, or **no design bears on this work session**.

- **Why the prompt fires here.** Writing the record means reading the work session's log entries, rules, and observations — the same material a reconciliation reads — so the reading is already done and the reconciliation costs almost nothing. The work session is closing, so nothing is mid-flight and direction can still change cheaply. And deciding to write a record *is* the engineer judging the work substantial, so no threshold has to be invented for when to ask.
- **Surface the candidates. Do not decide.** Name what the work session settled that the design does not reflect, and anything the design asserts that the work session contradicts. **Either side may be the stale one** — a design can be out of date, and a design can be right about a direction the work drifted from. Only the engineer can say which, which is why this is a prompt and not an edit.
- **A design is reconciled, never regenerated.** A work session record is a projection and says so. A design is a source of truth that a plan points back at as its **Source design**. Read the records against the design and change neither on your own initiative. Regenerating a design from the work downstream of it would invert that relationship and would silently treat the implementation as correct every time.
- **Nothing to reconcile is a real answer.** Where the project has no design, or the work session produced nothing bearing on one, say so and move on. Do not manufacture a divergence to justify the prompt.
- **What a projection cannot recover.** A design's **Out of Scope / Deferred** section records decisions *not* to do something, and its settled-but-unbuilt direction describes shape ahead of the code. Neither exists anywhere in the records, which is the second reason the design is read against rather than rebuilt.

**Why:** the durable records capture *what* was decided. The reasoning and the arc of a work session are easy to lose and expensive to reconstruct. That is how the thinking moved, why a fork was taken, and what vocabulary settled.

A narrative work session record preserves that arc as a communicable whole. It points to the durable records rather than restating them. So it stays a route through the records rather than a second source of truth. The format lives here, with the directory convention, the same way the experiment and loop-record formats live with theirs.

It was written here rather than in the `plan` package on one ground. A work session record is a record of the *past*, while a plan and a design look forward. That package was included in `foundation` on 2026-08-03, so the distinction no longer decides where a format lives. It is still the reason a work session record is not shaped like a plan.

**How to apply:** at a substantial work session's close, write a work session record here. It narrates the work session chronologically per the shape above. It defines the settled vocabulary, and points to the durable records it produced. It ends with a provenance footer in the record-rule-authorship-in-a-footer format.

When *you* raise the question of recording, rather than being told to, put it through the AskUserQuestion selection UI. It carries the three options, each naming a **work session record**: a new one, appending the previous one, or none. Let the engineer's selection decide.

Once the record is written, put the **design reconciliation** through the same UI. The options are to update the design, that the design stands, or that no design bears on this session. Surface what diverges, and leave the verdict to the engineer.

Related:

- the implementations-convention and the ideas-convention — the sibling artifact conventions
- the record-rule-authorship-in-a-footer rule — the footer's format
- the present-every-prompt-through-askuserquestion rule — why every prompt goes through the selection UI
- the decision-log rule
- the observations rule
- the logs-directory rule — the running records this sits among

---

Authored by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:43:27 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:37:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 1:42:18 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 2:36:41 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 2:41:55 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 12:05:31 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:03:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:57:02 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:40:54 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 5:26:42 PM PT
