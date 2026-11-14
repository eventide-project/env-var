# A paragraph is one line, and the reader's editor wraps it

**A paragraph is written as a single line.** No newline is inserted to hold a column width. The reader's editor soft-wraps it to whatever width they have chosen, which is the width they can actually read at.

**As the engineer stated it:** there are not supposed to be newline characters. The reader's editor should be allowed to soft-wrap per the user's preference.

## What still stands on its own line

**A structural element is not prose and keeps its own line.** A heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.

**A list item is one line**, however long. A continuation is folded into the list item rather than left hanging under it.

**The provenance footer's lines are each their own line.** `Authored by …` and every `Changed by …` beneath it. They are a running history rather than a paragraph, and joining them would read as one sentence and lose the record.

## Why the hard wrap is worth removing

**A hard wrap fixes a width the writer chose for a reader they cannot see.** A column of 100 characters is unreadable on a narrow pane and wasteful on a wide one. The reader's editor knows their window and their font, and the writer does not.

**It puts the writer's newlines in the diff.** Editing a sentence in the middle of a hard-wrapped paragraph reflows every line after it, so a one-word change shows as a paragraph rewritten. A single-line paragraph changes one line when one line changes.

**It is invisible to the reader and expensive to the writer.** Rendered markdown collapses a wrapped paragraph into the same output either way, so the wrapping buys the reader nothing at all. What it costs is every writer re-wrapping after every edit, and every reviewer reading reflow as change.

**Why:** the width a reader wants is theirs to set, and a hard wrap takes that decision away from them and gives it to whoever typed the paragraph. Nothing is gained in exchange — the rendering is identical, and the diff is worse.

**How to apply:** write each paragraph as one line. Insert no newline to hold a column width, and re-wrap nothing after an edit.

Keep a heading, a list item, a table row, a blockquote line, a horizontal rule, and the contents of a fenced code block on their own lines. Fold a list item's continuation into the item. Leave each line of the provenance footer alone.

## Compressed

1. Write each paragraph as a single line. This holds for vocabulary entries too.
2. Insert no newline to hold a column width.
3. Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen.
4. Re-wrap nothing after an edit.

## What still stands on its own line

1. A structural element is not prose and keeps its own line.
2. Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.
3. A list item is one line, however long.
4. Fold a list item's continuation into the item rather than leaving it hanging under it.
5. Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it.
6. Do not join the footer lines. They are a running history, and joining them would lose the record.

## Compression

- 2026-10-24, compressed: compression 0.55, change 0.75, solubility 63 → 92, clarity 0.59 → 0.93, 9 directives, 9 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 92 → 94, clarity 0.93 → 0.97; checked: 12 directives, 12 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named prose-is-not-hard-wrapped and titled "A prose line is not hard-wrapped — a paragraph is one line, and the reader's editor wraps it".

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the rule format this governs the lines of
- the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule — the vocabularies, whose entries are prose the same way
- the record-a-rules-authorship-in-a-provenance-footer rule — the footer whose lines are exempt

---

Authored by Scott Bellware on Tue Aug 25 2026 at 9:37:58 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:59 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:50 PM PT
