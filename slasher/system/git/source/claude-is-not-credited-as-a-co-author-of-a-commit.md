# Claude is not credited as a co-author of a commit

**Trigger:** When creating a commit

Do not add a `Co-Authored-By: Claude …` trailer (or any other "co-authored by Claude/Anthropic" attribution) to any commit you create. The commit should appear as authored by the user only.

**Why:** User preference — they don't want AI co-authorship attribution in their commit history.

**How to apply:** When writing commit messages, omit the `Co-Authored-By: Claude …` trailer that Claude Code adds by default. Applies to every project.

## Compressed

1. Do not add a `Co-Authored-By: Claude …` trailer to any commit you create.
2. Do not add any other "co-authored by Claude/Anthropic" attribution either.
3. The commit is authored by the user only.
4. Omit the trailer even though Claude Code adds it by default.
5. This applies to every project.

## Compression

- 2026-10-22, compressed: compression 0.07, change 0.60, solubility 82 → 86, clarity 0.64 → 0.73, 3 directives, 2 kept, 1 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 86 → 95, clarity 0.73 → 0.91; checked: 4 directives, 4 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named no-claude-coauthor and titled "No Claude co-author trailer in commits".

Until Mon Oct 26 2026 this rule was named a-commit-carries-no-claude-co-author-trailer and titled "A commit carries no Claude co-author trailer".

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:19:33 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:27:23 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:03 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:14:43 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
