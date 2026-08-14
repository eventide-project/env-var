# Drop an outcome whose test is green-on-arrival — it drives no design

In DBE, a test justifies itself by **driving** an implementation that did not exist. The failing test is what brings the behavior into being. An outcome whose test passes the moment it is written drives nothing. That is "green-on-arrival". The behavior already exists, so the test only *confirms* an affordance rather than *designing* one. Drop it.

**The tell is a no-op implementation hinge.** In the hinge cycle, the implementation hinge may degenerate to "nothing to write — the existing code already satisfies this". The outcome is then not a genuine design step. That degeneration is the signal to drop the outcome, not to add a confirming test.

**Why:** DBE is a design tool, not a coverage tool (see the DBE-as-design-tool and human-in-the-loop rules: *exit on solubility, not coverage*). A green-on-arrival test designs nothing and dilutes the suite's signal — it reads as a driven outcome when it isn't. Such a test usually appears because the implementation ran **ahead** of its driving test. The cause is a default value, a conveyed keyword, or a prevention written incidentally while satisfying an earlier outcome. So the behavior was already present when its "own" outcome came up. The discipline is to notice that and not manufacture a test to cover it after the fact.

**How to apply:** an outcome's implementation hinge may be a no-op, meaning the test would be green-on-arrival. Drop the outcome rather than keeping the confirming test. The behavior may genuinely need locking to prevent a public-contract regression. That is a deliberate, separate decision the human makes. It is not the default, and it is not a DBE design step.

**This is a design concern and does not reach coverage.** The activity may be preventing a regression in existing behavior rather than designing new behavior. Green-on-arrival is then inevitable and correct. See the "TDD designs, coverage prevents" rule.

Related:

- the DBE-as-design-tool rule
- the human-in-the-loop rule — exit on solubility
- the one-outcome-at-a-time rule
- the hinge-cycle rule — the implementation hinge
- the testing package's vocabulary — verified, not green

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:43:08 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
