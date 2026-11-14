# Do not test the platform

**Trigger:** When creating or editing a file under `test/`

Test the library's **own** behavior and decisions, not the language or system it sits on. When a unit is a **transparent pass-through** to a platform primitive. It may add no branch, guard, normalization, or policy of its own on that path, and just forward to the primitive. Then its behavior on that path **is** the platform's. A test there tests the platform, not the library.

**The signal.** If you can only state the expected behavior in terms of the underlying primitive's guarantee ("`String#empty?` returns true for an empty string"). The unit contributes nothing of its own on that path, there is nothing of *ours* at risk — so write no test.

**Worked example.** `Upload#empty?(file)` is `file.empty?` — it forwards to the string primitive, adding no branch, guard, or normalization of its own. Its **emptiness** behavior is therefore `String#empty?`'s, verbatim — true for `""`, and false for any other content. It is proven identical to a bare `file.empty?` and to a literal `"".empty?` evaluation.

Having *decided* that `#empty?` stays transparent to Ruby (imposes no policy), there is no library emptiness behavior. An "empty string is empty" test would merely assert that `String#empty?` returns true — i.e. test Ruby. So: no test. The resolution is the *decision* (transparent), not a test.

**The contrast — what IS ours.** The moment a unit adds a policy, that policy is the library's. It must be tested. It is a **decision** rather than the platform's behavior.

`Upload#call`'s guard raises `Upload::Error` on an empty file — `raise Error, "File is empty" if file.empty?`. So does a coercion that normalizes the file, and a suppressed warning. Those have their regressions prevented. The bare `file.empty?` forwarding underneath them is not.

**Why:** tests exist to prevent a regression in the library's design and decisions. Testing the platform adds noise, couples the suite to language internals, and gives false confidence that "we" are covered when nothing of ours ran.

## Compressed

1. Test the library's own behavior and decisions, not the language or system it sits on.
2. A unit is a transparent pass-through on a path only when it just forwards to a platform primitive. It adds no branch, guard, normalization, or policy there.
3. On such a path, the unit's behavior is the platform's, so a test there tests the platform, not the library.
4. The signal: you can state the expected behavior only through the primitive's guarantee ("`String#empty?` returns true for an empty string").
5. When that signal holds and the unit adds nothing of its own on that path, nothing of ours is at risk, so write no test.
6. Example: `Upload#empty?(file)` is `file.empty?`, which forwards to the string primitive and adds no branch, guard, or normalization.
7. Its emptiness behavior is therefore `String#empty?`'s exactly: true for `""` and false for any other content.
8. Once `#empty?` has been decided to stay transparent to Ruby, there is no library emptiness behavior. An "empty string is empty" test would only test Ruby.
9. When a unit has been decided to stay transparent to the platform, the resolution is that decision, not a test.
10. When a unit adds a policy, that policy is the library's own decision, and it must be tested.
11. Example policies that must be tested: `Upload#call`'s guard `raise Error, "File is empty" if file.empty?`, which raises `Upload::Error` on an empty file. Others are a coercion that normalizes the file, and a suppressed warning.
12. Do not test the bare forwarding to the primitive underneath a tested policy, such as the `file.empty?` beneath those policies.

## Compression

- 2026-10-24, compressed: compression 0.14, change 0.44, solubility 73 → 67, clarity 0.70 → 0.51, 6 directives, 6 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-24, revised: sentences over 25 words split, solubility 67 → 75, clarity 0.51 → 0.70; checked: 6 directives, 4 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-27, re-checked: 6 directives, 6 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 75 → 77, clarity 0.70 → 0.71; checked: 6 directives, 6 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was titled "Don't test the platform — a transparent pass-through has nothing of ours to pin".

Related:

- the tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation rule and the assert-an-error-message-only-when-it-alone-confirms-the-error rule — each is about testing what actually discriminates *our* behavior

---

Authored by Scott Bellware on Fri Jul 3 2026 at 11 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:39:25 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:46:46 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:35 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
