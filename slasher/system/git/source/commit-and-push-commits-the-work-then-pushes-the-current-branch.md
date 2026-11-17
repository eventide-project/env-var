# Commit-and-push commits the work, then pushes the current branch

**Trigger:** When the engineer types `/commit-and-push` or `/cp`

**As the engineer stated it:** Commit and push command and shortcut

**`/commit-and-push` commits the work, then pushes the current branch.** `/cp` is its shortcut alias, and does exactly what it does. Typing it is the engineer's request for both the commit and the push. Do not ask again whether to commit or whether to push. This holds on `master` too, since the engineer typed the request.

**The automated suite runs first.** Run it as the run-the-test-suite-after-changes-before-considering-whether-to-commit rule says. Where anything fails or is aborted, say so, and commit nothing and push nothing.

**Commit the working tree's changes.** Write the message under the commit-message rules, which load when a commit message is written. Split the work into more than one commit where one subject cannot say it, as those rules require.

**Where the working tree holds changes the session did not make, ask before committing them.** Ask through the selection interface whether to commit them with the rest, or to leave them uncommitted. Commit the session's own changes either way.

**Then push, as `/push` does.** Push the current branch only, to its upstream. Never force. Where the remote refuses the push, say so, and stop. The push-pushes-the-current-branch-to-its-remote rule governs the push.

**Where there is nothing to commit, push only.** Where there is nothing to push either, say so, and do nothing.

**Report each act in one line:** the commit's subject, then the push, as `master` pushed to `origin`, `599bae8b..e3ab6817`.

**`/commit-and-push` is in the PUSH command domain.** `/push help` prints its help. `/commit-and-push help` and `/cp help` say that the command takes no `help`, name `/push help`, and do nothing more.

**Why:** the engineer often ends a piece of work with a commit and a push, in that order. One command for both saves a step, and keeps the suite run and the commit-message rules in front of the push.

**How to apply:** on `/commit-and-push` or `/cp`, run the automated suite, commit the working tree's changes, and push the current branch. Ask only about changes the session did not make.

Related:

- the push-pushes-the-current-branch-to-its-remote rule — the push this command ends with
- the run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the suite run before the commit

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:09:35 PM PT
