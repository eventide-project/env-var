# A printed list of records is formatted as a table or as a list of rows

**Trigger:** When the engineer asks for a list of records, as with `/item list`, `/list`, `/items`, `/current`, `/features`, `/experiments`, or `/notes`

**When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence.** A table presents the fields in headed columns. Rows present one record to a line, its fields in sequence, with no columns. **A list is called a table only where it is formatted as columns.** That reaches any record — items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.

**The first column is the record's handle and carries no heading.** That is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit. The columns after it are headed.

**A list of items opens with an ordinal**, a number from 1 in the order the rows are printed, ahead of the handle. The engineer refers to a row by that number.

**Two SHA columns follow the handle: the commit that created the record, and the last to touch it.** They are standing columns rather than chosen ones, in every list but a list of items, a list of commits, and the lists `/features` and `/experiments` print.

```
|                        | created   | changed   | implementation                   | state     |
|------------------------|-----------|-----------|----------------------------------|-----------|
| `2026-08-25T00-36-18Z` | `159985b` | `ed7ec4a` | Feature — Self-Explanation       | Abandoned |
| `2026-10-21T05-44-56Z` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal and no SHA columns:

```
| # |                        | item                        | state  |
|---|------------------------|-----------------------------|--------|
| 1 | `2026-08-10T20-54-51Z` | A Generalized Description   | Active |
| 2 | `2026-08-23T06-58-41Z` | Slasher for content and web | Open   |
```

**A record never amended shows the same SHA twice, and that is the point.** The pair says whether a record has been touched since it was written. One that has not, and whose subject has moved since, is the stale case a reader is looking for.

**The last column is chosen for the question.** A list of items or implementations takes the state. A list of commits asked about for their subject widths takes the width. A column nobody asked for is padding.

**A list of commits takes no SHA columns**, because the handle is already the SHA and a commit has no creation distinct from itself. **A list of items takes none either**, at the engineer's direction. Its rows are referred to by their ordinal.

## Listing items by state

**A list of items may be asked for by state, and lists the items whose `**State:**` line reads that state.** `current` is not a state: it asks for the Open, Active, and Implementation items together, the items whose work has not concluded and is not paused.

**As the engineer stated it:** remove suspended from current.

## The items command

**`/items` lists every item, whatever its state, oldest first.** Each row is an ordinal, the item's handle, its title, and its state. The list takes no SHA columns and no kind column, as other lists of items do.

**A hidden record is counted rather than listed**, under the a-status-report-prints-a-fixed-whole-project-report rule. A Suspended item is left out of the rows, and a line below the table gives the count and the kind, as `1 suspended item`.

**`/items current` lists the current items**, the Open, Active, and Implementation ones, as `/item list current` does.

**As the engineer stated it:** The "/items" command should print all items. The "/items current" command should do what "/items" does presently.

## The current command

**`/current` lists the current items, then the current implementations.** The items are the Open and Active ones. An Implementation item is left out, since the implementations below show the work it is under. The implementations are the features and experiments whose `**State:**` line reads Open, Active, or Suspended: the ones that have not concluded, whether they are not yet started, under way, or paused.

**As the engineer stated it:** When current items and implementations are printed together, as is the case with some commands, items in the Implementation state should not be printed. When current items are printed on their own, items in the Implementation state should be printed.

**The items table printed by `/current` takes a kind column, between the title and the state.** It names the kind each of the item's tags gives, written as a word, not as a tag: *Idea* for `[idea]`, *Work* for `[work]`, and *Legal matter* for `[legal-matter]`. Where the item carries several tags, it names each, separated by commas. Other lists of items take no kind column unless it is asked for.

**As the engineer stated it:** Include the item kind in the table printed by "/current"

**`/current` takes an optional number, *n*, and then lists only the *n* most recent current items.** An item's recency is its handle, the time it was created. The items listed keep the order of the full list, oldest first, and their ordinals count from 1. The number does not reach the current implementations, which are listed in full. `/current 5` lists the five most recently created current items.

**As the engineer stated it:** The "/current" command should optionally take a number that is the **n-most** recent items

**As the engineer stated it:** Don't print the kind as its tag. eg: for "[idea]", print in the table, "Idea"

**Below the items table, `/current` counts the items it leaves out, by state.** The counts sit under the heading *Other items*, as one comma-separated sentence, as in `47 Realized, 18 Recorded, 12 Abandoned`. Each state other than Open and Active that some item holds is named once, with its count, Implementation included. The states run from the largest count to the smallest. A Suspended item is counted here like any other, which is the treatment a hidden record already takes. A number given to `/current` does not change the counts, since they count the items whose state is not current, not the current items the number leaves out.

**As the engineer stated it:** At the bottom of the table that prints by "/items", print a summary of how many other of the other iten types there are

**As the engineer stated it:** Print these in a comma-separated sentence

**As the engineer stated it:** Above this line, put the heading: Other items

**Each current implementation is one row: its handle, its title, and its state.** Its title is the record's own, as in `Feature — The current command`. It takes no ordinal and no SHA columns, since the list is a summary below the items, not a list of its own.

**Where no implementation is current, the summary is one line: *No current feature or experiment.*** It is printed under the summary's heading, in place of the rows.

**As the engineer stated it:** No current feature or experiment.

**As the engineer stated it:** Change current-items to current, and include a summary of current implementations at the bottom.

## The features and experiments commands

**`/features` lists the current features, and `/experiments` lists the current experiments.** A current feature or experiment is one whose `**State:**` line reads Open, Active, or Suspended, as with the current implementations `/items` lists. A record's kind is the word its title opens with, as in `Feature — The current command` or `Experiment — Rules files flattening`.

**Each row is an ordinal, the record's handle, its title, and its state.** The list takes the ordinal and no SHA columns, as a list of items does, since each command does for its kind what `/current` does for items. The title is the record's own.

**Each command takes an optional number, *n*, and then lists only the *n* most recently created current records of its kind.** A record's recency is its handle. The records listed keep the order of the full list, oldest first, and their ordinals count from 1. `/features 3` lists the three most recently created current features.

**Each command takes `current` too, as `/items` does, and it changes nothing.** `/features current` lists what `/features` lists, and `/features current 3` what `/features 3` lists.

**Where none of its kind is current, the list is one line:** *No current feature.* for `/features`, and *No current experiment.* for `/experiments`.

**Below the list, each command counts the records of its kind it leaves out, by state.** The counts sit under the heading *Other features* or *Other experiments*, as one comma-separated sentence, as in `34 Completed, 1 Abandoned`. Each state other than Open, Active, and Suspended that some record of the kind holds is named once, with its count. The states run from the largest count to the smallest. A number given to the command does not change the counts.

**As the engineer stated it:** Create a "/features" command and an "/experiments" command that does for them what the "/items" command does

## The notes command

**`/notes` lists every item tagged `[note]`, oldest first.** A note is Recorded when it is written and never changes state, so every note is listed, and no state is current or left out.

**Each row is an ordinal, the note's handle, and its title.** The list takes no SHA columns, as a list of items does, and no state column, since every row would read Recorded.

**`/notes` takes an optional number, *n*, and then lists only the *n* most recently created notes.** A note's recency is its handle. The notes listed keep the order of the full list, oldest first, and their ordinals count from 1. `/notes 3` lists the three most recently created notes.

**Where no note exists, the list is one line:** *No note.*

**As the engineer stated it:** A "/notes" command that lists the items tagged [note]

## Keep every column short

**A field that is a sentence does not belong in a table.** Column widths are fixed against the widest cell, so one long field narrows every other column and wraps every row. What was a scannable grid becomes prose in boxes.

**Where the engineer asks for a table, render one, in rows and columns, whatever the length of its fields.** The request settles the form.

**Where a record's summary is wanted, the answer is rows rather than a table.** That is not a failure of this rule. Rows are the form where a field runs to a sentence, and the two forms answer to the length of what is in them.

## What this does not reach

**The status report's tables are already tables**, and the a-status-report-prints-a-fixed-whole-project-report rule says so. The two rules agree.

**An answer that is not a list of records.** The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs how a **set of records** is presented, and the two do not overlap: a table is a list, rendered for a reader who is looking for one row.

**Why:** a record list is scanned rather than read. The reader has a record in mind and is looking for its row, or is comparing one field across rows. A table puts the same field in the same place on every row, so the eye goes down a column instead of parsing each line to find where the field sits.

Rows are the better form where a field is long, and that is the whole of the exception. The two forms are not in competition — they answer to the length of what is in them.

**How to apply:** on a request for a list of records, render a table where every field is short, and rows where a field runs to a sentence. Do not call a list a table unless it is formatted as columns. Where the engineer asks for a table, render one in rows and columns. In a table, put the handle first with no heading, then the creating commit and the last commit to touch it, then the title, then one column for the fact that was asked about. Give a list of commits no SHA columns. Give a list of items an ordinal ahead of the handle, and no SHA columns.

Keep every column short. Where a field runs to a sentence, use rows instead.

## Compressed

1. When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence. A table presents the fields in headed columns. Rows present one record to a line, with its fields in sequence and no columns. A list is called a table only where it is formatted as columns.
2. This applies to any record type. That includes items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.
3. The first column is the record's handle and has no heading.
4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
5. Every column after the handle has a heading.
6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it. A list of items takes no SHA columns, and opens with an ordinal ahead of the handle, which the engineer refers to a row by. The ordinal counts from 1, in the order the rows are printed.
7. These two SHA columns are always present, in every list but a list of items, a list of commits, or the lists `/features` and `/experiments` print. They are not chosen per request.
8. After the SHA columns comes the title. Then comes one column for the fact asked about.

```
|                        | created   | changed   | implementation                   | state     |
|------------------------|-----------|-----------|----------------------------------|-----------|
| `2026-08-25T00-36-18Z` | `159985b` | `ed7ec4a` | Feature — Self-Explanation       | Abandoned |
| `2026-10-21T05-44-56Z` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal and no SHA columns:

