# A rule's compressed text is written in its source, checked against it, and its figures recorded below the body

**Trigger:** When editing a source rule's body, or writing, revising, or checking a rule's compressed text

**A source rule may carry a compressed text: the rule restated with the same effect and outcome, in fewer words.** It is written in the source, in a `## Compressed` section below the body, and it shares the source's title and `Related:` list. The source's body stays the authority. The compressed text is a second rendering of it, and is never edited apart from it.

## The compressed text

**The compressed text is numbered lists.** Each point is one or two short sentences, carrying one directive. Headings within the section group the points, and each group's list numbers from 1. A fenced example the directives depend on is kept.

**The compressed text carries no reasons.** A rule's reasons stay in its body, which remains the authority. Where a reason itself constrains what is done, the compressed text states that constraint as a directive.

**A change to the body reaches the compressed text in the same commit.** A point keeps its number where it can, so that a check's verdicts and a reader's references still find it.

**`./compile.sh` packages the compressed texts.** It writes each package's `rules-pre-loaded.md`, at the package root, holding every rule in its `source/`: the rule's title, a `Source:` line with the path of its source, and its compressed text. A rule with no Compressed section appears with its body in its place. The rules file carries no `## Compressed` heading, no figures, no `## History` section, no `Related:` list, and no provenance footer.

## The check

**A compressed text stands only after it is checked against its source.** The check has two parts, each done by a fresh agent that has not seen the compression:

1. A lister lists the source's directives from its body, without the Compressed section, the Compression section, and the footer.
2. A checker judges each directive against the title, the compressed text, and the `Related:` list, as **kept**, **less precise**, or **lost**.

**A lost directive, and a materially less precise one, is repaired with the smallest clause that closes the gap**, and the repaired rule is checked again in full. Where two checkers disagree on a directive, the source decides. A less precise directive left as it is, and why, is recorded.

**A change to a compressed text after its check is checked again.** A change that only swaps one term for another the engineer settled is the exception.

## The figures

**Each compression, revision, and check of a compressed text is recorded in its source, in a `## Compression` section below the Compressed section.** One line records each event, and a later event adds a line. The earlier lines stay as written, so the section is the rule's history of compression.

**A line gives the date, the event, and its figures:**

- **compressed** — the size rank, the clarity score, and the solubility before and after, the change, the compression, and the directive counts: how many directives, and how many of them kept, less precise, and lost
- **revised** — the size rank, the clarity score, and the solubility before and after, and the directive counts of the check that followed
- **re-checked** — the directive counts, and the number of repairs

Restorations, where a compression put back text it had dropped, are named on the line of the event that made them. A figure that was not measured is left out, not estimated.

**The measures:**

- **Size rank** is the rule's rank by characters among the compiled rules, from 0 for the smallest to 1 for the largest. It is recorded with the clarity score and the solubility, so a reader sees whether a change in solubility came from the rule's size or its clarity.
- **Clarity score** is 1 − unclarity. Unclarity is the mean of six ranks among the compiled rules: the average sentence length, the share of sentences over 25 words, and the history words, the asides, the citations, and the negations per sentence.
- **Solubility** is (1 − the mean of the size rank and the unclarity) × 100, as a whole number. Higher is easier to process.
- **Change** is the share of the body's words removed, added, or replaced, from a word-level comparison of the body and the compressed text.
- **Compression** is the share of the body's characters the compressed text removes.

Each rule is ranked among the compiled rules as they stood at one fixed point in time, commit `770c7eb`, so that a figure written later compares with one written earlier. The rule-reduction experiment's record, `2026-10-22T04-51-25Z-rule-reduction`, sets out each measure.

**The figures are written by the process that compresses, revises, or checks the text, in the same commit.**

**The package's rules file carries no figures.** They stay in the source, as a `## History` section does.

**Why:** a compressed text is read in place of its source, so a directive it loses is lost to every session that reads it. The check is what shows that it carries what the source carries. Recording the figures in the source keeps the facts about a compressed text where the text is. A reader of the rule sees how it was compressed, how it changed, and when it was last checked, without the experiment record that produced it.

**How to apply:** write a compressed text in the source's `## Compressed` section, as numbered lists. Have a fresh lister and a fresh checker check it against the body, repair each loss with the smallest clause, and check a repaired rule again. Add a line to the source's `## Compression` section for each compression, revision, and check, in the same commit as the change it records.

## Compressed

1. A source rule may carry a compressed text: the rule restated with the same effect and outcome, in fewer words.
2. Write it in a `## Compressed` section below the body. It shares the source's title and `Related:` list.
3. The body stays the authority. Never edit the compressed text apart from it.

## The compressed text

1. Write the compressed text as numbered lists. Each point is one or two short sentences, carrying one directive.
2. Headings within the section group the points, and each group's list numbers from 1.
3. Carry no reasons. They stay in the body. Where a reason constrains what is done, state that constraint as a directive.
4. Keep a fenced example the directives depend on.
5. A change to the body reaches the compressed text in the same commit.
6. A point keeps its number where it can, so a check's verdicts and a reader's references still find it.
7. `./compile.sh` writes each package's `rules-pre-loaded.md`, at the package root, holding every rule in its `source/`: each rule's title, a `Source:` line with its source path, and its compressed text, or its body where it has none.
8. The rules file carries no `## Compressed` heading, no figures, no `## History` section, no `Related:` list, and no provenance footer.

