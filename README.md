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

**Every prompt to the developer goes through the selection interface**
(`present-every-prompt-through-askuserquestion`) — any choice, decision, or answer, never a prose
question. The harness supplies the free-text escape, so the agent adds none of its own; it does
add an **`Explain`** option, which is the opposite half of that escape — the escape is how a
developer answers outside the options, and `Explain` is how they ask what the question means
before answering. The rule lives here rather than in `design-by-efferent`, where it was written,
because it governs **every** prompt: `foundation`'s own lifecycles put choices through the
interface, and so does the standalone `versioning` package, so a project installing `foundation`
alone must receive the rule along with the instruction to follow it.

Beyond the four core directories, foundation defines the **work-artifact**
directories for planning and running changes — `waytide/local/plans/` (implementation plans
that sequence a settled design), `waytide/local/design/` (design docs that settle direction
first) — or, under the other modes, `waytide/local/intention/` and `waytide/local/aspiration/`,
or `waytide/local/action/` and `waytide/local/orientation/`, in their places — `waytide/local/experiments/` (recorded experiments that test a question),
`waytide/local/features/` (the lifecycle record of a feature), `waytide/local/work-sessions/` (the narrative record of a work session), and
`waytide/local/migration/` (execution plans for transitions of content **across a repository
boundary**, kept after the content has gone so the trail of where it went stays in the
repository it left), and `waytide/local/suspended/` (an **undo queue** for what the project
stopped doing — the thing itself moves, carrying the return address needed to put it
back).

**Experiments and features each carry a full branch lifecycle** — their own branch, a
working location chosen at initiation (branch only, or branch and worktree), declared
end states, and recorded confirmations — in the `experiment-lifecycle` and
`feature-lifecycle` rules. They differ where an experiment's question does
not carry over to a feature's intent: an experiment forecasts, reaches a verdict
(affirmed/refuted/inconclusive/abandoned/superseded), and merges through a test gate on
user-declared affirmation; a feature does none of those, ends
completed/abandoned/superseded (or suspended), and is simply verified before it
integrates.

**How plans and designs *read*** — their sections — is foundation's concern too, in four
rules that were the `plan` package until it was folded in on 2026-08-03:

- **An implementation plan's common elements read in a settled order** — Goals, Source designs,
  Work sequences, Superseded plans, Architecture, Process notes, Tasks, among others the work
  calls for. The order is settled; the set is not (`plan-document-format`).
- **A design doc shares a common spine** — summary or premise, motivation, substantive sections,
  dated **Settled** resolutions, and an **Out of Scope / Deferred** tail
  (`design-document-format`).
- **Plans contain no code samples**, and avoid committing to method or file names that are not
  yet decided (`plans-no-code-samples`).
- **A design section documenting a package dependency is titled "Package Dependency"**, never a
  bare "Dependency", which is overloaded (`package-dependency-heading`).

They live here because foundation defines the artifacts they format. Held separately, the
citation ran both ways — foundation naming the `plan` package for the shape of documents
foundation itself governs, and every rule in that package addressed to directories only
foundation creates.

Other packages may contribute their own artifact directories (for example,
design-by-efferent contributes `waytide/local/loops/`); foundation owns
`rules`/`observations`/`deferred`/`log` and the
`plans`/`design`/`experiments`/`features`/`work-sessions`/`migration`/`suspended` work-artifact directories.

Foundation also settles **what a package dependency is**, in the
`a-citation-is-not-a-dependency` rule: a rule may name another package's rule freely, and that
citation becomes a dependency only where the citing rule **will not work** without the cited
package. Motivation is not the test, and a "standalone" claim is about what must be installed
rather than about what a rule's prose may name.

**A historical record is edited for one reason only** — that it discloses what should not have
been disclosed (`disclosure-is-the-one-reason-to-edit-a-historical-record`). The correction
removes the disclosure and keeps every claim true by stating it at a lower resolution, never by
making the record say something that did not happen. The developer is the authority on what
counts, and the git history is not reached by the edit.

