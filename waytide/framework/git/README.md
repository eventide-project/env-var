# Waytide — git

Commit conventions for a project's git history.

The rules in this package govern how commits are made and worded:

- **No Claude co-author trailer**. Commits appear as authored by the user
  only; omit any `Co-Authored-By: Claude …` attribution.
- **Run the suite before considering a commit**. A passing test suite is a
  precondition of the commit decision, not a step taken after deciding to
  commit, so history stays verified at every commit.
- **Commit messages state the fact, not the bookkeeping**. Write "Task 9 is
  done", never "mark Task 9 done".
- **Subject-first commit messages**. The subject of the change leads, in
  passive voice and indicative mood ("Widget reconciliation is corrected"), so
  a scanned log surfaces what changed first.

This is a standalone package: it includes no other packages.

```
git  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/framework/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/framework/git https://github.com/waytide/git.git master --squash
git subtree pull --prefix waytide/framework/git https://github.com/waytide/git.git master --squash
```

It has no dependencies.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/git https://github.com/waytide/git.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