## The check

1. A compressed text stands only after it is checked against its source. The check has two parts, each done by its own fresh agent that has not seen the compression.
2. A lister lists the source's directives from its body, without the Compressed section, the Compression section, and the footer.
3. A checker judges each directive against the title, the compressed text, and the `Related:` list, as kept, less precise, or lost.
4. Repair a lost directive, and a materially less precise one, with the smallest clause that closes the gap. Check the repaired rule again in full.
5. Where two checkers disagree on a directive, the source decides.
6. Record a less precise directive left as it is, and why.
7. Check a compressed text again after any change to it, except a swap of one term for another the engineer settled.

## The figures

1. Record each compression, revision, and check of a compressed text in its source, in a `## Compression` section below the Compressed section.
2. One line records each event. A later event adds a line, and the earlier lines stay as written.
3. A line gives the date, the event, and its figures.
4. A **compressed** line gives the size rank, the clarity score, and the solubility before and after, the change, the compression, and the directive counts: how many, and how many kept, less precise, and lost.
5. A **revised** line gives the size rank, the clarity score, and the solubility before and after, and the directive counts of the check that followed.
6. A **re-checked** line gives the directive counts and the number of repairs.
7. Name restorations, where a compression put back text it had dropped, on the line of the event that made them.
8. Leave out a figure that was not measured. Do not estimate it.
9. Size rank is the rule's rank by characters among the compiled rules, from 0 for the smallest to 1 for the largest.
10. Clarity score is 1 − unclarity. Unclarity is the mean of six ranks among the compiled rules: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
11. Solubility is (1 − the mean of the size rank and the unclarity) × 100, as a whole number. Higher is easier to process.
12. Change is the share of the body's words removed, added, or replaced, from a word-level comparison of the body and the compressed text.
13. Compression is the share of the body's characters the compressed text removes.
14. Rank each rule among the compiled rules as they stood at one fixed point in time, commit `770c7eb`, so figures measured at different times compare. The rule-reduction experiment's record, `2026-10-22T04-51-25Z-rule-reduction`, sets out each measure.
15. The process that compresses, revises, or checks the text writes the figures, in the same commit.
16. The package's rules file carries no figures. They stay in the source.

## Compression

- 2026-10-27, compressed: compression 0.18, change 0.31, solubility 34 → 56, clarity 0.49 → 0.86, 41 directives, 41 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-27, revised: the compiled rule carries the latest value of each measure, solubility 34 → 53, clarity 0.50 → 0.84; checked: 45 directives, 44 kept, 1 less precise, 0 lost, 1 repair, re-checked kept; directive 41 left as the source words it
- 2026-10-28, revised: Why points removed, solubility 53 → 55, clarity 0.84 → 0.84; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the compiled rules are one file per package and the read runs the loader, solubility 55 → 56, clarity 0.84 → 0.84; checked: 44 directives, 42 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-29, revised: the size rank is recorded as a figure of its own, size rank 0.85 → 0.75, solubility 32 → 55, clarity 0.49 → 0.84; checked: 48 directives, 47 kept, 1 less precise, 0 lost; the less precise directive, that the size rank sits beside the solubility, is left, since the lists name the two side by side
- 2026-10-29, revised: the figures are listed in the order size rank, clarity score, solubility, change, compression, at the engineer's direction; checked: 52 directives, 50 kept, 0 less precise, 2 lost; the full text's sentence placing the size rank beside the solubility is corrected to place it with the clarity score and the solubility, and the other, the trigger line, is a loading cue and not a directive
- 2026-10-29, revised: the ranks' fixed reference is worded as one fixed point in time, at the engineer's direction; one sentence reworded in the full text and its one point in the compressed text, with the same meaning; checked: 52 directives, 50 kept, 1 less precise, 1 lost; the less precise directive, that the size rank is recorded with the clarity score and the solubility, is left, since the lists name the three together, and the lost one, the trigger line, is a loading cue and not a directive

## History

Until Tue Oct 27 2026 the compiler left the whole Compression section out of the compiled rule. The engineer settled that the compiled rule carries the latest value of each measure, and that the earlier events are history.

Until Wed Oct 28 2026 the compressed text carried each reason as a point leading with `**Why:**`. A session comparison found that the reasons changed no agent's behavior, and the engineer settled that the compressed text leaves them out.

Until Thu Oct 29 2026 the compiler wrote a file per rule, in a default form and a `--compressed` form, each carrying the latest value of each measure. Phase 2 of the rule-reduction experiment replaced them with one rules file per package, which carries no figures.

Until Thu Oct 29 2026 the size rank was not recorded on its own. It stood only inside the solubility, and could be worked out from the solubility and the clarity score. The engineer settled that it is recorded as a figure of its own.

Until Thu Oct 29 2026 the figures were listed as compression, change, size rank, solubility, and clarity score. The engineer settled the order size rank, clarity score, solubility, change, compression.

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — a package's `source/` and its rules file
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the rule-reduction experiment, which brings this rule to master when it merges

---

Authored by Scott Bellware on Tue Oct 27 2026 at 2:31:40 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:40:00 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:19:10 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:24:12 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:31:12 PM PT
