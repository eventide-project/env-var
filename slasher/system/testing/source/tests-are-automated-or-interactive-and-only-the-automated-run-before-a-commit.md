# Tests are automated or interactive, and only the automated run before a commit

**A project's tests sit under `test/`, in one of two directories**, and a project may hold either or both:

- **`test/automated/`** — tests a machine runs and a machine judges. This is the **suite** every other rule in this package means.
- **`test/interactive/`** — tests the **engineer** runs, human-in-the-loop. A person drives the run and a person judges what came back.

**Only `test/automated/` runs before a commit.** The `git` package's run-the-test-suite-after-changes-before-considering-whether-to-commit rule makes a passing suite a precondition of the commit decision, and the suite it means is the automated one.

## An interactive test is the engineer's to run

**Do not run one on your own initiative**, and do not run one as part of a suite run. Run it when the engineer asks for it.

**What makes a test interactive is that a person is part of the run.** It needs a judgment a machine cannot make, or it reaches something the project does not control — a network, a remote repository, an installer that writes outside the working tree, a rendering someone has to look at. The cost of the run is a person's attention, which is why nothing spends it automatically.

**A pre-commit gate on such a test would block a commit on something the machine cannot decide.** That is the whole reason the exclusion is stated rather than left to judgment.

## Say which tests ran

**A report of a suite run names the automated tests and does not claim more.** *The suite passes* after an automated run is true. It is also read as *the tests pass*, which is false where interactive tests exist and were not run.

**Where a project holds interactive tests, say that they were not run.** That is not an offer to run them — it is the difference between reporting what happened and overstating it. See the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule, which is what keeps such a line to a fact.

## A project may hold only one of the two

**A project with no `test/interactive/` is the ordinary case**, and nothing is missing.

**A project with no `test/automated/` is ordinary too**, and its consequence is worth stating: the pre-commit run has nothing to run. That is not a failure and is not reported as one. The commit decision is then weighed on what the project does have, and the run-the-test-suite-after-changes-before-considering-whether-to-commit rule is satisfied vacuously rather than violated.

**Slasher's own composite repository has both.** Its three interactive tests install packages from real repositories over the network and drive an installer that writes a project tree, so each is interactive. Its automated tests, such as `test/automated/startup-display.sh`, run a script on a fixed input and compare the output, with no network access and no person in the run.

**Why:** a suite is trusted in proportion to what happens when it is red. A run that sometimes needs a person, sometimes reaches a network, and sometimes cannot be judged by its exit status is a run whose failures get explained rather than fixed. Separating the two by directory keeps the automated suite mechanically true — it passes or it does not — and gives the tests that genuinely need a person a place to be, rather than being deleted for not fitting.

The engineer's attention is the scarce thing, which is the same reason the `design-by-efferent` package places it at the hinges and nowhere else. A test that spends it runs when they say so.

**How to apply:** put a test a machine runs and judges in `test/automated/`. Put a test that needs a person in `test/interactive/`.

Run `test/automated/` before weighing a commit, and run nothing from `test/interactive/` unless the engineer asks. When reporting a run, say the automated tests passed rather than that the tests passed, and say the interactive tests were not run where the project has any.

Where a project has no automated suite, run nothing and report nothing missing.

## Compressed

1. A project's tests sit under `test/`, in `test/automated/`, `test/interactive/`, or both.
2. Put a test that a machine runs and a machine judges in `test/automated/`.
3. `test/automated/` is the suite that every other rule in this package means.
4. Put a test that needs a person in `test/interactive/`. The engineer runs it, with a person in the loop.
5. In an interactive test, a person drives the run and a person judges what came back.
6. Only `test/automated/` runs before a commit. Run it before weighing a commit.
7. The suite that the `git` run-the-test-suite-after-changes-before-considering-whether-to-commit rule requires to pass is the automated one.
8. This rule applies in full in a project that does not install the `git` package.

## An interactive test is the engineer's to run

1. Do not run an interactive test on your own initiative.
2. Do not run an interactive test as part of a suite run.
3. Run an interactive test when the engineer asks for it.
4. A test is interactive when a person is part of the run.
5. A test is interactive when it needs a judgment that a machine cannot make.
6. A test is also interactive when it reaches something the project does not control.
7. Examples are a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at.
8. No pre-commit gate depends on an interactive test.

## Say which tests ran

1. A report of a suite run names the automated tests and claims nothing more.
2. Say that the automated tests passed, not that the tests passed.
3. Where a project holds interactive tests, say that they were not run.
4. That line states a fact. It is not an offer to run them.

## A project may hold only one of the two

1. A project with no `test/interactive/` is the ordinary case, and nothing is missing.
2. A project with no `test/automated/` is ordinary too.
3. In that case the pre-commit run has nothing to run, so run nothing.
4. Do not report the missing automated suite as a failure, or as anything missing.
5. Weigh the commit decision on what the project does have.
6. Run-suite-before-commit is then satisfied vacuously, not violated.

## Compression

- 2026-10-24, compressed: compression 0.38, change 0.65, solubility 26 → 70, clarity 0.28 → 0.85, 23 directives, 22 kept, 1 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 70 → 73, clarity 0.85 → 0.90; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named tests-are-automated-or-interactive and titled "`test/` holds `automated/`, `interactive/`, or both — and only the automated tests run before a commit".

From 2026-08-24 to 2026-10-10 Waytide's own composite repository had interactive tests and no automated suite, until `test/automated/startup-display.sh` became its first automated test.

Related:

- the a-test-file-named-with-a-leading-underscore-is-suspended rule — the other thing that decides what a run contains
- the `git` run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the pre-commit run this fixes the membership of. It is a citation rather than a dependency: this rule states what the directories are and who runs each, and it applies whole in a project that does not install the `git` package
- the `design-by-efferent` the-human-deliberates-the-hinges-never-the-pass-fail-bar rule — where the engineer's attention is spent, and the reason it is not spent by a machine's schedule
- the `language` an-answer-is-a-list-and-prose-must-justify-itself rule — the form the run report takes

---

Authored by Scott Bellware on Mon Aug 24 2026 at 12:59:35 PM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:25:33 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:29 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:37 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:38 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
