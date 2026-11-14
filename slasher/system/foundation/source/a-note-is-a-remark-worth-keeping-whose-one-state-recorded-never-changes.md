# A note is a remark worth keeping, whose one state, Recorded, never changes

**Trigger:** When recording or revising a note in slasher/local/items/

**A note is a remark worth keeping that binds nothing.** It can be a working hypothesis, a definition, a method the engineer has not ratified, a finding, or anything else said in the work that should not be lost. It is not read as binding at session start, as a rule is. It records what was thought or seen at the time it was written.

**A note lives in `slasher/local/items/` and is tagged `[note]`.** The tag is what makes a record a note.

**As the engineer stated it:** "Observation" items become "note" items. Observeration stays exclusive to DBE

**The word *observation* belongs to Design By Efferent.** There, an observation is what a test reads about the outcome of an actuation. A remark worth keeping is a note, never an observation, so the one word does not name two things.

## `Recorded` is a note's only state, and it never changes

**As the engineer stated it:** observations don't need a state, they don't have a lifecycle, they are just stated — and the state could be `Stated`.

**As the engineer later stated it:** change an observation's "stated" state to "recorded".

**A note carries `**State:** Recorded` from the moment it is written**, and it carries that word for the rest of its life. Its filename ends `-RECORDED`.

**It carries no `**Why this state:**` line.** That line said how settled the thinking was. Where a record has one state and cannot leave it, there is nothing to account for.

**A note has no lifecycle**, which is what one unchanging state says. It is never realized, abandoned, obsolete, superseded, or suspended. Those words belong to a record that was going somewhere, and a note is not going anywhere. It was thought, and it was written down, and neither of those is a stage.

**A note that no longer holds is not retracted.** A later note states the later thinking, and the earlier one stays as what was thought at the time.

**A note is not promoted.** Where the thinking it records stabilizes into a binding convention, the rule is written in `slasher/local/rules/` the way any rule is written. The note is not changed by it. It takes no line naming the rule, and its state stays `Recorded`. It stays as written, as the record of what was thought.

**So the the-items-directory-holds-one-file-per-item rule needs no exception.** Every item carries a state from the moment it is written, and a note does too. What is particular to a note is that the state is fixed, not that it is absent.

## The shape

- **When to use:** the material is worth keeping and binds nothing: a hypothesis under discovery, a method or definition the engineer has not ratified as a convention, a finding, or a remark. When in doubt between a rule and a note, prefer a note. Writing a rule later is cheap, and retracting a premature rule is not.
- **Format:** the same frontmatter-free markdown as rules: a `# <title>`, a `**State:** Recorded` line, a `**Tags:**` line carrying `[note]`, then the content in prose. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule) and ends `-RECORDED`.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
- **Recording one:** add the file, and add a matching one-line entry to `slasher/local/logs/log/` noting it was recorded as a note.

**Why:** the work produces thinking worth keeping that is not ready to bind, or never will be. A place for it keeps that thinking without imposing it as a rule. Keeping *observation* for Design By Efferent alone leaves that word one meaning.

Giving a note the **states every other item takes** would be the cost of holding it in the same directory, and it would buy nothing. When observations had them, sixteen of this project's eighteen sat at `Open` and moved nowhere, because there was nowhere for them to move. A hypothesis that stabilizes becomes a rule somewhere else, and one that does not simply stands.

`Recorded` says what happened to a note, and it stays true: the thinking was written down and kept. `RECORD (v)` is approved in the STE dictionary, meaning *to make notes of and keep data to use subsequently*, and it is used with that meaning. The line still reads as a state, so a directory listing answers the same question for a note that it answers for every other record.

**How to apply:** record a remark worth keeping here, tagged `[note]`, with `**State:** Recorded` and a filename ending `-RECORDED`. Write no `**Why this state:**` line. Never change the state.

Write a later note where the thinking moves, and leave the earlier one as written. Where a rule is written from the same thinking, leave the note as written too.

## Compressed

Lines 1–8 below are the opening statements, which come before any section heading.

1. A note is a remark worth keeping that binds nothing.
2. It can be a working hypothesis, a definition, an unratified method, a finding, or any other remark that should not be lost.
3. It is not read as binding at session start, the way rules are. It records what was thought or seen when it was written.
4. A note lives in `slasher/local/items/`.
5. A note is tagged `[note]`.
6. The tag is what makes a record a note.
7. The word *observation* belongs to Design By Efferent, where it is what a test reads about the outcome of an actuation.
8. Never call a remark worth keeping an observation. It is a note.

