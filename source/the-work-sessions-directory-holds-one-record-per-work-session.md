# The work-sessions directory holds one record per work session

`slasher/local/logs/work-sessions/` holds **work session records**: the communicable, chronological narrative of a discrete work session between an engineer and Claude. A work session is a unit of the engineer's work. It may run a few hours, a whole day, or span more than a day. Its boundaries are the discrete piece of work, not a fixed clock.

- **What a work session record is.** The **guided tour** of the work session — what was asked and what was concluded at each step, in order, with the settled vocabulary defined as it arises. It is written to be *read by a person*, so its job is orientation and reasoning, not truth-of-record.
- **It is not the source of truth.** The durable records are: the binding rules (`slasher/system/`, `slasher/local/rules/`), the project's items (`slasher/local/items/`), the log (`slasher/local/logs/log/`), and the implementation records (`slasher/local/implementations/`). The work session record **points to** them throughout. They are authoritative, and the work session record is the narrative that ties them together and preserves the reasoning behind each fork.
- **When it is written.** At the close of a work session that produced substantial dialogue, decisions, or discovery worth a durable narrative — on the engineer's request, or when the agent recognizes the work session has accumulated such work and proposes recording it. A trivial work session needs no record. The work session record is not a per-session obligation. **The agent also proposes recording at a conclusion it carries out:** when it concludes a feature, an experiment, or a phase, or takes an item to Done, Realized, Abandoned, or Superseded. Each is a discrete act the agent takes, so the proposal cannot be missed there.
- **How the recording is asked.** When the agent raises the question of recording a work session, it puts the decision through the **AskUserQuestion** selection UI, not a free-text prose question. It offers three options, each naming it a **work session record**: **write a new work session record** for the work, **amend the previous work session record**, or **don't write a work session record**. The amend option names the previous record in a few words, as in *Amend the previous work session record, "Checkout payments"*, so the engineer knows which record it is. The engineer's selection decides it. **The prompt says "work session"** — the directory is `work-sessions/`, a work session here is a unit of the engineer's work, and the shortened form invites the reader to supply some other sense of "session". (A direct instruction from the engineer to write or amend a record needs no such prompt — the question isn't being asked.)
- **Naming.** A work session record is a dated working-state artifact, so it takes the ISO-8601-UTC filename prefix (see the file-names rule): `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a work session record

Titled `# Work Session — <name> (<date>)`, it reads in this order. **Records written before 2026-08-03 are titled `# Session — …`** and keep those titles. A record states what it stated when it was written. Retitling it would edit a historical record to suit a later convention.

- **Opening summary** — a short paragraph naming what the work session *was*: its arc (began as X, became Y, ended with Z).
- **Framing note** — that this is the communicable record / guided tour, and that the durable records are the source of truth the narrative points to.
- **Chronological body** — numbered sections (`## 1.`, `## 2.`, …) walking the work session in order. Each states what was asked and concluded at that step, with settled vocabulary defined as it arises, and inline pointers to the durable records the step produced.
- **Takeaways** — the settled conclusions, compressed to a few bullets.
- **Glossary** — the terms settled during the work session, each with its literal definition.
- **Where the durable records live** — pointers to the rules, notes, log entries, experiments, and code the work session produced.
- Optionally, a **reflective closing note** on the work session itself.
- A **provenance footer** — like every working-state artifact, a work session record ends with the `Authored by … / Changed by …` footer, so the file stands on its own. See the working-state-artifacts-carry-a-provenance-footer rule (the shared convention and its reason) and the record-a-rules-authorship-in-a-provenance-footer rule (the format).

**Why:** the durable records capture *what* was decided. The reasoning and the arc of a work session are easy to lose and expensive to reconstruct. That is how the thinking moved, why a fork was taken, and what vocabulary settled.

A narrative work session record preserves that arc as a communicable whole. It points to the durable records rather than restating them. So it stays a route through the records rather than a second source of truth. The format lives here, with the directory convention, the same way the experiment and loop-record formats live with theirs.

**A work session record is not shaped like a plan.** It records the *past*, while a plan and a design look forward.

**How to apply:** at a substantial work session's close, write a work session record here. It narrates the work session chronologically per the shape above. It defines the settled vocabulary, and points to the durable records it produced. It ends with a provenance footer in the record-a-rules-authorship-in-a-provenance-footer format.

When *you* raise the question of recording, rather than being told to, put it through the AskUserQuestion selection UI. It carries the three options, each naming a **work session record**: a new one, amending the previous one, named in a few words, or none. Let the engineer's selection decide.

## Compressed

