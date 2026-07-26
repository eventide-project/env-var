# Publish the record-title date format rule in the foundation package

A new framework rule was authored directly in this project's installed copy of the
`foundation` package: `waytide/framework/foundation/record-title-date-format.md`. It fixes
the form of a date in a record's title — `Mon Jan 1 2026 18:06`, the author's local time at
the moment the record was written — and distinguishes it from the two date formats already
in the package, the UTC filename prefix and the provenance footer's
`at <hour> <zone>` form.

`git subtree pull --prefix waytide/framework/foundation` overwrites the installed copy, and
because the rule is a **new file** rather than an edit to an existing one, the pull may
simply remove it. It survives only if it is authored in the `foundation` package's own
repository (`https://github.com/waytide/foundation.git`) and published from there.

**Gated on:** access to the `foundation` package's repository.

**Why:** a rule that exists only in one project's installed copy is not a framework rule —
it is a local rule in the wrong directory, and the next refresh deletes it without warning.
Publishing it upstream is what makes it what it was written to be, and what keeps every
project that installs `foundation` reading the same set.

**How to apply:** add `record-title-date-format.md` to the `foundation` package's
repository with the same content and provenance footer, and publish it. Consider whether
`agent-sessions-convention` should point at it from its `# Session — <name> (<date>)`
line — the new rule references that convention, but not the reverse. Then refresh this
project with `git subtree pull --prefix waytide/framework/foundation`, confirm the file
survives, delete this deferred item, and add a `waytide/log/` entry recording that it was
published.

Related: the sibling deferred item for publishing the `git` package's "Package version
form" label correction — the same failure mode in a different package.

---

Authored by Scott Bellware on Sun Jul 26 2026 at 12 AM PT
