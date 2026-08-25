# `test/` holds `automated/`, `interactive/`, or both — and only the automated tests run before a commit

**A project's tests sit under `test/`, in one of two directories**, and a project may hold either or both:

- **`test/automated/`** — tests a machine runs and a machine judges. This is the **suite** every other rule in this package means.
- **`test/interactive/`** — tests the **engineer** runs, human-in-the-loop. A person drives the run and a person judges what came back.

**Only `test/automated/` runs before a commit.** The `git` package's run-suite-before-commit rule makes a passing suite a precondition of the commit decision, and the suite it means is the automated one.

## An interactive test is the engineer's to run

**Do not run one on your own initiative**, and do not run one as part of a suite run. Run it when the engineer asks for it.

**What makes a test interactive is that a person is part of the run.** It needs a judgment a machine cannot make, or it reaches something the project does not control — a network, a remote repository, an installer that writes outside the working tree, a rendering someone has to look at. The cost of the run is a person's attention, which is why nothing spends it automatically.

**A pre-commit gate on such a test would block a commit on something the machine cannot decide.** That is the whole reason the exclusion is stated rather than left to judgment.

## Say which tests ran

**A report of a suite run names the automated tests and does not claim more.** *The suite passes* after an automated run is true. It is also read as *the tests pass*, which is false where interactive tests exist and were not run.

**Where a project holds interactive tests, say that they were not run.** That is not an offer to run them — it is the difference between reporting what happened and overstating it. See the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule, which is what keeps such a line to a fact.

## A project may hold only one of the two

**A project with no `test/interactive/` is the ordinary case**, and nothing is missing.

**A project with no `test/automated/` is ordinary too**, and its consequence is worth stating: the pre-commit run has nothing to run. That is not a failure and is not reported as one. The commit decision is then weighed on what the project does have, and run-suite-before-commit is satisfied vacuously rather than violated.

**Waytide's own composite repository is in that second state** as of 2026-08-24. Its three tests install packages from real repositories over the network and drive an installer that writes a project tree, so each is interactive. It has no automated suite at all.

**Why:** a suite is trusted in proportion to what happens when it is red. A run that sometimes needs a person, sometimes reaches a network, and sometimes cannot be judged by its exit status is a run whose failures get explained rather than fixed. Separating the two by directory keeps the automated suite mechanically true — it passes or it does not — and gives the tests that genuinely need a person a place to be, rather than being deleted for not fitting.

The engineer's attention is the scarce thing, which is the same reason the `design-by-efferent` package places it at the hinges and nowhere else. A test that spends it runs when they say so.

**How to apply:** put a test a machine runs and judges in `test/automated/`. Put a test that needs a person in `test/interactive/`.

Run `test/automated/` before weighing a commit, and run nothing from `test/interactive/` unless the engineer asks. When reporting a run, say the automated tests passed rather than that the tests passed, and say the interactive tests were not run where the project has any.

Where a project has no automated suite, run nothing and report nothing missing.

Related:

- the a-suspended-test-file-is-named-with-a-leading-underscore rule — the other thing that decides what a run contains
- the `git` run-suite-before-commit rule — the pre-commit run this fixes the membership of. It is a citation rather than a dependency: this rule states what the directories are and who runs each, and it applies whole in a project that does not install the `git` package
- the `design-by-efferent` dbe-human-in-the-loop rule — where the engineer's attention is spent, and the reason it is not spent by a machine's schedule
- the `language` an-answer-is-a-list-and-prose-must-justify-itself rule — the form the run report takes

---

Authored by Scott Bellware on Mon Aug 24 2026 at 12:59:35 PM PT
