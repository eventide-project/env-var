# Tests are automated or interactive, and only the automated run before a commit

Source: system/testing/source/tests-are-automated-or-interactive-and-only-the-automated-run-before-a-commit.md

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
