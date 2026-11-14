# Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not

**Trigger:** When creating and naming a new file under slasher/local/ or a new rule file in a package

The datetime prefix marks a **dated artifact** — something a project accrues over time, ordered by when it was made. These take it:

- The **working-state** directories: the contemporaneous, historical records under `logs/` — the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/` — and the work-artifact directories `items/`, `implementations/`, and `migration/`.
- A consuming project's **own local rules** — the rules that project adds to its `slasher/local/rules/`. A local rule is a dated decision in that project's history.

The prefix is an **ISO 8601 datetime normalized to UTC**, followed by a dash-separated, lower-case name and `.md`.

**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`. The date and time are joined by `T`, and the trailing `Z` marks UTC. The time's colons are written as dashes for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`. The name is dash-separated and lower-case.

**The state suffix is the one exception to the lower case.** A record carrying a canonical `**State:**` line ends its name with that state word in **upper case**, after a dash — `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`. The case is what separates the state from the subject, so the name does not read as a record *about* something refuted. See the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule, which fixes the suffix and states what it costs. Nothing else about the name changes, and the prefix is untouched.

**System rules do not take the prefix.** A rule in a distributed package (`foundation`, `language`, `testing`, …) is named by a dash-separated, lower-case name alone — `write-subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`. A system rule is a curated, durable convention identified by *what it says*, not by when it was written. A datetime on it is noise and buries the rule's name.

That is the distinction between the two kinds of rule: a **system rule** ships in a package and is timeless, so no prefix. A project's **own local rule** is a dated entry in that project's record, so it takes the prefix, like the project's log and items.

**Package structural files** — `README.md` (its introduction), `vocabulary.md` (its terminology reference), and `install-dependencies.sh` (its dependency installer) — take no prefix either. They are named by what they are.

**A project's own `slasher/local/vocabulary.md` takes no prefix, for the same reason.** It is a structural file rather than a dated entry: it accretes terms over the project's life and is named by what it is. That is what separates it from a local rule, which is a dated decision and takes the prefix. See the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule.

**Why:** the dated artifacts are a chronological record. So one consistent, UTC-normalized, lexically-sortable prefix orders them regardless of directory. It preserves within-day ordering, and avoids timezone drift between machines. System rules are not a chronology. They are the current, durable set of conventions, so each is named for what it says.

**How to apply:** prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime. Prefix every local rule a project adds the same way. Name a system package's rules, and its structural files, by a dash-separated, lower-case name — no prefix. Give a project's own `slasher/local/vocabulary.md` no prefix either.

## Compressed

## What takes the prefix
1. A dated artifact takes the datetime prefix. A dated artifact is something a project accrues over time, ordered by when it was made.
2. The contemporaneous, historical records under `logs/` take it: the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`.
3. The work-artifact directories `items/`, `implementations/`, and `migration/` take it.
4. A consuming project's own local rules, the ones it adds to its `slasher/local/rules/`, take it. A local rule is a dated decision in that project's history.
5. Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime.
6. Prefix every local rule a project adds the same way.

## Format
1. The prefix is an ISO 8601 datetime normalized to UTC. A dash-separated, lower-case name and `.md` follow it.
2. **Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
3. Join the date and time with `T`. The trailing `Z` marks UTC.
4. Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`.
5. The name is dash-separated and lower-case.
6. The state suffix is the one exception to the lower case.
7. A record carrying a canonical `**State:**` line ends its name with that state word in upper case, after a dash: `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`.
8. The suffix changes nothing else about the name, and leaves the prefix untouched.
9. The a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule fixes the suffix.

## What takes no prefix
1. System rules do not take the prefix.
2. Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `write-subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`.
3. A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is.
4. A project's own `slasher/local/vocabulary.md` takes no prefix.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.60, solubility 48 → 79, clarity 0.44 → 0.83, 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 79 → 79, clarity 0.83 → 0.83; checked: 10 directives, 10 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 14 directives, 13 kept, 0 less precise, 1 lost, 1 repair

## History

Until Sun Oct 25 2026 this rule was named file-names-use-iso8601-utc-prefix and titled "Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix. System rules do not".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Mon Oct 26 2026 this rule was named dated-artifacts-take-an-iso-8601-utc-datetime-prefix-and-system-rules-do-not and titled "Dated artifacts take an ISO 8601 UTC datetime prefix, and system rules do not".

---

Authored by Scott Bellware on Wed Jul 1 2026 at 1 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:23:55 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:52:41 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
