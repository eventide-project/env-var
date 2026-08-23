# A Ruby suite is run from `test/automated.rb`, its verified output reads `0 failed, 0 aborted`, and the tree script sits beside it

This rule carries what running a Ruby project's test suite requires that cannot be said
without naming Ruby and TestBench. The conventions it serves are stated stack-neutrally in
other packages and cited here. Only the concrete parts live in this one.

**The entry point is `test/automated.rb`**, run as `ruby test/automated.rb`. That single
command runs the whole suite. A single test file may be run directly for speed while working,
but the entry point is what a full run means.

**Verified output reads `0 failed, 0 aborted`.** This is TestBench's own summary line, not a
general phrasing — a run that reports it has passed, and anything else has not. The `git`
package's run-suite-before-commit rule requires the suite to be confirmed passing before the
commit decision is reached. This is what confirming it looks like here.

## The tree script

The `testing` package's test-tree command calls for a **durable script** so the command is
reproducible in every session rather than a parser rebuilt each time. In a Ruby project that
script is a Ruby file. It runs the suite, suppresses TestBench's narration, captures the
output, and parses it. Every file's `context`/`test` hierarchy is merged into one tree keyed by
name, so identical paths de-duplicate.

- **It lives under `test/automated/`**, beside the suite it reads — `test/automated/tree.rb`
  is the established location.
- **It is excluded from the default suite run.** It runs the suite itself, so a suite that
  ran it would recurse.
- **It parses the run's output, never the source.** That is the test-tree rule's requirement and its reason: a dynamic `context <expr> do` shows its expanded real value in a run and a placeholder in the source. A bare unnamed `test do` emits no line at all.

**Why:** what command runs a suite, what its passing output says. What a script must do to parse it are all facts about a stack, and a package that disclaims a stack cannot state them.
`git` declares itself standalone, and `testing` opens by disclaiming any framework API. Left in
those packages, the facts made the two claims false and made the rules inapplicable to a project
that is not Ruby.

Held here, the general conventions stay general and a Ruby project still gets
the concrete answer. The split is the ordinary one. The general part is substantial on its own,
so separating it costs nothing and leaves each part where it belongs.

**How to apply:** run a Ruby project's suite with `ruby test/automated.rb`. Treat
`0 failed, 0 aborted` as the verified result. Keep the tree script at `test/automated/tree.rb`,
excluded from the default run, parsing the run's output rather than the source.

Related:

- the `git` run-suite-before-commit rule — when the run happens relative to the commit decision
- the `testing` test-tree-command rule — what the tree is and where it is derived from
- the `testing` test-report-format rule and the `foundation` status-report-format rule — the shallower two-level tree
- the lib-report-format rule in this package — the sibling command rule

---

Authored by Scott Bellware on Fri Jul 31 2026 at 10:47:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
