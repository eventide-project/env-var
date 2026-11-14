# Announce a branch switch in a bordered block

**Trigger:** When switching the working tree to another branch (including `git switch -c`), or when the branch-switch hook reports a switch

When the agent switches branches, it prints this block. The block has a border above and below, made of `=` characters:

```
========================================
BRANCH SWITCHED

  from    master
  to      experiment/ste-spec
  reason  the vocabulary comparison is
          recorded on this branch
========================================
```

**Print it on every switch.** Print it when the engineer asked for the switch. Print it when the agent switched to reach a file. Print it when the switch returns to a branch the session started on.

## The hook reports the switch

**A hook reports each switch a shell command makes.** The Slasher plugin runs the git package's `branch-switch.sh` before and after each shell command. Where the branch changed, it tells the agent the two branches, and tells it to print the block. **Print the block at once when the hook reports a switch.** The hook cannot know why the switch was made, so the agent fills the reason.

**Print the block for a switch the hook does not report, too.** A switch made by a tool other than the shell is one. The hook makes the announcement reliable, and the announcement stays the agent's.

**The hook exists because an on-demand rule depends on the agent loading it before the act.** An agent that switched without loading this rule printed nothing, and nothing showed the engineer that the branch had changed.

## The three fields

1. **from** — the branch the working tree was on.
2. **to** — the branch the working tree is on now.
3. **reason** — why the agent switched. One line, or two.

**The reason is a field because a switch is rarely the goal.** The agent switches to reach a file, to commit in the right place, or to return after doing so. A reader who sees the two names knows what happened. A reader who sees the reason knows whether it was right.

## Why an announcement, and why this one

**A branch switch changes what every path in the repository means.** The same filename holds different content. A file present on one branch is absent on another. Work committed after a switch lands somewhere the engineer did not choose.

**The failure this answers is a silent switch.** The agent switches, works, and reports the work. The report is accurate and says nothing about where the work went. The engineer finds out when a file is missing from the branch they expected it on.

**The border is the requirement, not the decoration.** Ordinary output scrolls. A bordered block does not read as another line of a report. Only `=` characters above and below satisfy this rule.

## What this does not cover

- **Creating a branch** is a switch when the working tree moves to it. `git switch -c` prints the block, with `from` naming the base.
- **A worktree** adds a working directory rather than moving this one. No switch occurs here, so no block is printed. The an-implementation-runs-on-a-branch-to-a-declared-end rule governs that case.
- **A merge, a commit, or a push** does not move the working tree. No block.

**Why:** an agent reports what it did, and not where it stood. So a branch switch is the one operation whose effect is invisible in every later report. The engineer's own record of this session is the case. The agent switched to a parent experiment branch to edit a file, and stayed there after committing. The next instruction was read against a branch neither party had named. A block that cannot be scrolled past removes the class of error rather than one instance of it.

**How to apply:** print the block on every branch switch, before reporting anything else about the work. Fill all three fields. Keep the reason to what the switch was for, not what the work is. Print no block for a worktree, a merge, a commit, or a push.

## History

Until Fri Nov 6 2026 nothing reported a switch, and the block depended on the agent loading this rule before it switched.

Until 2026-10-23 the rule said that any unmissable form satisfied it, with `=` characters above and below the settled one.

## Compressed

1. When the agent switches branches, it prints this block.
2. The block has a border of `=` characters above and below:

```
========================================
BRANCH SWITCHED

  from    master
  to      experiment/ste-spec
  reason  the vocabulary comparison is
          recorded on this branch
========================================
```

3. Print it on every switch.
4. Print it when the engineer asked for the switch.
5. Print it when the switch was made to reach a file.
6. Print it when the switch goes back to the branch the session started on.
7. Print it before reporting anything else about the work.

## The hook reports the switch

1. The Slasher plugin runs the git package's `branch-switch.sh` before and after each shell command. Where the branch changed, it tells the agent the two branches, and tells it to print the block.
2. When the hook reports a switch, print the block at once.
3. Fill the reason yourself. The hook cannot know it.
4. Print the block for a switch the hook does not report, too.

## The three fields

1. **from** is the branch the working tree was on.
2. **to** is the branch the working tree is on now.
3. **reason** is why the agent switched, in one line or two.
4. Fill all three fields.
5. The reason states what the switch was for, not what the work is.
6. The border is the requirement, not decoration.
7. Only `=` characters above and below satisfy this rule.

## What this does not cover

1. Creating a branch is a switch when the working tree moves to it.
2. `git switch -c` prints the block, with `from` naming the base.
3. A worktree adds a working directory rather than moving this one.
4. Print no block for a worktree.
5. The an-implementation-runs-on-a-branch-to-a-declared-end rule governs the worktree case.
6. A merge, a commit, or a push does not move the working tree.
7. Print no block for a merge, a commit, or a push.

## Compression

- 2026-10-22, compressed: compression 0.46, change 0.62, solubility 65 → 80, clarity 0.74 → 0.75, 20 directives, 19 kept, 1 less precise, 0 lost
- 2026-10-23, revised: the `=` border required, and a push named among the cases that print no block; not checked
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 80 → 84, clarity 0.75 → 0.86; checked: 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the hook reports the switch; checked: 25 directives, 23 kept, 2 less precise, 0 lost, 1 repair, the hook's script and its instruction to print named; re-checked: 25 directives, 25 kept, 0 less precise, 0 lost

Related:

- the `foundation` an-implementation-runs-on-a-branch-to-a-declared-end rule — which require the working tree to end on the upstream branch, and which the block makes checkable
- the run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the other thing confirmed before work is recorded
- the `foundation` the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin that carries the hook

---

Authored by Scott Bellware on Sat Aug 8 2026 at 12:23:07 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:14 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 2:12:54 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 2:13:21 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:11 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:53:55 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
