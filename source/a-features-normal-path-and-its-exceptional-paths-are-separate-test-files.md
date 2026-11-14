# A feature's normal path and its exceptional paths are separate test files

**Trigger:** When creating or editing a file under `test/`

A feature's **normal path** is the ordinary, non-raising course through it. Its test and the test of each **exceptional path** live in **separate files**. A feature with one normal path and one exceptional path is two files, not one file with two contexts.

The mechanical reason is the actuation. A test file actuates the concern **once**, at the top of the feature context. It asserts each outcome of that one actuation in its own nested context. See the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule.

An exceptional path cannot share that actuation. The actuation is inside an `assert_raises` and produces no result to observe. The outcomes of the normal-path actuation are not established when it runs. Two actuations in one file are two sets of controls sitting side by side, each inert to the other.

**Naming follows the existing file conventions.** Where a feature has a normal path and one or more exceptional paths, the case set is larger than one. So the feature takes a folder, and each file is named for the case it distinguishes — see the a-feature-with-one-case-has-one-test-file-named-for-the-feature rule. The normal-path file is named for the feature, and each exceptional-path file for the condition under which the actuation fails. The condition is then also promoted to a `context` inside that file, with the test named `Fails` (see the an-error-test-is-named-fails-and-its-condition-is-a-context rule).

**What belongs in an exceptional-path file is that one exceptional case.** The normal path is proven in its own file and is not re-proven here. Where such a file's controls include values that also appear on the normal path, they are there to make the failure **discriminating**. So the raised error can be told from a different failure of the same class — not to establish the normal path a second time.

**Why:** a file holds one set of controls and one actuation. Mixing a raising actuation with a non-raising one puts two of each in the same file, where neither reads as the subject. Separating them also makes a feature's failure modes findable by filename, rather than by reading each file for a nested `assert_raises`. It keeps a normal-path file from accumulating exceptional cases at its end as conditions are added.

**How to apply:** when a feature has a normal path and an exceptional path, give the feature a folder. Write each in its own file. The normal path named for the feature, each exceptional path named for its condition. Keep the normal path's proof in its own file. Do not add a second, raising actuation to a normal-path file.

## Compressed

1. A feature's normal path is its ordinary, non-raising course through it.
2. The normal path's test and each exceptional path's test live in separate files.
3. A feature with one normal path and one exceptional path is two files. It is not one file with two contexts.
4. An exceptional path cannot share the normal path's actuation. Its actuation is inside an `assert_raises` and produces no result to observe.
5. Naming follows the existing file conventions.
6. The normal-path file is named for the feature.
7. Each exceptional-path file is named for the condition under which the actuation fails.
8. That condition is also promoted to a `context` inside the exceptional-path file.
9. The test in that context is named `Fails`. See the an-error-test-is-named-fails-and-its-condition-is-a-context rule.
10. An exceptional-path file holds only its one exceptional case.
11. An exceptional-path file does not re-prove the normal path.
12. Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating.
13. Discriminating means the raised error can be told from a different failure of the same class.
14. Do not add a second, raising actuation to a normal-path file.

## Compression

- 2026-10-24, compressed: compression 0.28, change 0.57, solubility 61 → 77, clarity 0.63 → 0.78, 18 directives, 18 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 77 → 72, clarity 0.78 → 0.74; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When writing a test for a feature's exceptional (raising) path*, which was not a safe one.

Until Sun Oct 25 2026 this rule was named normal-path-and-exceptional-paths-are-separate-files.

Related:

- the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule — actuate once at the top
- the a-feature-with-one-case-has-one-test-file-named-for-the-feature rule — when a folder is warranted and how files are named
- the an-error-test-is-named-fails-and-its-condition-is-a-context rule — the condition context and the `Fails` name
- the a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables rule
- the `language` package's vocabulary
- where the **normal path** term and its exceptional-case counterpart are settled

---

Authored by Scott Bellware on Thu Jul 30 2026 at 4:53:20 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 5:04:19 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 3:23:44 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:08:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:48:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:40 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:45 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:01 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:06 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:11:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:08 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
