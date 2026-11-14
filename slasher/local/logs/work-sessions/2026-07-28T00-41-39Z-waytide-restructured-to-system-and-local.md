# Session — The `waytide/` tree restructured to system and local (Mon Jul 27 2026 17:41)

## Opening summary

The session moved this project's Waytide installation to the two-directory layout —
`waytide/system/` for what is installed from outside, `waytide/local/` for everything this
project writes — and then spent the rest of its length repairing what the move exposed and
taking in what upstream had meanwhile changed. It began with a migration script fetched
from the `foundation` package and run from the project root, continued with the bootstrap
that script deliberately declines to rewrite, corrected an experiment record whose state
the session-start notice could not read, and closed with three refreshes of `foundation`.
Nothing in the library itself was touched; the whole session was the system the work is
done under.

## Framing note

This is the communicable record — the guided tour, written to be read by a person. The
durable records are the source of truth, and this narrative points to them.

**This record was reconstructed after the fact.** It was written in a later session the
same evening, from the commit history and the file diffs, not from the session's dialogue.
So it narrates what was *done* and the reasoning the commit messages carry; where a
reason was spoken and not committed, it is not here. The session left **no decision-log
entries** — the commits are the only durable record of it. This record notes that gap
rather than repairing it: backfilled log entries would carry tonight's timestamps and
misplace themselves in the chronology.

## 1. The migration to `system/` and `local/`

At 3:15 PM the layout changed, in a run of commits spanning nine seconds, made by
`migrate-to-system-and-local.sh` — a script that had to be fetched directly from the
`foundation` repository rather than arriving through the usual channel, because the split
path itself was what changed and a `git subtree pull` at the old prefix has nothing to
merge.

The script did three things and refused a fourth:

- **The project's own work moved** to `waytide/local/` — `log/`, `experiments/`, `loops/`,
  `rules/`, `sessions/`, 23 tracked files, renames only (`4657da0`).
- **The installed packages were removed and re-added**, not moved (`fd36bbd`, then seven
  `git subtree add` merges). Re-adding rather than pulling was forced: each component
  repository's history had been replaced upstream, so an existing subtree shared no commits
  with its current remote. The cost is that anything edited inside `waytide/framework/`
  would have been discarded — nothing here had been.
- **The harness configuration was repointed** — the `SessionStart` hook and the status line
  in `.claude/settings.json`, `framework` to `system` (`a416e39`).

## 2. The bootstrap, which the script will not rewrite

`AGENTS.md` still named `waytide/framework/` and `waytide/rules/`. The script leaves it
alone by design — it is the developer's own file and may hold content unrelated to Waytide,
so it is never edited silently; the script instead prints what remains to be done.

The consequence was not cosmetic, and the commit message states it plainly: **a session
start read nothing.** The bootstrap is the only thing that activates the system —
`git subtree` can place files only under `waytide/`, never at the project root — so a
bootstrap pointing at vacated paths leaves every rule installed and unread.

It was rewritten by hand at 3:24 PM (`534b154`), and the rewrite did more than substitute
paths. Where the old text listed the working-state directories as "the other directories
under `waytide/`", the new text states the split itself:

> `waytide/` holds exactly two directories, splitting what came from outside from what is
> this project's own.

`waytide/local/rules/` reads as binding at session start; the working state beside it does
not. A leading blank line left by the rewrite was removed ten minutes later (`bbf147c`).

## 3. The experiment record's state was not where the notice looks

The session-start notice reports open experiments. It reported the `unset` block form as
open with no state recorded — though that experiment had been affirmed and merged on
Jul 24.

The record was not wrong; it was unparseable. It carried its state as
`**State: Affirmed.**` inside the Lifecycle prose, and the notice reads a canonical
`- **State:**` line in the Setup block. That canonical-line requirement entered the
experiments convention on Jul 26, after the record was written, so the record predated the
form it was being read against.

The fix (`df0fca0`) put the state on the canonical line and reopened the Lifecycle
paragraph with `**Affirmed.**` so it would not read as a second declaration, and corrected
a `waytide/log/` path the migration had left stale. The **working location** — single tree
or worktree — which the same convention revision now wants recorded at initiation, was
**not** reconstructed. It was not knowable from the record, and inventing it would have
been a false entry.

## 4. Three refreshes of `foundation`

The rest of the session took in upstream work by `git subtree` pull. The changes were
authored in the `foundation` repository itself — their footers date them across the same
afternoon — and arrived here in three merges.

