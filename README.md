# Waytide — foundation

The `waytide/` [artifact system](https://github.com/waytide/waytide) that every other package builds on.

All agent artifacts for a project live under a single top-level `waytide/` folder. So
they are committed to git alongside the code, and read at the start of each session
rather than recalled. It holds two directories, separating what came from outside from
what is the project's own. **`waytide/system/`** holds the installed packages, never edited
in place. **`waytide/local/`** holds everything the project writes.

Foundation defines
the four core artifact directories and how to work with them. Each has its own rule in
this package:

- **`waytide/system/`** and **`waytide/local/rules/`**. Binding project rules, one per
  file, read and followed every session — the installed system packages in
  `waytide/system/`, the project's own local rules in `waytide/local/rules/`.
- **`waytide/local/vocabulary.md`**. The project's own vocabulary, read with the rules and
  binding like them. Its terms and substitutions decide over every package's
  (`vocabulary-convention`). One file, no datetime prefix, and optional.
- **`waytide/local/observations/`**. Working hypotheses and rule-candidates still under
  discovery. Not yet binding.
- **`waytide/local/deferred/`**. Design changes postponed until the current task finishes.
  A queue, not a permanent record. It is **printed as a list of rows at the start of every
  session**, immediately after the rules are read, so a parked item is not lost by going
  unread (`print-the-deferred-queue-after-the-rule-read`).
- **`waytide/local/log/`**. The decision log: one file per decision, a one-line title.

Three conventions govern all of them: the **ISO-8601-UTC filename prefix**
(`file-names`) that makes every artifact sort chronologically and declare its
timezone. **a time value carries minutes and seconds**
(`a-time-value-carries-minutes-and-seconds`), wherever a datetime written into a file
includes a time of day. Third is **purpose-over-category** (`rules-establish-a-mindset`).
A rule's folder names the surface it acts on, not the purpose it serves.

Foundation also provides project-wide commands: **status report** (a whole-project
summary) and **next deferred item**.

**Every prompt to the engineer goes through the selection interface**
(`present-every-prompt-through-askuserquestion`) — any selection, decision, or answer, never a prose
question. The harness supplies the free-text option, so the agent adds none of its own. It does
add an **`Explain`** option, which is the opposite half of it. The free-text option is how an
engineer answers outside the options. `Explain` is how they ask what the question means
before answering.

The rule lives here rather than in `design-by-efferent`, where it was written, because it governs **every** prompt. `foundation`'s own lifecycles put decisions through the interface, and so does the standalone `versioning` package. So a project installing `foundation` alone must receive the rule along with the instruction to follow it.

Beyond the four core directories, foundation defines the **work-artifact** directories for
planning and running changes:

- `waytide/local/plans/` — implementation plans that sequence a settled design
- `waytide/local/design/` — design docs that settle direction first
- `waytide/local/experiments/` — recorded experiments that test a question
- `waytide/local/features/` — the lifecycle record of a feature
- `waytide/local/work-sessions/` — the narrative record of a work session
- `waytide/local/migration/` — execution plans for transitions of content **across a repository
  boundary**, kept after the content has gone so the trail of where it went stays in the
  repository it left
- `waytide/local/suspended/` — an **undo queue** for what the project stopped doing. The thing
  itself moves, carrying the return address needed to put it back

Under the other modes, `waytide/local/intention/` and `waytide/local/aspiration/`, or
`waytide/local/action/` and `waytide/local/orientation/`, stand in for the first two.

**Experiments and features each carry a full branch lifecycle**, in the
`experiment-lifecycle` and `feature-lifecycle` rules. That is their own branch, a
working location chosen at the start, declared end states, and recorded confirmations. They differ where an experiment's question does
not carry over to a feature's intent. An experiment forecasts and reaches a verdict, which is
affirmed, refuted, inconclusive, abandoned, or superseded. It merges through a test gate on
user-declared affirmation. A feature does none of those, ends
completed/abandoned/superseded (or suspended), and is simply verified before it
integrates.

**How plans and designs *read*** is foundation's concern too, meaning their sections. Four
rules carry it, and they were the `plan` package until it was included here on 2026-08-03:

- **An implementation plan's common elements read in a settled order** — Goals, Source designs,
  Work sequences, Superseded plans, Architecture, Process notes, Tasks, among others the work
  calls for. The order is settled. The set is not (`plan-document-format`).
- **A design doc shares a common spine** — summary or premise, motivation, substantive sections,
  dated **Settled** resolutions, and an **Out of Scope / Deferred** tail
  (`design-document-format`).
- **Plans contain no code samples**, and avoid committing to method or file names that are not
  yet decided (`plans-no-code-samples`).
- **A design section documenting a package dependency is titled "Package Dependency"**, never a
  bare "Dependency", which is overloaded (`package-dependency-heading`).

They live here because foundation defines the artifacts they format. Held separately, the
citation ran in both directions. Foundation named the `plan` package for the shape of documents
foundation itself governs. Every rule in that package was addressed to directories only
foundation creates.

Other packages may contribute their own artifact directories (for example,
design-by-efferent contributes `waytide/local/loops/`). Foundation owns
`rules`/`observations`/`deferred`/`log` and the
`plans`/`design`/`experiments`/`features`/`work-sessions`/`migration`/`suspended` work-artifact directories.

Foundation also settles **what a package dependency is**, in the
`a-citation-is-not-a-dependency` rule. A rule may name another package's rule freely. That
citation becomes a dependency only where the citing rule **will not work** without the cited
package. Motivation is not the test, and a "standalone" claim is about what must be installed
rather than about what a rule's prose may name.

**A project's durable context lives in its committed artifacts, never in an agent memory store**
(`project-context-lives-in-the-committed-artifacts`). The premise is the rules-convention's — the
conventions are read fresh each session rather than recalled, and a store is recall. It reaches
project context alone. A fact about the engineer rather than the project is machine-scoped, and
per-machine configuration under `~/.config/` is where the
`a-project-does-not-name-its-consumers` rule already sends one.

**A preference the engineer expresses is asked about at once**
(`ask-at-once-when-a-preference-is-expressed`), through the selection interface, offering a rule,
an observation, or neither. The two rules are only sound together: the first forbids holding a
preference, and the second is what keeps forbidding it from costing anything. A preference is not
a rule until it is written, and every restatement of one is evidence that nothing carried it.

**A historical record is edited for one reason only** — that it discloses what should not have
been disclosed (`disclosure-is-the-one-reason-to-edit-a-historical-record`). The correction
removes the disclosure and keeps every claim true by stating it at a lower resolution. It never
makes the record say something that did not happen. The engineer is the authority on what
counts, and the git history is not reached by the edit.

**A project works in one of three modes**, chosen at its start through the selection
interface (`a-project-works-in-a-mode-chosen-at-the-start`). Formal is the default and its planning
artifacts are a **design** and a **plan**, in `waytide/local/design/` and `waytide/local/plans/`.
Intuitive's are an **aspiration** and an **intention**, in `waytide/local/aspiration/` and
`waytide/local/intention/`. OODA's are an **orientation** and an **action**, in
`waytide/local/orientation/` and `waytide/local/action/`, drawn from the loop the
`design-by-efferent` package already builds on.

**The conventions and document formats are
identical in every mode.** The mode changes the vocabulary and the directory and no obligation,
because the words a project plans in are load-bearing. The chosen mode is recorded as a local rule
named `formal-mode`, `intuitive-mode`, or `ooda-mode`, written whichever mode is chosen. The
planning directories are checked against it, so a deleted rule cannot silently revert a project. It
does not change after the start.

**A project does not name its downstream consumers** in its own files
(`a-project-does-not-name-its-consumers`) — not in the installed packages, not in its own working
state. A consumer list inverts the dependency direction, drifts silently, and publishes other
people's projects to everyone who reads the file. A project named because a **decision was about
it** is unaffected. What a tool needs in order to reach the consuming projects lives in
per-machine configuration under `~/.config/`, outside the repository.

**Vocabulary** (`vocabulary.md`): the terms every other package and every project uses, since
foundation defines the artifacts they all write into. It states **deferred**, **suspended**, and
**out of scope** beside each other: *not yet*, *no longer*, *not here*. They are confused
most where nothing distinguishes them, and defines **projection**, **reconcile**,
**working-state artifact**, and **plain text data attribute line**. Its one substitution is **work
session record**, never bare "session record".

This package includes no others — everything else includes it. It cites several, which is
exactly the distinction the rule above draws.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

**Foundation carries the tooling a consuming project runs**, and it is the only package that does. Two facts settle that, and they decide all five of its scripts rather than only the installer:

- **`git subtree` can only place files inside a package directory.** So a tool a consuming project runs has to live in some package. There is nowhere else for it to be delivered.
- **It has to be a package that is always there.** Foundation is the only one — every other package includes it, so a project running Waytide at all has foundation.

So `install.sh`, `refresh-packages.sh`, `session-start.sh`, `statusline.sh`, `report-unrecognized-mode.sh`, and `read-consuming-projects.sh` are here. The **authoring** tools are not. `install-all.sh`, `report-direct-commits.sh`, and `report-planning-directories-named-in-part.sh` sit unpackaged at the root of the composite repository. Only the composite publishes, and a consuming project never runs them.

**`read-consuming-projects.sh` is packaged because it is not an authoring tool**, though it sat with them until 2026-08-07. It reports the Waytide projects **on this machine**, reading a per-machine registry at `~/.config/waytide/consuming-projects.toml`. So it is **machine-scoped** where the rest of this package is project-scoped. The engineer who wants it is anyone who installed Waytide into more than one project, rather than whoever maintains Waytide.

The authoring tools run **against the packages**. This one runs **beside projects**, which is a third position the earlier classification had no slot for. It detects nothing about a project's condition, reaches no network, and takes no action on what it finds. It also names no consuming project in its own source: the list is in the registry, outside any repository, per the `a-project-does-not-name-its-consumers` rule.

**Being installed into every project means a copy per project, and one registry.** Each copy reads the same file and reports the same set, so an engineer runs whichever copy is nearest rather than the right one.

**It is here for now, and a package of its own is the likely next position.** `foundation` is where it reaches every project from, being the package every project has — not because discovery is foundational. A package of its own would carry it to the engineers who want it and no others. It would be the first Waytide package that is a **tool** rather than a set of rules.

**`report-unrecognized-mode.sh`** reports a mode rule in `waytide/local/rules/` naming a mode the installed `a-project-works-in-a-mode-chosen-at-the-start` rule no longer defines. It is packaged rather than kept with the authoring tools because the file it checks is **the project's own**. A rename upstream reaches the packages and stops, since no refresh may rewrite a project's rules. So the drift is only visible from inside the project, and only the project's engineer can correct it.

It reads the defined mode names out of the installed rule rather than carrying a list. So a mode added upstream needs no change to the script. Every consuming project on one machine was found in exactly this state on 2026-08-06, a mode having been renamed the day before.

**`refresh-packages.sh` also checks the bootstrap.** The root `AGENTS.md` is written by `install.sh`, belongs to no package, and is therefore the one activated file no `git subtree pull` can reach. So a refresh updates the packages beneath it and leaves it behind.

The script used to print a reminder saying so. On 2026-08-06 every consuming project's bootstrap was found stale anyway, which is what a reminder is worth. It now compares the section against what the installed installer generates, at the moment the drift is created.

The comparison cannot always be made. There may be no `AGENTS.md`, or an installer predating the `bootstrap` subcommand it asks for. It then says the check did not happen rather than reporting agreement. It never invokes an installer that would treat the request as an install.

Foundation carries an **`install.sh`**, which also has to activate the system. Run it from your project root:

```
./install.sh
```

It installs foundation and then places a **root `AGENTS.md`** that tells the agent to read `waytide/system/`, `waytide/local/rules/`, and `waytide/local/vocabulary.md` at the start of every session. That root file is what actually activates the system. `git subtree` can only put files under `waytide/`, never at the project root. Without this step the rules are installed but nothing reads them. If you already have an `AGENTS.md`, the script shows you the exact text, explains the effect, and asks before appending. It never edits your file silently.

It also **renames `waytide/local/work-sessions/` if your project still holds it under its old name**, `waytide/local/sessions/`. This is the one place the installer touches your project's own working state. It moves the directory only when the old name is present and the new one is absent. Where the two exist it reports them and changes nothing, leaving the merge to you.

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

It reports each package that moved and the rule files that changed in it. Those
files are binding, and a silent refresh would be a change of behavior nobody saw. Name
packages to refresh only those (`… refresh-packages.sh testing git`). Set
`WAYTIDE_ORIGIN` to refresh from a fork or a mirror instead of `https://github.com/waytide`. A single package
can still be pulled directly:

```
git subtree pull --prefix waytide/system/foundation https://github.com/waytide/foundation.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:38:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:27:51 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:33:53 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
