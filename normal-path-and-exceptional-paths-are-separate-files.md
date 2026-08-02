# A feature's normal path and its exceptional paths are separate test files

The test of a feature's **normal path** — the ordinary, non-raising course through it — and
the test of each **exceptional path** it has live in **separate files**. A feature with one
normal path and one exceptional path is two files, not one file with two contexts.

The mechanical reason is the actuation. A test file actuates the concern **once**, at the
top of the feature context, and asserts each outcome of that one actuation in its own
nested context (see the tdd-test-structure rule). An exceptional path cannot share that
actuation: the actuation is inside an `assert_raises`, it produces no result to observe,
and the outcomes of the normal-path actuation are not established when it runs. Two
actuations in one file are two arrangements sitting side by side, each inert to the other.

**Naming follows the existing file conventions.** Where a feature has a normal path and
one or more exceptional paths, the case set is larger than one, so the feature takes a
folder and each file is named for the case it distinguishes (see the
single-case-test-named-for-feature rule) — the normal-path file named for the feature, each
exceptional-path file named for the condition under which the actuation fails. The
condition is then also promoted to a `context` inside that file, with the test named
`Fails` (see the error-test-named-fails-condition-is-context rule).

**What belongs in an exceptional-path file is that one exceptional case.** The normal path
is proven in its own file and is not re-proven here. Where such a file's controls include
values that also appear on the normal path, they are there to make the failure
**discriminating** — so the raised error can be told from a different failure of the same
class — not to establish the normal path a second time.

**Why:** a file holds one arrangement and one actuation, and mixing a raising actuation
with a non-raising one puts two of each in the same file, where neither reads as the
subject. Separating them also makes a feature's failure modes findable by filename rather
than by reading each file for a nested `assert_raises`, and keeps a normal-path file from
accumulating exceptional cases at its end as conditions are added.

**How to apply:** when a feature has both a normal path and an exceptional path, give the
feature a folder and write each in its own file — the normal path named for the feature,
each exceptional path named for its condition. Keep the normal path's proof in its own
file. Do not add a second, raising actuation to a normal-path file. Related: the
tdd-test-structure rule (actuate once at the top), the single-case-test-named-for-feature
rule (when a folder is warranted and how files are named), the
error-test-named-fails-condition-is-context rule (the condition context and the `Fails`
name), the context-only-for-local-instrumentation rule, and the `language` package's
vocabulary, where the **normal path** term and its exceptional-case counterpart are
settled.

---

Authored by Scott Bellware on Thu Jul 30 2026 at 4:53:20 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 5:04:19 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 3:23:44 PM PT