```
| # |                        | item                        | state  |
|---|------------------------|-----------------------------|--------|
| 1 | `2026-08-10T20-54-51Z` | A Generalized Description   | Active |
| 2 | `2026-08-23T06-58-41Z` | Slasher for content and web | Open   |
```

9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
10. Choose the last column to fit the question.
11. A list of items or implementations takes the state as its last column.
12. A list of commits asked about for their subject widths takes the width.
13. Do not add a column nobody asked for.
14. A list of commits takes no SHA columns.

## Listing items by state

1. A list of items may be asked for by state, and lists the items whose `**State:**` line reads that state.
2. `current` asks for the Open, Active, and Implementation items together. It is not a state, and it leaves out Suspended items.

## The items command

1. `/items` lists every item, whatever its state, oldest first.
2. Present each item as one row: an ordinal, its handle, its title, and its state. Give it no SHA columns and no kind column.
3. A Suspended item is a hidden record, counted rather than listed, under the a-status-report-prints-a-fixed-whole-project-report rule. Leave it out of the rows. Below the table, print a line giving their count and kind, as `1 suspended item`.
4. `/items current` lists the Open, Active, and Implementation items, as `/item list current` does.

## The current command

1. `/current` lists the Open and Active items, then, under a heading of their own, the current implementations. It leaves out Implementation items, whose work the implementations show. `/items current` still lists them.
2. The current implementations are the features and experiments whose `**State:**` line reads Open, Active, or Suspended.
3. Present each current implementation as one row: its handle, its title, and its state. The title is the record's own, as in `Feature — The current command`. Give it no ordinal and no SHA columns.
4. Where no implementation is current, print the one line *No current feature or experiment.* under the summary's heading, in place of the rows.
5. In the items table `/current` prints, put a kind column between the title and the state. It names the kind each tag gives as a word, not a tag: *Idea* for `[idea]`, *Legal matter* for `[legal-matter]`. Several tags are named each, separated by commas. Other lists of items take no kind column unless it is asked for.
6. `/current` takes an optional number *n*, as in `/current 5`. It then lists only the *n* most recently created Open and Active items, by handle, oldest first, with ordinals from 1. It lists the current implementations in full.
7. Below the items table, under the heading *Other items*, print the count of each state other than Open and Active that some item holds, as one comma-separated sentence: `47 Realized, 18 Recorded, 12 Abandoned`. Order the states from the largest count to the smallest. Count Implementation and Suspended items here too.
8. A number given to `/current` does not change these counts.

