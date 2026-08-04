# The implementation hinge offers two candidates: the working implementation, or the red/green/refactor cycle

At the **implementation hinge** — the fourth of the five — the agent puts two candidates to
the developer:

1. **A working implementation** — the code that satisfies the test, written directly.
2. **An implementation that lets the test fail**, and then the complete **red, green, refactor**
   cycle.

Both answer the hinge's question. The hinge asks *how does this implementation come about*, and
these are two ways of arriving at the same place — one directly, one through the cycle. That is
what makes the second a genuine **candidate** rather than a sequencing step: a developer may
prefer it, and preferring it is a design judgment about this unit rather than a procedure
applied to every one.

**This is where the choice is made, and the only place.** A red is not offered at a separate
hinge preceding the implementation. One gate asks, so a developer who declines is not asked
again by another mechanism.

**The containment constraint governs the red, unchanged.** A deliberate red is permitted **only
where its cause reaches no other stable test** — no existing, passing test may fail because of
it. A red whose cause breaks working tests is breakage, not a driven test, and choosing the
cycle at a gate does not make it otherwise. Before writing a deliberate red, know that its
failure is local to the new test; run the full suite after it, and if a stable test failed, back
it out and reach a passing implementation directly.

**The cycle is for the first implementation of a unit** — new behavior being designed. It is not
available when **covering** behavior that already exists: there is no red to manufacture there
without breaking working code, which the tdd-designs-coverage-protects rule forbids outright,
and the implementation hinge is degenerate in that case (see the
hinges-gate-the-design-of-a-test-including-coverage rule). So the second candidate is offered
only where it is actually available, rather than being offered and then refused.

**Choosing the cycle is not performing choreography.** The dbe-as-design-tool rule opens by
rejecting red-green-refactor **as choreography** — as ritual performed because the form calls
for it, with a pre-implementation failure treated as a checkpoint that teaches nothing. What
that rejects is the **unchosen** case. A developer selecting the cycle at a gate, for this unit,
has made a design judgment, which is the opposite of ceremony: the loop stopped, a person
weighed two real alternatives, and the choice was theirs. The rule and this one do not conflict,
and dbe-as-design-tool says so in its own words.

**Refactor is part of the cycle, and is why it is worth choosing.** Red proves the test
discriminates; green makes it pass; **refactor is where the design is actually improved**, with
the test holding the behavior still. A cycle offered without it would be the half that
dbe-as-design-tool calls a ritual — motion with no design in it.

**The second candidate is real, which is what the two-option floor requires.** The
present-every-prompt rule forbids manufacturing cosmetic options to reach two, and the
implementation hinge frequently has one obvious implementation, which makes it the hinge most
tempted to pad. This candidate is not padding: it is a different way of producing the
implementation, chosen for reasons that apply to some units and not others. But it does not
excuse the search — where a hinge has a real second implementation, that is the option to
surface, and the cycle is not a substitute for looking.

**Why:** whether to drive a unit's implementation through a failing test is a judgment about
that unit — how confident the design is, whether the test's discrimination is in doubt, whether
the shape wants working out under a red. It is subtle, in that it cannot be read off the code,
and load-bearing, in that the implementation follows from it. That is a hinge's definition, and
it belongs at the hinge where the implementation is decided rather than as a procedure attached
to every one. Offering it as one of two candidates puts the developer in the position the gates
exist to create — comparing real alternatives — rather than ratifying a single proposal.

**How to apply:** at the implementation hinge for a unit's **first** implementation, offer both
candidates through the selection UI: the working implementation, and the red/green/refactor
cycle. Where the cycle is chosen, write the red only if its cause reaches no stable test, run
the suite, then green, then refactor. Do not offer the cycle when covering behavior that already
exists. Do not present a failing implementation as an option merely to reach the two-option
floor. Related: the hinge-cycle rule (the five hinges, of which this is the fourth), the
dbe-as-design-tool rule (which rejects the cycle as choreography, not as a choice), the
present-every-prompt rule (the two-option floor this must not be used to satisfy), the
tdd-designs-coverage-protects-never-break-implementation and
hinges-gate-the-design-of-a-test-including-coverage rules (the coverage case where the cycle is
unavailable), and the no-green-on-arrival-tests rule (the no-op implementation hinge, where
there is nothing to drive).

---

Authored by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
