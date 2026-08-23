# Waytide — git

Commit conventions for a project's git history, the one branch operation the agent announces, and how a reference to a commit is read.

The rules in this package govern how commits are made and worded:

- **No Claude co-author trailer**. Commits appear as authored by the user
  only. Omit any `Co-Authored-By: Claude …` attribution.
- **Run the suite before considering a commit**. A passing test suite is a
  precondition of the commit decision, not a step taken after deciding to
  commit, so history stays verified at every commit.
- **Commit messages state the fact, not the bookkeeping**. Write "Task 9 is
  done", never "mark Task 9 done".
- **A subject stops at 50 characters and a body wraps at 72**. Fifty is a display
  budget, since `git log --oneline` truncates near there. Seventy-two is a wrapping
  budget, since `git log` indents a body by four and 80 columns is the target. The
  subject limit does a second job: a subject that will not fit is usually a commit
  doing too much, and the answer is to split it.
- **Subject-first commit messages**. The subject of the change leads, in
  passive voice and indicative mood ("Widget reconciliation is corrected"), so
  a scanned log surfaces what changed first.

One rule governs how a commit is **read** rather than how it is made:

- **A SHA names the work, not the commit**. When the engineer names a commit by its
  SHA, they are asking about the substance it carries — the idea, the implementation, the
  rule, the change to the code. Not the commit message, the file list, or the log entry.
  Those are the answer when the question is about the commit itself, or when the commit's
  whole content is a git operation.

One rule governs a branch operation rather than a commit:

- **Announce a branch switch in a bordered block**. A switch changes what every
  path in the repository means, and it is the one operation whose effect is
  invisible in every later report. The block gives the branch left, the branch
  reached, and why, inside a border that ordinary output cannot be mistaken for.

This is a standalone package: it includes no other packages.

```
git  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/git git@github.com:waytide/git.git master --squash
git subtree pull --prefix waytide/system/git git@github.com:waytide/git.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/waytide/git.git` in place of the address above. A script takes `WAYTIDE_ORIGIN=https://github.com/waytide` for the same reason.

It has no dependencies.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/git git@github.com:waytide/git.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Mon Aug 17 2026 at 11:58:01 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:15:22 AM PT