1. `slasher/local/logs/work-sessions/` holds work session records.
2. A work session record is the chronological narrative of one discrete work session between an engineer and Claude.
3. A work session is a unit of the engineer's work. It may last hours, a day, or longer.
4. The discrete piece of work sets a work session's boundaries, not a fixed clock.
5. A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order.
6. It defines settled vocabulary as that vocabulary arises.
7. It is written for a person to read. Its job is orientation and reasoning, not truth-of-record.
8. It is not the source of truth. The durable records are authoritative.
9. The durable records are the binding rules (`slasher/system/`, `slasher/local/rules/`), the items (`slasher/local/items/`), the log (`slasher/local/logs/log/`), and the implementation records (`slasher/local/implementations/`).
10. The record points to the durable records throughout. It does not restate them.
11. The record keeps the reasoning behind each fork in the work. It ties the durable records together as a narrative and keeps the arc.
12. Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative.
13. Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work.
14. A trivial work session needs no record. A record is not required for every session.
15. Also propose it when the agent concludes a feature, an experiment, or a phase, or takes an item to Done, Realized, Abandoned, or Superseded.
16. When the agent raises the question of recording, it asks through the AskUserQuestion selection UI, not as a prose question. The prompt offers three options, each naming a **work session record**: **write a new work session record**, **amend the previous work session record**, or **don't write a work session record**. The amend option names the previous record in a few words.
17. The engineer's selection decides.
18. The prompt says "work session", never the shortened "session".
19. A direct instruction from the engineer to write or amend a record needs no prompt.
20. Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a work session record

1. Title the record `# Work Session — <name> (<date>)`.
2. Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them.
3. The parts appear in the order below.
4. **Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z.
5. **Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth.
6. **Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order.
7. Each section states what was asked and concluded at that step.
8. Each section defines settled vocabulary as it arises.
9. Each section points inline to the durable records that step produced.
10. **Takeaways**: the settled conclusions, compressed to a few bullets.
11. **Glossary**: the terms settled during the work session, each with its literal definition.
12. **Where the durable records live**: pointers to the rules, notes, log entries, experiments, and code the work session produced.
13. Optionally, a **reflective closing note** on the work session itself.
14. A **provenance footer**: the record ends with the `Authored by … / Changed by …` footer, like every working-state artifact.
15. The footer follows the working-state-artifacts-carry-a-provenance-footer rule and the record-a-rules-authorship-in-a-provenance-footer format.
16. A work session record is not shaped like a plan. It records the past. This convention defines that format, alongside the directory.

## Compression

- 2026-10-24, compressed: compression 0.33, change 0.61, solubility 18 → 45, clarity 0.32 → 0.75, 38 directives, 38 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-25, revised: point 18 takes the new wording, that every prompt says work session; not checked
- 2026-10-27, re-checked: 34 directives, 34 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 45 → 46, clarity 0.75 → 0.77; checked: 36 directives, 36 kept, 0 less precise, 0 lost
- 2026-11-05, revised: the agent also proposes a record at a conclusion it carries out; checked: 36 directives, 34 kept, 1 less precise, 1 lost, 1 repair, restoring that a design is read against the records and never regenerated from them; re-checked: 36 directives, 36 kept, 0 less precise, 0 lost
- 2026-11-07, revised: the design reconciliation asked after a record is written is removed, as the engineer directed; checked: 36 directives, 35 kept, 1 less precise, 0 lost, 1 repair, restoring that the recording question is asked through the selection UI; re-checked: 36 directives, 36 kept, 0 less precise, 0 lost
- 2026-11-07, revised: the second option reads *amend the previous work session record* and names that record in a few words, and a direct instruction is to write or amend; checked: 40 directives, 40 kept, 0 less precise, 0 lost
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Sat Nov 7 2026 the second option read *append the previous work session record*, and did not name the record. The engineer settled that it reads *amend*, since bringing a record up to date changes more than its end, and that it names the record in a few words.

Until Sat Nov 7 2026, after a record was written, the agent asked whether the work session's output changed the design or the design had fallen behind it, with the options *update the design*, *the design stands*, and *no design bears on this work session*. The engineer removed the question as obsolete.

Until Thu Nov 5 2026 the agent proposed a record only at a work session's close.

Later on Thu Nov 5 2026 the engineer had it pre-loaded, so the agent offers a work session record as a session closes, as it did before its trigger was reworded.

Until Thu Nov 5 2026 its trigger read *When a work session is closing, or the engineer asks for a work session record*, which was not a safe one.

The rule was written in `foundation` rather than in the `plan` package on that ground. That package was included in `foundation` on 2026-08-03, so the distinction no longer decides where a format lives.

Until 2026-10-25 the statement that the prompt always says "work session" sat in the recording prompt's bullet alone, and How to apply worded the design reconciliation's third option as "no design bears on this session". The engineer settled that every prompt this convention puts says "work session", and How to apply now says it too.

Until Sun Oct 25 2026 this rule was named work-sessions-convention and titled "`waytide/local/logs/work-sessions/` — the narrative record of a work session".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Mon Oct 26 2026 this rule was named a-work-session-record-is-the-narrative-of-one-work-session and titled "A work session record is the narrative of one work session".

Related:

- the the-implementations-directory-holds-one-record-per-implementation rule and the the-items-directory-holds-one-file-per-item rule — the sibling artifact conventions
- the record-a-rules-authorship-in-a-provenance-footer rule — the footer's format
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — why every prompt goes through the selection UI
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule
- the notes rule
- the the-logs-directory-holds-the-contemporaneous-historical-records rule — the contemporaneous, historical records this sits among

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
Changed by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:03:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:57:38 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:13:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:51:20 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:54:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:26:13 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:56:50 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
