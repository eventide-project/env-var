# Waytide — foundation

The `waytide/` [artifact system](https://github.com/waytide/waytide) that every other package builds on.

All agent artifacts for a project live under a single top-level `waytide/` folder, so
they are committed to git alongside the code and read at the start of each session
rather than recalled. It holds two directories, splitting what came from outside from
what is the project's own: **`waytide/system/`**, the installed packages, never edited
in place; and **`waytide/local/`**, everything the project writes. Foundation defines
the four core artifact directories and how to work with them; each has its own rule in
this package:

- **`waytide/system/`** and **`waytide/local/rules/`**. Binding project rules, one per
  file, read and followed every session — the installed system packages in
  `waytide/system/`, the project's own local rules in `waytide/local/rules/`.
- **`waytide/local/observations/`**. Working hypotheses and rule-candidates still under
  discovery; not yet binding.
- **`waytide/local/deferred/`**. Design changes postponed until the current task finishes;
  a queue, not a permanent record. It is **printed as a list of rows at the start of every
  session**, immediately after the rules are read, so a parked item is not lost by going
  unread (`print-the-deferred-queue-after-the-rule-read`).
- **`waytide/local/log/`**. The decision log: one file per decision, a one-line title.

Three conventions cut across all of them: the **ISO-8601-UTC filename prefix**
(`file-names`) that makes every artifact sort chronologically and declare its
timezone; **a time value carries minutes and seconds**
(`a-time-value-carries-minutes-and-seconds`) wherever a datetime written into a file
includes a time of day; and **purpose-over-category** (`rules-install-a-mindset`) —
a rule's folder names the surface it acts on, not the purpose it serves.

Foundation also provides project-wide commands: **status report** (a whole-project
summary) and **next deferred item**.

Beyond the four core directories, foundation defines the **work-artifact**
directories for planning and running changes — `waytide/local/plans/` (implementation plans
that sequence a settled design), `waytide/local/design/` (design docs that settle direction
first), `waytide/local/experiments/` (recorded experiments that test a question),
`waytide/local/features/` (the lifecycle record of a feature), and `waytide/local/work-sessions/` (the narrative record of a work session).

**Experiments and features each carry a full branch lifecycle** — their own branch, a
working location chosen at initiation (branch only, or branch and worktree), declared
end states, and recorded confirmations — in the `experiment-lifecycle` and
`feature-lifecycle` rules. They differ where an experiment's question does
not carry over to a feature's intent: an experiment forecasts, reaches a verdict
(affirmed/refuted/inconclusive/abandoned/superseded), and merges through a test gate on
user-declared affirmation; a feature does none of those, ends
completed/abandoned/superseded (or suspended), and is simply verified before it
integrates. How plans and designs *read* (their sections) is the `plan` package's
concern.

Other packages may contribute their own artifact directories (for example,
design-by-efferent contributes `waytide/local/loops/`); foundation owns
`rules`/`observations`/`deferred`/`log` and the
`plans`/`design`/`experiments`/`features`/`work-sessions` work-artifact directories.

Foundation also settles **what a package dependency is**, in the
`a-citation-is-not-a-dependency` rule: a rule may name another package's rule freely, and that
citation becomes a dependency only where the citing rule **will not work** without the cited
package. Motivation is not the test, and a "standalone" claim is about what must be installed
rather than about what a rule's prose may name.

This package includes no others — everything else includes it. It cites several, which is
exactly the distinction the rule above draws.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

**Foundation carries the tooling a consuming project runs**, and it is the only package that does. Two facts settle that, and they decide all four of its scripts rather than only the installer:

- **`git subtree` can only place files inside a package directory.** So a tool a consuming project runs has to live in some package; there is nowhere else for it to be delivered.
- **It has to be a package that is always there.** Foundation is the only one — every other package includes it, so a project running Waytide at all has foundation.

So `install.sh`, `refresh-packages.sh`, `session-start.sh`, and `statusline.sh` are here. The **authoring** tools are not: `install-all.sh` and `report-direct-commits.sh` sit unpackaged at the root of the composite repository, because only the composite publishes and a consuming project never runs them.

Foundation carries an **`install.sh`**, which also has to activate the system. Run it from your project root:

```
./install.sh
```

It installs foundation and then places a **root `AGENTS.md`** that tells the agent to read `waytide/system/` and `waytide/local/rules/` at the start of every session. That root file is what actually activates the system: `git subtree` can only put files under `waytide/`, never at the project root, so without this step the rules are installed but nothing reads them. If you already have an `AGENTS.md`, the script shows you the exact text, explains the effect, and asks before appending — it never edits your file silently.

It also **renames `waytide/local/work-sessions/` if your project still holds it under its old name**, `waytide/local/sessions/`. This is the one place the installer touches your project's own working state, and it moves the directory only when the old name is present and the new one is absent; where both exist it reports them and changes nothing, leaving the merge to you.

You can install with plain `git subtree` instead, but then you must add the root `AGENTS.md` yourself or the system stays inactive:

```
git subtree add  --prefix waytide/system/foundation https://github.com/waytide/foundation.git master --squash
git subtree pull --prefix waytide/system/foundation https://github.com/waytide/foundation.git master --squash
```

This package has no dependencies. (The composite `install-all.sh` installs every package and runs this same bootstrap for you.)

**Refresh from upstream** periodically to pull the latest rules. Once foundation is
installed, one command refreshes every installed package:

```
waytide/system/foundation/refresh-packages.sh
```

It reports each package that moved and the rule files that changed in it, because those
files are binding and a silent refresh would be a change of behavior nobody saw. Name
packages to refresh only those (`… refresh-packages.sh testing git`). Set
`WAYTIDE_ORIGIN` to refresh from a fork or a mirror instead of `https://github.com/waytide`. A single package
can still be pulled directly:

```
git subtree pull --prefix waytide/system/foundation https://github.com/waytide/foundation.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
