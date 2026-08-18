# A record carrying a state line ends its filename with that state in upper case

Where a record carries a canonical `**State:**` line, its **filename** ends with that state
word in **upper case**, appended to the name with a dash and sitting before the extension.

```
2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
```

**It reaches the four records that carry a state line** — an experiment record, a feature record,
a direction artifact, and a sequencing artifact. Each convention fixes its own words, and this
rule fixes only where the word is rendered.

**A record with no state line takes no suffix**, which now reaches an experiment record and a
feature record alone. Absence is the in-progress state in those two conventions, and the
session-start notice is what reports them as open, so a name carrying no suffix is answered
elsewhere.

**A direction artifact and a sequencing artifact always carry a suffix.** Absence stopped being a
state for them on 2026-08-16, when **Active** was added — precisely because this rule moved the
state into the filename, where a missing suffix and an oversight look the same. That asymmetry is
deliberate: the two records nothing reports are the two that must say so in their own names.

**The file's contents are unchanged.** The state is the `**State:**` line and nothing else, and
the file still ends with its provenance footer. The suffix was appended to the contents until
2026-08-16, which put the same value in two places inside one artifact for no reader who was
asking for it there.

## Upper case, and the exception it takes

**The file-names rule requires a dash-separated, lower-case name.** This suffix is the stated
exception, and the case is what earns it: the state is not part of what the record is *about*,
and lower case would read as another word of the subject. `…-ooda-terminology-refuted.md` reads
as a record about refuted OODA terminology. `…-ooda-terminology-REFUTED.md` reads as a record
about OODA terminology, which was refuted.

**The dash is the ordinary separator**, so nothing else about the name changes. The ISO-8601-UTC
prefix is untouched and the directory still sorts chronologically.

## The `**State:**` line stays the only authoritative statement

**The name is derived from the line and changes only when it changes.** Where the two disagree
the line is right, and the name is stale.

**So a state change renames the file.** A record reaching a new word is renamed with `git mv`,
and a reversible word taken back — **Realized** when a design expands, **Deferred** when the work
is taken up — renames it to **ACTIVE**.

**A renamed file breaks a path recorded elsewhere.** That is the cost the rules-convention names
when it says to reference a rule by its name rather than its path. Here the mitigation is the
same as everywhere: historical records are left as written and a reader who follows an
unresolvable path uses git, and **live** artifacts that cite the record are reconciled at the
rename.

**Why:** a record's state is the thing most often wanted without reading the record, and a
directory listing is where it is asked for. `local/experiments/` answers *which of these
concluded* at a glance, in a file tree, in a shell, and in any editor's sidebar — none of which
opens a file to show a line near its top.

The cost is a filename that mutates over a record's
life, which is real and is why the suffix is confined to records that carry a state line at all.

**How to apply:** when a record reaches a state word, write the `**State:**` line and rename the
file so its name ends with that word in upper case, after a dash.

When the state changes, rename
it again. When a reversible state word is taken back, rename it to **ACTIVE**. Reconcile the live
artifacts that cite the old name, and leave historical records as written. Give no suffix to an
experiment or feature record carrying no state line, and add none to any file's contents.

Related:

- the experiments-convention and features-convention — two of the records that carry a state line, and the words each fixes. The idea's convention is not yet written, the mode mechanism having been decommissioned on 2026-08-18
- the file-names rule — the ISO-8601-UTC prefix and the lower-case name this takes an exception to
- the rules-convention — referencing by name rather than path, and the reconciliation a rename obliges
- the direction-and-sequencing-artifacts-take-a-log-entry rule — the log entry a state change also takes

---

Authored by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