## The features and experiments commands

1. `/features` lists the current features, and `/experiments` lists the current experiments: those whose `**State:**` line reads Open, Active, or Suspended.
2. A record's kind is the word its title opens with, as in `Feature — The current command`.
3. Present each record as one row: an ordinal, its handle, its title, and its state. Give it no SHA columns.
4. Each command takes an optional number *n*, as in `/features 3`. It then lists only the *n* most recently created current records of its kind, by handle, oldest first, with ordinals from 1.
5. Each command takes `current` too, as `/items` does. `/features current` does what `/features` does, and `/features current 3` what `/features 3` does.
6. Where none of its kind is current, print the one line *No current feature.* or *No current experiment.* in place of the rows.
7. Below the list, under the heading *Other features* or *Other experiments*, print the count of each state other than Open, Active, and Suspended that some record of the kind holds, as one comma-separated sentence: `34 Completed, 1 Abandoned`. Order the states from the largest count to the smallest.
8. A number given to the command does not change these counts.

## The notes command

1. `/notes` lists every item tagged `[note]`, oldest first.
2. Present each note as one row: an ordinal, its handle, and its title. Give it no SHA columns and no state column.
3. `/notes` takes an optional number *n*, as in `/notes 3`. It then lists only the *n* most recently created notes, by handle, oldest first, with ordinals from 1.
4. Where no note exists, print the one line *No note.* in place of the rows.

