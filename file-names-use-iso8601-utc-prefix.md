# Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix. System rules do not

The datetime prefix marks a **dated artifact** — something a project accrues over time, ordered by when it was made. These take it:

- The **working-state** directories: the decision log (`log/`), `deferred/`, `observations/`, and the work-artifact directories (the project's planning directories, `experiments/`, `loops/`).
- A consuming project's **own local rules** — the rules that project adds to its `waytide/local/rules/`. A local rule is a dated decision in that project's history.

The prefix is an **ISO 8601 datetime normalized to UTC**, followed by a dash-separated, lower-case name and `.md`.

**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`. The date and time are joined by `T`, and the trailing `Z` marks UTC. The time's colons are written as dashes for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`. The name is dash-separated and lower-case.

**The state suffix is the one exception to the lower case.** A record carrying a canonical `**State:**` line ends its name with that state word in **upper case**, after a dash — `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`. The case is what separates the state from the subject, so the name does not read as a record *about* something refuted. See the a-record-ends-with-its-state-in-upper-case rule, which fixes the suffix and states what it costs. Nothing else about the name changes, and the prefix is untouched.

**System rules do not take the prefix.** A rule in a distributed package (`foundation`, `language`, `testing`, …) is named by a dash-separated, lower-case name alone — `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`. A system rule is a curated, durable convention identified by *what it says*, not by when it was written. A datetime on it is noise and buries the rule's name.

That is the distinction between the two kinds of rule: a **system rule** ships in a package and is timeless, so no prefix. A project's **own local rule** is a dated entry in that project's record, so it takes the prefix, like the project's log and deferred items.

**Package structural files** — `README.md` (its introduction), `vocabulary.md` (its terminology reference), and `install-dependencies.sh` (its dependency installer) — take no prefix either. They are named by what they are.

**A project's own `waytide/local/vocabulary.md` takes no prefix, for the same reason.** It is a structural file rather than a dated entry: it accretes terms over the project's life and is named by what it is. That is what separates it from a local rule, which is a dated decision and takes the prefix. See the vocabulary-convention rule.

**Why:** the dated artifacts are a chronological record. So one consistent, UTC-normalized, lexically-sortable prefix orders them regardless of directory. It preserves within-day ordering, and avoids timezone drift between machines. System rules are not a chronology. They are the current, durable set of conventions, so each is named for what it says.

**How to apply:** prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime. Prefix every local rule a project adds the same way. Name a system package's rules, and its structural files, by a dash-separated, lower-case name — no prefix. Give a project's own `waytide/local/vocabulary.md` no prefix either.

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
