# A loop record holds the cycles through the loop, one file per feature

**Trigger:** When writing a loop record for a feature under slasher/local/logs/loops/

`slasher/local/logs/loops/` holds **loop records** — one file per feature documenting the cycles through the **loop** (the distributed OODA cycle — see the DBE vocabulary). The log captures *what* was decided, one entry at a time. A loop record captures *how*. It is the deliberation history of a feature. That is the hinges the AI determined, and, in attended work, the options it put to the engineer. It is also the decisions the engineer made, or the chat that replaced them. In unattended work, it is the decisions the agent made, with its reasoning.

**Purpose:** make the *how* of a feature's design recoverable — which hinges were found, what alternatives were weighed, and why the chosen path won. It is the narrative companion to the one-line log, which a loop record must not displace (the log stays one line per entry).

**Format:**
- Filename per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
- A `# Loop record — <feature>` title and a one-paragraph summary of the feature.
- **The mode, declared at the top** — **attended** or **unattended** (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). It is stated once, because it changes how every cycle below is read.
- One section per **cycle**, in order. Each cycle records:
  - **Hinge** — the subtle, load-bearing decision the AI determined.
  - **Options** — the candidates put to the engineer at the gate (or "none — no gate", explicitly, when a hinge was handled without stopping. Surfacing a skipped gate is part of the record's value).
  - **Decision / chat** — what the engineer chose, or the chat that ensued and how it resolved (record the substance of the chat, not just the outcome).
- **Under an unattended mode, a cycle carries its hinge and the decision with its reasoning. No Options or Decision / chat line** — neither happened, and writing them would be a false record of a deliberation that never occurred. This is **not** the "none — no gate" form above: that marks a **skipped** gate in an attended run, which is a defect worth surfacing, where an unattended run has no gates, by decision. The mode declaration is what tells them apart.
- An **Outcome** line: the resulting code/behavior, suite state, and commit.
- A **provenance footer** ending the file (`Authored by … / Changed by …`), like every working-state artifact — see foundation's working-state-artifacts-carry-a-provenance-footer rule.

**Live vs. backfill:** a loop record written *while* doing the work is the default. A record reconstructed **retroactively from memory** must be marked at the top as a **Backfill**. It is reconstructed after the fact rather than captured live, so it is necessarily lossier and may miss cycles or detail.

**Why:** the deliberation is the conveyable substance of this method. That is the hinges and the reasoning over the options. It evaporates if only the final code and one-line decisions survive. A per-feature narrative of the loop's cycles keeps it, teaches the method by example, and exposes where gates were skipped.

**How to apply:** when a feature's loop is worth preserving, add a file under `slasher/local/logs/loops/` in the format above. Record each cycle's hinge, options, and decision or chat. Under unattended work, record its hinge and the decision with its reasoning. Mark retroactive reconstructions as backfills. Keep the one-line log entries separate and intact.

## Compressed

1. `slasher/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop.
2. The loop is the distributed OODA cycle, as defined in the DBE vocabulary.
3. A loop record captures how a feature was decided. The log captures what was decided.
4. A loop record holds the hinges the AI determined and, in attended work, the options it put to the engineer.
5. It also holds the engineer's decisions, or the chat that replaced them. In unattended work, it holds the agent's decisions, with its reasoning.
6. A loop record must not displace the log.
7. The log stays one line per entry. Keep its entries separate and intact.
8. When a feature's loop is worth preserving, add a file under `slasher/local/logs/loops/` in the format below.

## Format

1. Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
2. Begin with a `# Loop record — <feature>` title and a one-paragraph summary of the feature.
3. Declare the mode at the top, as **attended** or **unattended**, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.
4. State the mode once.
5. Write one section per cycle, in order.
6. Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined.
7. Each cycle records **Options**: the candidates put to the engineer at the gate.
8. When a hinge was handled without stopping, write Options explicitly as "none — no gate".
9. Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved.
10. Record the substance of the chat, not just its outcome.
11. Under an unattended mode, a cycle carries its hinge and the decision with its reasoning.
12. Under an unattended mode, write no Options line and no Decision / chat line.
13. The "none — no gate" form marks a skipped gate in an attended run. Do not use it in an unattended run.
14. Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit.
15. End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule.

## Live vs. backfill

1. Writing a loop record while doing the work is the default.
2. Mark a record reconstructed retroactively from memory as a **Backfill**, at the top.

## Compression

- 2026-10-24, compressed: compression 0.22, change 0.57, solubility 45 → 64, clarity 0.45 → 0.68, 23 directives, 23 kept, 0 less precise, 0 lost
- 2026-10-24, revised: points 4 and 5 and How to apply's point 2 name the unattended case; not checked
- 2026-10-27, re-checked: 22 directives, 22 kept, 0 less precise, 0 lost
- 2026-10-27, revised: the log is one file per entry, of short entries, not one line or one file per decision, a term the engineer settled; not checked
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 64 → 63, clarity 0.68 → 0.69; checked: 22 directives, 21 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 63 → 65, clarity 0.69 → 0.69; checked: 22 directives, 22 kept, 0 less precise, 0 lost

## History

Until 2026-10-24 the opening and How to apply described every cycle as recording options and the engineer's decision or chat, without exception. The unattended exception, which came after the rule was written, was stated only in the Format section. The opening and How to apply now carry it too.

Until Sun Oct 25 2026 this rule was named loop-records and titled "Loop records — `waytide/local/logs/loops/`: one file per feature recording the cycles through the loop".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Tue Oct 27 2026 this rule described the log as "one line per decision". An entry can carry a body, and not every entry records a decision, so the engineer settled the wording on short entries, one file each.

Related:

- the DBE vocabulary — loop, hinge, gate, deliberation
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- foundation's file-name prefix and log conventions
- `foundation`'s the-logs-directory-holds-the-contemporaneous-historical-records rule — the contemporaneous, historical records this sits among, which names this directory without requiring anything of it

---

Authored by Scott Bellware on Tue Jun 30 2026 at 12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:21:11 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:46:55 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:13:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:02:10 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