## Keep every column short

1. Keep every column short.
2. Do not put a field that runs to a sentence in a table. Present rows instead, unless the engineer asks for a table, which is then rendered in rows and columns.
3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

## What this does not reach

1. This rule does not reach the status report's tables. They stay tables, under the a-status-report-prints-a-fixed-whole-project-report rule.
2. This rule does not govern an answer that is not a list of records.
3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.

## Compression

- 2026-10-24, compressed: compression 0.26, change 0.56, solubility 37 → 69, clarity 0.33 → 0.75, 14 directives, 14 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, re-checked: 24 directives, 21 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-27, revised: the example tables show the full prefix as the handle; checked: 24 directives, 24 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 69 → 56, clarity 0.75 → 0.75; checked: 23 directives, 23 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 25 directives, 25 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-02, revised: a list of items is asked for by state, and current is Open and Active; checked: 29 directives, 29 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the current command lists the current items, then the current implementations; checked: 38 directives, 38 kept, 0 less precise, 0 lost
- 2026-11-06, revised: where no implementation is current, the summary says *No current feature or experiment.*, and the items table of `/current` takes a kind column, written as a word rather than a tag; checked: 41 directives, 38 kept, 3 less precise, 0 lost, 2 repairs; re-checked: 41 directives, 40 kept, 1 less precise, 0 lost, 1 repair; re-checked after the kind is written as a word: 43 directives, 43 kept, 0 less precise, 0 lost
- 2026-11-06, revised: `/current` takes an optional number of the most recent current items to list; checked: 41 directives, 35 kept, 6 less precise, 0 lost, 1 repair; re-checked: 41 directives, 39 kept, 2 less precise, 0 lost. Left less precise: the trigger's example commands `/item list` and `/list`, which the trigger line carries, and the example *Work* for `[work]`
- 2026-11-06, revised: the command is `/report`, in place of `/current`, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: the command is `/items`, in place of `/report`, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: `/items` counts the items it leaves out, by state, below the items table, as points 7 and 8 of the items command; checked: 41 directives, 39 kept, 2 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before, and the heading the no-implementation line sits under, which point 1 of the items command ties to the implementations
- 2026-11-07, revised: `/items` prints its state counts as one comma-separated sentence, in point 7 of the items command; checked: 31 directives, 30 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before
- 2026-11-07, revised: `/items` prints its state counts under the heading *Other items*, in point 7 of the items command; checked: 36 directives, 35 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the heading the no-implementation line sits under, as before
- 2026-11-09, revised: `/features` and `/experiments` list the current records of their kind, with an optional number and counts of the other states, as the features and experiments commands; checked: 48 directives, 47 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before
- 2026-11-09, revised: a current implementation is Open, Active, or Suspended; not re-checked
- 2026-11-09, checked: 61 directives, 60 kept, 1 less precise, 0 lost. Left less precise: the kind column's example for [work], which the general instruction produces
- 2026-11-10, revised: the command is `/current`, in place of `/items`, a term swap the engineer settled; not re-checked
- 2026-11-11, revised: `/features` and `/experiments` take `current`, at the engineer's direction; not re-checked
- 2026-11-13, revised: `/notes` lists every item tagged `[note]`, with an optional number, as the notes command; the notes command checked: 12 directives, 12 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-13, revised: `/items` lists every item, and `/items current` the current ones, as the items command; the items command checked: 12 directives, 10 kept, 2 less precise, 0 lost, 1 repair. Left less precise: that `/items current` does what a bare `/items` did before, which point 4 carries by naming `/item list current`, the same list
- 2026-11-13, revised: `/current` leaves out Implementation items and counts them under Other items, as the current command; the current command checked: 24 directives, 19 kept, 2 less precise, 3 lost, 1 repair, not re-checked. Left less precise: the example *Work* for `[work]`, and the summary's heading, as before. Left lost: that `/current` replaced `/current-items`, an engineer's statement of a rename, not a directive of the command now
- 2026-11-13, revised: current is Open, Active, and Implementation; not re-checked

