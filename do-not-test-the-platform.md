# Don't test the platform — a transparent pass-through has nothing of ours to pin

Test the library's **own** behavior and decisions, not the language or system it sits on. When a unit is a **transparent pass-through** to a platform primitive. It may add no branch, guard, normalization, or policy of its own on that path, and just forward to the primitive. Then its behavior on that path **is** the platform's. A test there tests the platform, not the library.

**The signal.** If you can only state the expected behavior in terms of the underlying primitive's guarantee ("`String#empty?` returns true for an empty string"). The unit contributes nothing of its own on that path, there is nothing of *ours* at risk — so write no test.

**Worked example.** `Upload#empty?(file)` is `file.empty?` — it forwards to the string primitive, adding no branch, guard, or normalization of its own. Its **emptiness** behavior is therefore `String#empty?`'s, verbatim — true for `""`, and false for any other content. It is proven identical to a bare `file.empty?` and to a literal `"".empty?` evaluation.

Having *decided* that `#empty?` stays transparent to Ruby (imposes no policy), there is no library emptiness behavior. An "empty string is empty" test would merely assert that `String#empty?` returns true — i.e. test Ruby. So: no test. The resolution is the *decision* (transparent), not a test.

**The contrast — what IS ours.** The moment a unit adds a policy, that policy is the library's. It must be tested. It is a **decision** rather than the platform's behavior.

`Upload#call`'s guard raises `Upload::Error` on an empty file — `raise Error, "File is empty" if file.empty?`. So does a coercion that normalizes the file, and a suppressed warning. Those have their regressions prevented. The bare `file.empty?` forwarding underneath them is not.

**Why:** tests exist to prevent a regression in the library's design and decisions. Testing the platform adds noise, couples the suite to language internals, and gives false confidence that "we" are covered when nothing of ours ran.

Related:

- the "TDD designs
- coverage prevents" rule and the assert-error-message-only-as-sole-discriminator rule — each is about testing what actually discriminates *our* behavior

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