**A project works in one of three modes**, chosen at its initiation through the selection
interface (`a-project-works-in-a-mode-chosen-at-initiation`). Formal is the default and its planning
artifacts are a **design** and a **plan**, in `waytide/local/design/` and `waytide/local/plans/`;
intuitive's are an **aspiration** and an **intention**, in `waytide/local/aspiration/` and
`waytide/local/intention/`; OODA's are an **orientation** and an **action**, in
`waytide/local/orientation/` and `waytide/local/action/`, drawn from the loop the
`design-by-efferent` package already builds on. **The conventions and document formats are
identical in every mode** — the mode changes the vocabulary and the directory and no obligation,
because the words a project plans in are load-bearing. The chosen mode is recorded as a local rule
named `formal-mode`, `intuitive-mode`, or `ooda-mode`, written whichever mode is chosen, and the
planning directories are checked against it so a deleted rule cannot silently revert a project. It
does not change after initiation.

**A project does not name its downstream consumers** in its own files
(`a-project-does-not-name-its-consumers`) — not in the installed packages, not in its own working
state. A consumer list inverts the dependency direction, drifts silently, and publishes other
people's projects to everyone who reads the file. A project named because a **decision was about
it** is unaffected; what a tool needs in order to reach the consuming projects lives in
per-machine configuration under `~/.config/`, outside the repository.

**Vocabulary** (`vocabulary.md`): the terms every other package and every project uses, since
foundation defines the artifacts they all write into. It states **deferred**, **suspended**, and
**out of scope** beside each other — *not yet*, *no longer*, *not here* — because they are
confused most where nothing distinguishes them; and defines **projection**, **reconcile**,
**working-state artifact**, and **recognizable-content line**. Its one substitution is **work
session record**, never bare "session record".

This package includes no others — everything else includes it. It cites several, which is
exactly the distinction the rule above draws.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

**Foundation carries the tooling a consuming project runs**, and it is the only package that does. Two facts settle that, and they decide all five of its scripts rather than only the installer:

- **`git subtree` can only place files inside a package directory.** So a tool a consuming project runs has to live in some package; there is nowhere else for it to be delivered.
- **It has to be a package that is always there.** Foundation is the only one — every other package includes it, so a project running Waytide at all has foundation.

So `install.sh`, `refresh-packages.sh`, `session-start.sh`, `statusline.sh`, and `report-unrecognized-mode.sh` are here. The **authoring** tools are not: `install-all.sh`, `report-direct-commits.sh`, `read-consuming-projects.sh`, and `report-planning-directories-named-in-part.sh` sit unpackaged at the root of the composite repository, because only the composite publishes and a consuming project never runs them.

**`report-unrecognized-mode.sh`** reports a mode rule in `waytide/local/rules/` naming a mode the installed `a-project-works-in-a-mode-chosen-at-initiation` rule no longer defines. It is packaged rather than kept with the authoring tools because the file it checks is **the project's own** — a rename upstream reaches the packages and stops, since no refresh may rewrite a project's rules, so the drift is only visible from inside the project and only the project's developer can correct it. It reads the defined mode names out of the installed rule rather than carrying a list, so a mode added upstream needs no change to the script. Every consuming project on one machine was found in exactly this state on 2026-08-06, a mode having been renamed the day before.

**`refresh-packages.sh` also checks the bootstrap.** The root `AGENTS.md` is written by `install.sh`, belongs to no package, and is therefore the one activated file no `git subtree pull` can reach — so a refresh updates the packages beneath it and leaves it behind. The script used to print a reminder saying so; on 2026-08-06 every consuming project's bootstrap was found stale anyway, which is what a reminder is worth. It now compares the section against what the installed installer generates, at the moment the drift is created. Where the comparison cannot be made — no `AGENTS.md`, or an installer predating the `bootstrap` subcommand it asks for — it says the check did not happen rather than reporting agreement, and it never invokes an installer that would treat the request as an install.

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

Waytide is licensed under the **Eventide Common Interest License** — source-available and free to use, and not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
