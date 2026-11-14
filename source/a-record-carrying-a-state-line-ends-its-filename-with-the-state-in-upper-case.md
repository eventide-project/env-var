# A record carrying a state line ends its filename with the state in upper case

**Trigger:** When creating, renaming, changing the state of, or referencing an item or implementation record

Where a record carries a canonical `**State:**` line, its **filename** ends with that state word in **upper case**, appended to the name with a dash and sitting before the extension.

```
2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
```

**It reaches every record that carries a state line** — an implementation record, whether an experiment or a feature, and an item. Each convention fixes its own words, and this rule fixes only where the word is rendered.

**Every item and every implementation record carries a suffix.** Each carries a state line from the moment it is written, and the in-progress state of each is **Active**. A name with no suffix is a defect, because a missing suffix and an oversight look the same. **A note's suffix is always `-RECORDED`**, since that is its one state.

**The file's contents are unchanged.** The state is the `**State:**` line and nothing else, and the file still ends with its provenance footer. A suffix in the contents would put the same value in two places inside one artifact, for no reader who is asking for it there.

## Upper case, and the exception it takes

**The file-names rule requires a dash-separated, lower-case name.** This suffix is the stated exception, and the case is what earns it: the state is not part of what the record is *about*, and lower case would read as another word of the subject. `…-ooda-terminology-refuted.md` reads as a record about refuted OODA terminology. `…-ooda-terminology-REFUTED.md` reads as a record about OODA terminology, which was refuted.

**The dash is the ordinary separator**, so nothing else about the name changes. The ISO-8601-UTC prefix is untouched and the directory still sorts chronologically.

## The `**State:**` line stays the only authoritative statement

**The name is derived from the line and changes only when it changes.** Where the two disagree the line is right, and the name is stale.

**So a state change renames the file.** A record reaching a new word is renamed with `git mv`, and a state taken back by resume, as the the-items-directory-holds-one-file-per-item rule sets out, renames it to the state the record returns to, such as **ACTIVE** or **OPEN**.

**A reference to a record omits its state suffix, so a state change breaks no reference.** The reference keeps the rest of the filename, the ISO-8601-UTC prefix and the name, as in `2026-10-24T20-42-50Z-a-rules-name-is-soluble`. That part does not change with the state, so a reference written before a state change still names the record after it. A reader finds the file by that prefix and name. The reference is not a path that opens directly, which is the cost of its staying true.

**Why:** a record's state is the thing most often wanted without reading the record, and a directory listing is where it is asked for. `local/implementations/` answers *which of these concluded* at a glance, in a file tree, in a shell, and in any editor's sidebar — none of which opens a file to show a line near its top.

The cost is a filename that mutates over a record's life, which is real and is why the suffix is confined to records that carry a state line at all.

**How to apply:** when a record reaches a state word, write the `**State:**` line and rename the file so its name ends with that word in upper case, after a dash.

When the state changes, rename it again. When a reversible state word is taken back, rename it to the state the record returns to, **ACTIVE** or **OPEN**. Write a reference to such a record without its state suffix or its extension, so no reference needs reconciling at a rename. Leave historical records as written. Add no suffix to any file's contents.

## Compressed

1. Where a record carries a canonical `**State:**` line, its filename ends with that state word in upper case.
2. The state word is appended to the name with a dash, before the extension.

```
2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
```

3. This reaches every record that carries a state line: an implementation record, whether experiment or feature, and an item.
4. Each convention fixes its own state words. This rule fixes only where the word is rendered.
5. Every item and every implementation record carries a suffix. Each carries a state line from the moment it is written, and the in-progress state of each is **Active**.
6. A name with no suffix is a defect.
7. A note's suffix is always `-RECORDED`.
8. The file's contents are unchanged. Add no suffix to any file's contents.
9. The state inside the file is the `**State:**` line and nothing else.
10. The file still ends with its provenance footer.

## Upper case, and the exception it takes

1. The suffix is the stated exception to the file-names rule's dash-separated, lower-case name.
2. The upper case marks the state as not part of the record's subject. `…-ooda-terminology-REFUTED.md`, not `…-ooda-terminology-refuted.md`.
3. The dash is the ordinary separator. Nothing else about the name changes.
4. The ISO-8601-UTC prefix is untouched, so the directory still sorts chronologically.

## The `**State:**` line stays the only authoritative statement

1. The name is derived from the line. It changes only when the line changes.
2. Where name and line disagree, the line is right and the name is stale.
3. A state change renames the file, using `git mv`.
4. When a reversible word is taken back, rename the file to the state the record returns to, such as **ACTIVE** or **OPEN**.
5. Any state but Open, Active, and Recorded can be taken back by resume, as the the-items-directory-holds-one-file-per-item rule sets out.
6. A reference to a record omits its state suffix and extension, and keeps the prefix and name. A rename then breaks no reference.
7. A reader finds the record by that prefix and name.
8. Leave historical records as written.

## Compression

- 2026-10-24, compressed: compression 0.44, change 0.69, solubility 32 → 75, clarity 0.38 → 0.89, 22 directives, 22 kept, 0 less precise, 0 lost
- 2026-10-27, re-checked: 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-10-27, revised: every item and implementation record carries a suffix; checked: 24 directives, 23 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 75 → 71, clarity 0.89 → 0.87; checked: 23 directives, 22 kept, 1 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 24 directives, 23 kept, 0 less precise, 1 lost, 1 repair
- 2026-11-09, revised: the Discontinued state, which the engineer added; not re-checked
- 2026-11-09, revised: any state but Open, Active, and Recorded can be taken back; not re-checked
- 2026-11-09, checked: 28 directives, 26 kept, 2 less precise, 0 lost, 1 repair: the state a record returns to is an example, not a closed list; re-checked: 28 directives, 26 kept, 2 less precise, 0 lost. Left less precise: that a reference is not an openable path, and that a record without a state line takes no suffix, both implied
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Mon Nov 9 2026 the reversible words were Realized, Deferred, Discontinued, Open, and a work item's Done.

Until Mon Nov 9 2026 an item had no Discontinued state, and the reversible words did not include it.

Until Sun Oct 25 2026 this rule was named a-record-ends-with-its-state-in-upper-case and titled "A record carrying a state line ends its filename with that state in upper case".

Until 2026-08-16 the suffix was also appended to the file's contents.

Until Tue Oct 27 2026 live artifacts that cited a record by its full filename were reconciled at each rename. The engineer settled that a reference omits the state suffix and keeps the rest of the filename, so a state change breaks no reference.

Until 2026-10-26 an implementation record took no suffix while its work was under way, since the absence of a state line was its in-progress state. Items had stopped taking an absent state on 2026-08-16, when **Active** was added. The engineer settled that implementations take the Active state too, so every item and every implementation record now carries a suffix.
- **Thu Oct 29 2026** — the tag for a piece of work to be done was `[work-item]`, and the record was called a work item. It is `[work]`, at the engineer's direction.

Related:

- the the-implementations-directory-holds-one-record-per-implementation rule — the record whose in-progress state is Active, and the words each kind takes
- the the-items-directory-holds-one-file-per-item rule — the other record that carries a state line, and which carries one from the moment it is written
- the file-names rule — the ISO-8601-UTC prefix and the lower-case name this takes an exception to
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — referencing by name rather than path, the same remedy for a rule that a suffix-free reference is for a record
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the log entry a state change also takes

---

Authored by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:28:48 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:29:41 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:15:31 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:35:25 AM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:01:29 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:34:26 AM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:34:30 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 3:13:33 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:00:03 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
