# Publish the "Package version form" label correction in the git package

The `git` package's `subject-first-commit-messages` rule was corrected in this project's
installed copy: the version form's label reads **"Package version form"** rather than
"Version bump form", because "bump" is a figurative term the `language` package retires,
and the rule now states the form's purpose — the message names the current version and the
next one, and "increased" holds even when a trailing segment resets.

The change lives at `waytide/framework/git/subject-first-commit-messages.md`, which is
installed content. `git subtree pull --prefix waytide/framework/git` overwrites it. The
correction survives only if the same edit is made in the `git` package's own repository
(`https://github.com/waytide/git.git`) and published from there.

**Gated on:** access to the `git` package's repository, and the willingness to change
installed framework content upstream rather than only in this project.

**Why:** an edit to installed content is silently reverted by the next refresh from
upstream, and the revert gives no warning — the rule simply reads the old way again, and a
reader has no reason to suspect it was ever corrected. Tracking the publishing keeps the
correction from being lost, and keeps this project's copy from diverging permanently from
the package everyone else installs.

**How to apply:** make the same edit to `subject-first-commit-messages.md` in the `git`
package's repository, appending the same `Changed by` line, and publish it. Then refresh
this project with `git subtree pull --prefix waytide/framework/git`, confirm the label
survives the pull, delete this deferred item, and add a `waytide/log/` entry recording
that the correction was published.

---

Authored by Scott Bellware on Sat Jul 25 2026 at 11 PM PT