- **4:43 PM (`a396ae2`).** `refresh-packages.sh` arrived, the one command that refreshes
  every installed package and reports which rule files changed. With it came a revision of
  the two branch rules: the working-location choice put to the developer at every
  experiment and feature initiation is now named **branch only** and **branch and
  worktree** — each option stating what it *creates* — rather than "single working tree"
  and "worktree", which named a movement of the working tree that is immaterial to the
  branch-only case. Worktree naming was reordered to `<repository>-experiment-<subject>`,
  kind before subject, so every experiment sorts together instead of interleaving with the
  features.
- **5:20 PM (`01ce900`).** The status line gained an **uncommitted changes** segment —
  present only when the tree has something not committed, including an untracked file that
  is not ignored, on the reasoning that an untracked file is usually one that should be
  added or ignored. Words rather than a `*` on the branch, because the conventional mark
  means nothing until a reader is taught it.
- **5:29 PM (`aaac1f1`).** `migrate-to-system-and-local.sh` was **deleted** upstream and its
  section removed from the `foundation` README. The migration this session ran is the one
  this project needed; with it done, the script's reason to exist was gone. The README also
  dropped the `sh` prefix from the refresh command, the script being executable.

## Takeaways

- **A path change breaks the bootstrap silently.** Every rule stays installed and every
  one goes unread, and nothing announces it — the notice still prints. The bootstrap is
  the activation, so it is the first thing to check after anything under `waytide/` moves.
- **A tool that edits your files should decline the ones that are yours.** The migration
  script rewrote the generated harness configuration without asking and refused
  `AGENTS.md`, printing the remaining step instead. The refusal cost one manual commit and
  bought the guarantee that the script cannot silently damage a hand-written file.
- **A record written before a convention will not satisfy it.** The experiment's state was
  recorded correctly for its day and unreadable to a reader added later. Conform what can
  be conformed, and leave unreconstructable fields empty rather than inventing them.
- **Re-adding a subtree is not moving it.** When the upstream history has been replaced,
  a pull has nothing to merge — the packages must be removed and added afresh, which
  discards any local edit inside them. That is the standing argument for never editing
  `waytide/system/` in place.
- **The session left no log entries.** Four decisions of the kind the decision-log
  convention names — the two-directory layout, the bootstrap's restatement of it, the
  canonical State line, and the choice not to reconstruct the working location — went
  unrecorded at the time.

## Glossary

- **system** (of a Waytide directory) — `waytide/system/`: the installed packages, sourced
  from outside the project by `git subtree` and never edited in place. It replaces
  `waytide/framework/`, and the word "framework" with it.
- **local** (of a Waytide directory) — `waytide/local/`: everything the project itself
  writes — `rules/` alongside the working state. Only `rules/` is read as binding at
  session start.
- **bootstrap** — the root `AGENTS.md` section that instructs the agent to read
  `waytide/system/` and `waytide/local/rules/` at session start. It is what activates the
  system; without it the rules are installed and inert.
- **canonical State line** — the `- **State:** <state>` line in an experiment record's
  Setup block, the one place the session-start notice reads an experiment's state from.
  State stated anywhere else in the record is invisible to it.
- **branch only** / **branch and worktree** — the two working locations offered at an
  experiment's or feature's initiation. Both create the branch; only the second adds a
  second working directory.
- **refresh** — `refresh-packages.sh`: pulling every installed package from upstream in one
  command, reporting the rule files that changed, because those files are binding and a
  silent refresh is a change of behavior nobody saw.

## Where the durable records live

- **The bootstrap** — `AGENTS.md`, stating the two-directory split and the session-start
  read.
- **The harness configuration** — `.claude/settings.json`, pointing at
  `waytide/system/foundation/`.
- **The experiment record** —
  `waytide/local/experiments/2026-07-24T17-38-41Z-unset-block-form.md`, state **Affirmed**
  on the canonical line, working location not reconstructed.
- **The installed system** — `waytide/system/`, seven packages;
  `foundation` at the third pull.
- **The decision log** — `waytide/local/log/`, seventeen entries, **none from this
  session**.
- **The commits** — `4657da0` through `aaac1f1` on `master`.

## Closing note

The session's subject was the system rather than the library, and its two real defects were
both of one kind: a reader and the thing it reads drifting apart. The bootstrap named
directories that no longer existed; the notice looked for a state line the record predated.
Neither failed loudly. The first printed its usual notice over an empty read, and the
second reported an affirmed experiment as open — each stating something false in the
ordinary voice it uses for the truth. What caught them was using the system, not inspecting
it.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 5:41:39 PM PT
