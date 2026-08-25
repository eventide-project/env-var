# A prose line is not hard-wrapped — a paragraph is one line, and the reader's editor wraps it

**A paragraph is written as a single line.** No newline is inserted to hold a column width. The reader's editor soft-wraps it to whatever width they have chosen, which is the width they can actually read at.

**As the engineer stated it:** there are not supposed to be newline characters. The reader's editor should be allowed to soft-wrap per the user's preference.

## What still stands on its own line

**A structural element is not prose and keeps its own line.** A heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.

**A list item is one line**, however long. A continuation is folded into the item rather than left hanging under it.

**The provenance footer's lines are each their own line.** `Authored by …` and every `Changed by …` beneath it. They are a running history rather than a paragraph, and joining them would read as one sentence and lose the record.

## Why the hard wrap is worth removing

**A hard wrap fixes a width the writer chose for a reader they cannot see.** A column of 100 characters is unreadable on a narrow pane and wasteful on a wide one. The reader's editor knows their window and their font, and the writer does not.

**It puts the writer's newlines in the diff.** Editing a sentence in the middle of a hard-wrapped paragraph reflows every line after it, so a one-word change shows as a paragraph rewritten. A single-line paragraph changes one line when one line changes.

**It is invisible to the reader and expensive to the writer.** Rendered markdown collapses a wrapped paragraph into the same output either way, so the wrapping buys the reader nothing at all. What it costs is every writer re-wrapping after every edit, and every reviewer reading reflow as change.

**Why:** the width a reader wants is theirs to set, and a hard wrap takes that decision away from them and gives it to whoever typed the paragraph. Nothing is gained in exchange — the rendering is identical, and the diff is worse.

**How to apply:** write each paragraph as one line. Insert no newline to hold a column width, and re-wrap nothing after an edit.

Keep a heading, a list item, a table row, a blockquote line, a horizontal rule, and the contents of a fenced code block on their own lines. Fold a list item's continuation into the item. Leave each line of the provenance footer alone.

Related:

- the rules-convention — the rule format this governs the lines of
- the vocabulary-convention — the vocabularies, whose entries are prose the same way
- the record-rule-authorship-in-a-footer rule — the footer whose lines are exempt

---

Authored by Scott Bellware on Tue Aug 25 2026 at 9:37:58 AM PT
