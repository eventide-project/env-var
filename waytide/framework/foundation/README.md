# Waytide — foundation

The `waytide/` [artifact framework](https://github.com/waytide/waytide) that every other package builds on.

All agent artifacts for a project live under a single top-level `waytide/` folder, so
they are committed to git alongside the code and read at the start of each session
rather than recalled. Foundation defines the four core artifact directories and how
to work with them; each has its own rule in this package:

- **`waytide/framework/`** and **`waytide/rules/`**. Binding project rules, one per
  file, read and followed every session — the installed framework packages in
  `waytide/framework/`, the project's own local rules in `waytide/rules/`.
- **`waytide/observations/`**. Working hypotheses and rule-candidates still under
  discovery; not yet binding.
- **`waytide/deferred/`**. Design changes postponed until the current task finishes;
  a queue, not a permanent record.
- **`waytide/log/`**. The decision log: one file per decision, a one-line title.

Two conventions cut across all of them: the **ISO-8601-UTC filename prefix**
(`agent-file-names`) that makes every artifact sort chronologically and declare its
timezone, and **purpose-over-category** (`rules-install-a-mindset`) — a rule's folder
names the surface it acts on, not the purpose it serves.

Foundation also provides project-wide commands: **status report** (a whole-project
summary) and **next deferred item**.

Beyond the four core directories, foundation defines the **work-artifact**
directories for planning and running changes — `waytide/plans/` (implementation plans
that sequence a settled design), `waytide/design/` (design docs that settle direction
first), `waytide/experiments/` (recorded experiments that test a question), and `waytide/sessions/` (the narrative record of a work session).
Experiments carry a full branch lifecycle — their own branch, the
affirmed/refuted/inconclusive/abandoned/superseded states, and a test-gated merge —
in the `experiment-runs-on-its-own-branch` rule. How plans and designs *read* (their
sections) is the `plan` package's concern.

Other packages may contribute their own artifact directories (for example,
design-by-efferent contributes `waytide/loops/`); foundation owns
`rules`/`observations`/`deferred`/`log` and the `plans`/`design`/`experiments`
work-artifact directories.

This package includes no others — everything else includes it.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

Foundation carries an **`install.sh`** — the only package that does, because it also has to switch the framework on. Run it from your project root:

```
sh install.sh
```

It installs foundation and then places a **root `AGENTS.md`** that tells the agent to read `waytide/framework/` and `waytide/rules/` at the start of every session. That root file is what actually activates the framework: `git subtree` can only put files under `waytide/`, never at the project root, so without this step the rules are installed but nothing reads them. If you already have an `AGENTS.md`, the script shows you the exact text, explains the effect, and asks before appending — it never edits your file silently.

You can install with plain `git subtree` instead, but then you must add the root `AGENTS.md` yourself or the framework stays inactive:

```
git subtree add  --prefix waytide/framework/foundation https://github.com/waytide/foundation.git master --squash
git subtree pull --prefix waytide/framework/foundation https://github.com/waytide/foundation.git master --squash
```

This package has no dependencies. (The composite `install-all.sh` installs every package and runs this same bootstrap for you.)

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/foundation https://github.com/waytide/foundation.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
