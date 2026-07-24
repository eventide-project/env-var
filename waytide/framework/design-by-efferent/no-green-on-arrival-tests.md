# Drop an outcome whose test is green-on-arrival — it drives no design

In DBE, a test earns its place by **driving** an implementation that did not exist — the failing test is what brings the behavior into being. An outcome whose test passes the moment it is written ("green-on-arrival") drives nothing: the behavior already exists, so the test only *confirms* an affordance rather than *designing* one. Drop it.

**The tell is a no-op implementation hinge.** In the hinge cycle, if the implementation hinge degenerates to "nothing to write — the existing code already satisfies this," the outcome is not a genuine design step. That degeneration is the signal to drop the outcome, not to add a confirming test.

**Why:** DBE is a design tool, not a coverage tool (see the DBE-as-design-tool and human-in-the-loop rules: *exit on solubility, not coverage*). A green-on-arrival test designs nothing and dilutes the suite's signal — it reads as a driven outcome when it isn't. Such a test usually appears because the implementation ran **ahead** of its driving test (a default value, a conveyed keyword, a protection written incidentally while satisfying an earlier outcome), so the behavior was already present when its "own" outcome came up. The discipline is to notice that and not manufacture a test to cover it after the fact.

**How to apply:** When an outcome's implementation hinge is a no-op (the test would be green-on-arrival), drop the outcome rather than keeping the confirming test. If the behavior genuinely needs locking as a public-contract regression protection, that is a deliberate, separate decision the human makes — it is not the default, and it is not a DBE design step. **This is a design concern and does not reach coverage:** when the activity is protecting existing behavior rather than designing new behavior, green-on-arrival is inevitable and correct — see the "TDD designs, coverage protects" rule. Related: the DBE-as-design-tool rule, the human-in-the-loop rule (exit on solubility), the one-outcome-at-a-time rule, the hinge-cycle rule (the implementation hinge), and the testing package's vocabulary (verified, not green).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
