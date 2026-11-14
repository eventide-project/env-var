# `/push` pushes the current branch to its remote

**Trigger:** When the engineer types `/push` or `/p`

1. `/push` pushes the branch the working tree is on to its upstream branch on the remote. `/p` is its alias, and does exactly what it does.
2. Typing `/push` is the engineer's request for the push. Do not ask again whether to push.
3. Push only the current branch. Push no other branch and no tag.
4. Where the branch has no upstream branch, push it to `origin` under its own name, and set that as its upstream. Say that the branch is now on the remote.
5. Where the repository has no remote, say so, and push nothing.
6. Where there is nothing to push, say so, and push nothing.
7. Push committed work only. Commit nothing before the push. Where the working tree holds uncommitted changes, say that they are not pushed.

## A refused push

1. Never force a push. A force-push is made only where another rule calls for it and the engineer selects it.
2. Where the remote refuses the push, as when it holds commits the branch does not, say so, and stop.
3. Do not pull, merge, or rebase to make the push go through. Say what the remote holds that the branch does not, and wait for the engineer.

## The report

1. Report the push in one line: the branch, the remote, and the range of commits pushed, as `master` pushed to `origin`, `599bae8b..e3ab6817`.

**Why:** the engineer asks for a push many times a day, and the word *push* is a request the agent can read wrongly: which branch, whether to force, whether to pull first. One command with one meaning removes the doubt, and the shortcut makes it quick to type. A push publishes work to every reader of the remote, so the command does only what it says, and a refused push stops rather than being made to go through.

**How to apply:** when the engineer types `/push` or `/p`, push the current branch to its upstream, set one where there is none, never force, and report the result in one line.

Related:

- the run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the commit that comes before a push
- the announce-a-branch-switch-in-a-bordered-block rule — the other branch operation this package governs

---

Authored by Scott Bellware on Thu Nov 12 2026 at 11:25:24 PM PT
