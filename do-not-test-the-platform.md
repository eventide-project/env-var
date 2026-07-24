# Don't test the platform — a transparent pass-through has nothing of ours to pin

Test the library's **own** behavior and decisions, not the language or framework it
sits on. When a unit is a **transparent pass-through** to a platform primitive — it
adds no branch, guard, normalization, or policy of its own on that path, just forwards
to the primitive — then its behavior on that path **is** the platform's, and a test
there tests the platform, not the library.

**The signal.** If you can only state the expected behavior in terms of the underlying
primitive's guarantee ("`String#empty?` returns true for an empty string"), and the unit
contributes nothing of its own on that path, there is nothing of *ours* to protect — so
write no test.

**Worked example.** `Upload#empty?(file)` is `file.empty?` — it forwards to the string
primitive, adding no branch, guard, or normalization of its own. Its **emptiness**
behavior is therefore `String#empty?`'s — true for `""`, false for any other content —
verbatim (proven identical to a bare `file.empty?` and to a literal `"".empty?`
evaluation). Having *decided* that `#empty?` stays transparent to Ruby
(imposes no policy), there is no library emptiness behavior; an "empty string is empty"
test would merely assert that `String#empty?` returns true — i.e. test Ruby. So: no test. The
resolution is the *decision* (transparent), not a test.

**The contrast — what IS ours.** The moment a unit adds a policy, that policy is the
library's and must be tested, because it is a **decision**, not the platform's behavior:
`Upload#call`'s guard that raises `Upload::Error` on an empty file (`raise Error, "File
is empty" if file.empty?`), a coercion that normalizes the file, a suppressed warning.
Those are protected; the bare `file.empty?` forwarding underneath them is not.

**Why:** tests exist to protect the library's design and decisions. Testing the platform
adds noise, couples the suite to language internals, and gives false confidence that
"we" are covered when nothing of ours ran. Related: the "TDD designs, coverage protects"
rule and the assert-error-message-only-as-sole-discriminator rule (both are about testing
what actually discriminates *our* behavior).

---

Authored by Scott Bellware on Fri Jul 3 2026 at 11 AM PT
