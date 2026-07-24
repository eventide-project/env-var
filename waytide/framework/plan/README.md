# Waytide — plan

How a project's **plans and design documents** are written. The package covers both written artifacts that describe a piece of work — the implementation plan (how it gets built) and the design (what it should be) — so despite the name "plan", it governs design documents too.

The rules govern how those documents are written:

- **An implementation plan reads in a settled order** — Goal, Source design,
  Architecture, Process notes, Tasks, and so on (`plan-document-format`).
- **A design doc shares a common spine** — summary or premise, motivation,
  substantive sections, dated Settled resolutions, and an Out of Scope / Deferred
  tail (`design-document-format`).
- **Plans contain no code samples**. A plan describes intended work and
  outcomes in prose, and avoids pre-baking method names, file names, or other
  details that are decided later, interactively.
- **A section documenting a dependency on a package is titled "Package
  Dependency"**. Not a bare "Dependency", which is overloaded.

This is a standalone package: it includes no other packages.

```
plan  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/framework/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/framework/plan https://github.com/waytide/plan.git master --squash
git subtree pull --prefix waytide/framework/plan https://github.com/waytide/plan.git master --squash
```

It has no dependencies.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/plan https://github.com/waytide/plan.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
