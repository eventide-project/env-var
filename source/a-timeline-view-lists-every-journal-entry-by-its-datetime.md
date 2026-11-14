# A timeline view lists every journal entry by its datetime

**Trigger:** When the writer asks for the journal timeline or a list of journal entries, as with `/journal list`

Where the writer asks for the timeline — *show the timeline*, *list the entries* — list every journal entry in the active writer's journal directory, `slasher/local/journal/<username>/`. Those are the `20*.md` files there, and `<username>` is resolved by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule. List them in chronological order, oldest first.

Format each as a single bullet, `- **<datetime>** — <title>`. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is. The `<title>` is the entry's `# ` heading with the leading `# ` removed. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*. Output the list alone, with no preamble.

**A list may be asked for within a timespan, as with `/journal list <timespan>`, and then holds only the entries whose datetime falls within it.** A timespan is a date, a range of dates, or a phrase the writer would say, such as *last week* or *since October*, read in the writer's local time. Both ends of a range are included. The count and date span at the end describe the entries listed.

**As the engineer stated it:** “/journal timeline” should be “/journal list”. It should take an optional timespan.

**The view is computed every time it is asked for, and it is stored nowhere.** Not the bullets, not the count, and not the date span. There is no `TIMELINE.md` and none is written.

**It is a projection**, in the sense the foundation package's vocabulary gives that term. It reads the entries without destroying them, and it is regenerated rather than maintained. That term already settles what happens to a derived artifact somebody keeps: it goes stale the moment it is not updated.

**A stored index would need two directives to maintain it.** One would insert a row in order when an entry is written. The other would rebuild the file from scratch, because the first cannot see a rename, an edited title, or a deletion. A view that needs a repair directive is a view that drifts, and the entries are what a reader would then have to check it against.

**The entry files are the record, and reading them is cheap.** A journal directory is one small markdown file per entry. Nothing about listing them wants a cache.

**Why:** the timeline says nothing the entries do not. It is an ordering and a rendering of material that is already on disk, so a second copy of it buys a reader nothing and can only disagree with the first. Computing it on request means it is correct by construction, and it cannot be stale.

**How to apply:** resolve the active `<username>` by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule. Read the `20*.md` files in `slasher/local/journal/<username>/`, sort them by their datetime line, emit the bullets, and append the computed count and date span. Write nothing to a file.

## Compressed

1. When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory.
2. The directory is `slasher/local/journal/<username>/`.
3. Resolve `<username>` by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule.
4. The entries are the `20*.md` files in that directory.
5. Sort the entries by their datetime line, oldest first.
6. Format each entry as a single bullet: `- **<datetime>** — <title>`.
7. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is.
8. The `<title>` is the entry's `# ` heading with the leading `# ` removed.
9. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*.
10. Output the list alone, with no preamble.
11. Compute the view each time it is asked for.
12. Store none of it: not the bullets, not the count, and not the date span.
13. There is no `TIMELINE.md`, and none is written.
14. Write nothing to a file.
15. The view is a projection, in the sense of the foundation package's vocabulary.
16. The list is asked for with `/journal list`. A list may be asked for within a timespan, as with `/journal list <timespan>`: a date, a range of dates, or a phrase such as *last week*, read in the writer's local time, both ends included. List only the entries within it, and give the count and date span for those.

## Compression

- 2026-10-24, compressed: compression 0.44, change 0.64, solubility 52 → 83, clarity 0.39 → 0.78, 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 83 → 80, clarity 0.78 → 0.78; checked: 12 directives, 12 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 15 directives, 15 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-02, revised: the list takes a timespan, and is asked for with /journal list; checked: 21 directives, 20 kept, 1 less precise, 0 lost, 1 repair; re-checked: 21 directives, 20 kept, 1 less precise, 0 lost. Left less precise: /journal timeline not ruled out, which the command-protocol rule covers by asking

## History

Until Mon Nov 2 2026 the view listed every entry, with no timespan.

Until Sun Oct 25 2026 this rule was named timeline-view and titled "Timeline view: on request, list every journal entry chronologically, each row led by its datetime".

Until 2026-08-14 a stored index of the journal was kept, maintained by two directives: one inserted a row as an entry was written, and one rebuilt the file.

Related:

- the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule — how `<username>` is resolved
- the a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule — the line each bullet is led by
- the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the entries this reads, and the *new entry* directive that writes one
- the foundation package's vocabulary — the projection term

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 10:16:13 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:56 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:21:02 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:38 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:01:39 PM PT
Changed by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
