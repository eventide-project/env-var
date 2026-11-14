# Assert error-message content only when it is the sole way to confirm the correct error

Assert an error's **message content** only in one case. That is where the message is the **only** way for the test to determine that the **correct error was raised under the expected conditions**. Otherwise, do not assert the message.

In the ordinary case, `assert_raises(SomeClass)` plus the test's condition setup already determines that the right error was raised. The class identifies the failure, and the actuation's setup fixes the condition. A message assertion there tests **presentation** (the wording), not **behavior** — and couples the test to the exact string, so a harmless reword breaks it.

**The one situation where the message is the sole discriminator:** the **same error class is raised from multiple sites reachable in the same execution path.** Then the class alone cannot tell you *which* site raised. The error may have come from the intended condition, or from an incidental one earlier or elsewhere in the path. Only the message distinguishes them.

**How to apply.** For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*

- **No → class + condition suffice. Assert no message.** The empty-file guard's lone `Upload::Error` (one `raise` site on the empty-file path). A response check that always raises from a single line — the class and the condition already pin it.
- **Yes → the message is the discriminator. Assert it (exact content).** A multi-part `Upload#call` posts each part in turn, so `Upload::Error` can be raised at the **head** part (an earlier part the server rejects) *or* the **tail** part (the final rejected part) — same class, different sites in one execution. The message (which part, which response) is what confirms the failure is the intended one. Likewise a two-step upload: the same `Upload::Error` can come from the initial post's "rejected" site *or* the finalize step's "rejected" site — only the message tells them apart.

**Why:** this keeps error tests about error *correctness* (was the right failure raised under the right condition), not error *presentation*. It makes a precise, testable criterion of the line that library-specific error classes are "self-evidently the right failure and need no message".

Related:

- the tdd-designs-coverage-prevents-never-break-implementation rule, and the prevent substitution — in this package's vocabulary