## `Recorded` is a note's only state, and it never changes

1. A note carries `**State:** Recorded` from the moment it is written.
2. It keeps that state for the rest of its life.
3. Its filename ends `-RECORDED`.
4. It carries no `**Why this state:**` line.
5. A note has no lifecycle.
6. It is never realized, abandoned, obsolete, superseded, or suspended.
7. A note that no longer holds is not retracted.
8. A later note states the later thinking.
9. The earlier note stays as what was thought at the time.
10. A note is not promoted.
11. Where the thinking stabilizes into a binding convention, write the rule in `slasher/local/rules/` the way any rule is written.
12. Do not change the note. It takes no line naming the rule.
13. The the-items-directory-holds-one-file-per-item rule needs no exception, because a note also carries a state from the moment it is written. Its state is fixed, not absent.

## The shape

1. **When to use:** use a note for material worth keeping that binds nothing: a hypothesis under discovery, an unratified method or definition, a finding, or a remark.
2. When in doubt between a rule and a note, prefer a note.
3. **Format:** use the same frontmatter-free markdown as rules.
4. The file starts with a `# <title>`, then a `**State:** Recorded` line.
5. Next comes a `**Tags:**` line carrying `[note]`, then the content in prose.
6. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
7. The filename ends `-RECORDED`.
8. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
9. **Recording one:** add the file.
10. Add a matching one-line entry to `slasher/local/logs/log/`, noting it was recorded as a note.
11. Never change a note's state.
12. Where the thinking moves, write a later note and leave the earlier one as written.

## Compression

- 2026-10-24, compressed: compression 0.34, change 0.56, solubility 22 → 61, clarity 0.22 → 0.70, 21 directives, 21 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-25, revised: points 11, 12, and 13 take the new wording, that a promoted observation names its result; not checked
- 2026-10-27, re-checked: 22 directives, 21 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 61 → 59, clarity 0.70 → 0.75; checked: 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-10-28, revised: the one state is `Recorded`, not `Stated`, a term the engineer settled; not checked
- 2026-10-29, merge from master re-checked: 31 directives, 31 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-30, revised: lapsed is renamed obsolete; checked: 27 directives, 27 kept, 0 less precise, 0 lost
- 2026-11-06, revised: promotion removed; checked: 22 directives, 20 kept, 1 less precise, 1 lost, 0 repairs. Left as they are: the less precise one lacks only the reason the observation stays as written, that it is the discovery record, and the lost one is the STE meaning of `RECORD (v)`, a reason for the state's word. The compressed text carries no reasons
- 2026-11-11, revised: an observation becomes a note, any remark worth keeping, and the word observation is left to Design By Efferent; checked: 19 directives, 18 kept, 1 less precise, 0 lost, 1 repair, re-checked: 19 kept

## History

Until Wed Nov 11 2026 a note was an observation, tagged `[observation]`, and this rule was named an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes. An observation was a working hypothesis, definition, or method not yet binding, a rule-candidate surfaced during open-ended discovery. `/observation`, `/observe`, and `/item observation` recorded one. The engineer settled that observation items become note items, that a note is any remark worth keeping, and that the word *observation* stays with Design By Efferent.

Until Fri Nov 6 2026 an observation could be promoted to a rule. The rule was written naming the observation, the observation took a `**Promoted to:** the <name> rule` line under its `**Tags:**` line, and a log entry recorded the promotion. `/observation promote` and `/observe promote` carried the act.

Until Fri Oct 30 2026 the state word Obsolete was Lapsed.

Until 2026-10-25 the Promotion step said to "note the promotion in the two files", the rule and the observation, while the same step said to leave the observation as written and the body said nothing about the observation changes when the rule appears. The engineer settled that the rule is the observation's result, and that the observation names it in one added line.

Until Sun Oct 25 2026 this rule was named observations-convention and titled "An observation is `Stated` — a working hypothesis, not yet binding, whose one state never changes".

Until 2026-10-28 an observation's one state was `Stated`, and its filename ended `-STATED`. The engineer settled `Recorded`, a word the STE dictionary approves with the meaning the state needs.

Until Thu Oct 29 2026 this rule was named an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, after the state it then named.

Related:

- the the-items-directory-holds-one-file-per-item rule — the states a note does not take, and the state requirement it satisfies
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — where a rule goes
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the `-RECORDED` filename suffix
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry that records one
- the `design-by-efferent` vocabulary — where an observation is defined

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:32:18 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:23:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 2:22:19 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:29 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:45:17 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:10 AM PT
