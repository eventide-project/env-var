# Announce a branch switch in a bordered block

When the agent switches branches, it prints this block. The block has a border above and below,
made of `=` characters:

```
========================================
BRANCH SWITCHED

  from    master
  to      experiment/ste-spec
  reason  the vocabulary comparison is
          recorded on this branch
========================================
```

**Print it on every switch.** Print it when the engineer asked for the switch. Print it when the
agent switched to reach a file. Print it when the switch returns to a branch the session started
on.

## The three fields

1. **from** — the branch the working tree was on.
2. **to** — the branch the working tree is on now.
3. **reason** — why the agent switched. One line, or two.

**The reason is a field because a switch is rarely the goal.** The agent switches to reach a file,
to commit in the right place, or to return after doing so. A reader who sees the two names knows
what happened. A reader who sees the reason knows whether it was right.

## Why an announcement, and why this one

**A branch switch changes what every path in the repository means.** The same filename holds
different content. A file present on one branch is absent on another. Work committed after a
switch lands somewhere the engineer did not choose.

**The failure this answers is a silent switch.** The agent switches, works, and reports the work.
The report is accurate and says nothing about where the work went. The engineer finds out when a
file is missing from the branch they expected it on.

**The border is the requirement, not the decoration.** Ordinary output scrolls. A bordered block
does not read as another line of a report. Any unmissable form satisfies this rule. `=` characters
above and below are the settled one.

## What this does not cover

- **Creating a branch** is a switch when the working tree moves to it. `git switch -c` prints the
  block, with `from` naming the base.
- **A worktree** adds a working directory rather than moving this one. No switch occurs here, so
  no block is printed. The implementation-lifecycle rule governs that case.
- **A merge, a commit, or a push** does not move the working tree. No block.

**Why:** an agent reports what it did, and not where it stood. So a branch switch is the one operation whose effect is invisible in every later report. The engineer's own record of this session is the case. The agent switched to a parent experiment branch to edit a file, and stayed there after committing. The next instruction was read against a branch neither party had named. A
block that cannot be scrolled past removes the class of error rather than one instance of it.

**How to apply:** print the block on every branch switch, before reporting anything else about the
work. Fill all three fields. Keep the reason to what the switch was for, not what the work is.
Print no block for a worktree, a merge, or a commit.

Related:

- the `foundation` implementation-lifecycle rule — which require the working tree to end on the upstream branch, and which the block makes checkable
- the run-suite-before-commit rule — the other thing confirmed before work is recorded

---

Authored by Scott Bellware on Sat Aug 8 2026 at 12:23:07 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
