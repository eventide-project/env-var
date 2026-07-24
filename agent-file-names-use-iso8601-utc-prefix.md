# Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix; framework rules do not

The datetime prefix marks a **dated artifact** — something a project accrues over time, ordered by when it was made. These take it:

- The **working-state** directories: the decision log (`log/`), `deferred/`, `observations/`, and the work-artifact directories (`plans/`, `design/`, `experiments/`, `loops/`).
- A consuming project's **own local rules** — the rules that project adds to its `waytide/rules/`. A local rule is a dated decision in that project's history.

The prefix is an **ISO 8601 datetime normalized to UTC**, followed by a dash-separated, lower-case name and `.md`.

**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md` — date and time joined by `T`, the trailing `Z` marking UTC, and the time's colons written as dashes for filesystem safety (e.g. `2026-07-01T20-40-00Z-some-name.md`). The name is dash-separated and lower-case.

**Framework rules do not take the prefix.** A rule in a distributed package (`foundation`, `language`, `testing`, …) is named by a dash-separated, lower-case name alone — `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`. A framework rule is a curated, durable convention identified by *what it says*, not by when it was written; a datetime on it is noise and buries the rule's name.

That is the distinction between the two kinds of rule: a **framework rule** ships in a package and is timeless, so no prefix; a project's **own local rule** is a dated entry in that project's record, so it takes the prefix, like the project's log and deferred items.

**Package structural files** — `README.md` (its introduction), `vocabulary.md` (its terminology reference), and `install-dependencies.sh` (its dependency installer) — take no prefix either; they are named by what they are.

**Why:** the dated artifacts are a chronological record, so one consistent, UTC-normalized, lexically-sortable prefix orders them regardless of directory, preserves within-day ordering, and avoids timezone drift between machines. Framework rules are not a chronology; they are the current, durable set of conventions, so each is named for what it says.

**How to apply:** prefix every new working-state artifact, and every local rule a project adds, with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime. Name a framework package's rules, and its structural files, by a dash-separated, lower-case name — no prefix.

---

Authored by Scott Bellware on Wed Jul 1 2026 at 1 PM PT
