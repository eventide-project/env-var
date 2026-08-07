# Waytide — versioning

What a version means, and how the next one is chosen. Not how a package is built or published
— that is the concern of whatever technology the package is distributed with.

- **A version is semver, optionally prefixed by a product generation number**
  (`version-scheme`). The three trailing segments answer *what does a user of this have to do*
  — nothing, nothing but read, or change their code. The leading segment, where a project
  carries one, answers *is this the same product*, which is a **declaration** rather than a
  reading of the change, and is never increased at a release.
- **The next version is put to the developer, never decided by the agent**
  (`the-next-version-is-chosen-by-the-developer`). Patch, minor, and major are offered through
  the selection interface, each showing the resulting version and the claim it makes. The
  choice is a promise about other people's code, and a published version cannot be taken back.

**Vocabulary** (`vocabulary.md`): one term, **product generation** — the leading segment of a
four-segment version, a product-management declaration rather than a compatibility claim.

**What this package deliberately does not hold.** A release touches three separate concerns,
and only one of them is versioning:

- **The commit** that records a version change is a commit concern, and stays in the `git`
  package — `Package version is increased from 1.1.1 to 1.2.0`, in the subject-first rule.
- **The mechanics** — where the version is recorded, and how the package is built and
  published — belong to the technology the package is distributed with. For a Ruby gem that is
  the `code/ruby` package: the gemspec's `s.version`, `gem build`, `gem push`.
- **This package has no knowledge of any of that**, even though every package versioned under
  it today is a Ruby gem. What a version means does not change with the packaging technology,
  and a rule that mixed the two would be unusable by a project that packages differently.

**Why it is called versioning.** Not *release* or *packaging*: both name acts whose substance
is the technology-specific part — bundling a distributable and publishing it. What is left is
not an act but a meaning. Not *version*: a version is a particular value, where this package
governs the practice of assigning and interpreting them, and `waytide/version` would read as
the version of Waytide itself rather than of the things made with it.

This is a standalone package: it includes no other packages.

```
versioning  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/versioning https://github.com/waytide/versioning.git master --squash
git subtree pull --prefix waytide/system/versioning https://github.com/waytide/versioning.git master --squash
```

It has no dependencies.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/versioning https://github.com/waytide/versioning.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License** — source-available and free to use, and not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