## History

Until Fri Nov 13 2026 `/current` listed Implementation items beside the implementations that work them.

Until Fri Nov 13 2026 `current` asked for the Open and Active items, and left out an item in Implementation, whose implementation was listed in its place.

Until Fri Nov 13 2026 a bare `/items` listed the current items, which `/items current` now lists, and no command listed every item.

Until Fri Nov 13 2026 there was no `/notes` command, and this rule named no list of notes.

Until Wed Nov 11 2026 `/features` and `/experiments` took no `current`, which `/items` took.

Until Tue Nov 10 2026 the command that lists the current items and implementations was `/items`. The engineer gave that list to `/current`, and made a bare `/items` list the current items alone.

Until Mon Nov 9 2026 a current implementation was Active or Suspended, since an implementation took no Open state.

Until Sat Nov 7 2026 `/items` printed its state counts with no heading. The engineer settled that they sit under the heading *Other items*.

Until Sat Nov 7 2026 `/items` printed its state counts one to a line, as in `45 Realized`. The engineer settled that they print as one comma-separated sentence.

Until Sat Nov 7 2026 `/items` printed nothing about the items whose state is not current.

Until Sat Nov 7 2026 the command that lists the current items and implementations was `/report`. The engineer renamed it `/items`, and dropped the old name.

Until Fri Nov 6 2026 the command that lists the current items and implementations was `/current`. The engineer renamed it `/report`, and dropped the old name.

Until Fri Nov 6 2026 the current items were listed by `/current-items`, and no command listed the current implementations.

Until Fri Nov 6 2026 `/current` took no number, and always listed every current item.

Until Thu Nov 5 2026 its trigger read *When the engineer asks for a list of records*, which was not a safe one.

Until Mon Nov 2 2026 this rule did not say how a list of items is asked for by state, or what `current` asks for.

Until Sun Oct 25 2026 this rule was named a-record-list-is-a-table and titled "A list of records presented on request is a table".

Until 2026-10-25 the rule opened by saying to render a list of records as a table, and gave rows, the form for a field that runs to a sentence, only in a later section. The engineer settled that the opening and How to apply say which form a printed list takes, and when.

The engineer also settled the same day that a list is not called a table unless it is formatted as columns.

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 a list of items took the two SHA columns and no ordinal, and a field that runs to a sentence sent a list to rows even where the engineer asked for a table. The engineer settled that a list of items takes an ordinal and no SHA columns, and that a table asked for is rendered in rows and columns.

Until Tue Oct 27 2026 the example tables showed the handle as the date alone, such as `2026-08-25`, while the text named the full ISO-8601-UTC prefix. An agent copied the example. The engineer settled that the handle is the full prefix, such as `2026-08-25T00-36-18Z`.

Related:

- the a-status-report-prints-a-fixed-whole-project-report rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-commits-sha-refers-to-the-work-the-commit-carries rule — what a SHA in those columns refers to when the engineer names one back
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, which this does not displace

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:22:25 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:07:00 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:16:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:26 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:12:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:12:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:14:47 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:47:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 8:54:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:46:43 PM PT
Changed by Scott Bellware on Mon Nov 2 2026 at 6:58:44 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:17:13 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:33:13 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:31:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:08:55 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:04:28 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:30:58 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:19:47 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:55:17 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 10:53:56 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:04:16 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:13:39 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:50:34 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 2:56:24 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:39:16 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:23:43 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:59:30 PM PT
