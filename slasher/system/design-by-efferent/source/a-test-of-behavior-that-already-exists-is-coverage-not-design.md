# A test of behavior that already exists is coverage, not design

**Trigger:** When the test at an implementation hinge passes before any code is written

In DBE, a test justifies itself by **driving** an implementation that did not exist. The failing test is what brings the behavior into being. A test that passes the first time it runs, because the behavior already exists, is **uncontested**: no implementation is written to meet it, and it drives nothing. It *confirms* the behavior rather than *designing* it. **Such a test is coverage, not a DBE design step.**

**Coverage has value, and it is a concern of testing rather than of DBE.** A test of existing behavior prevents a regression in it, which is worth having. It is not part of the design loop, and DBE does not take it as an outcome. Adding it is a decision about coverage, made on its own. See the "TDD designs, coverage prevents" rule.

**The tell is a no-op implementation hinge.** In the hinge cycle, the implementation hinge may degenerate to "nothing to write — the existing code already satisfies this". The outcome is then not a genuine design step. The loop moves on to the next outcome rather than writing a test to confirm this one.

**The agent may suggest an increase to coverage.** Where the loop passes over such an outcome, the agent may put its test to the engineer as coverage, to accept or decline. It is offered as coverage, not as a design step.

**Why:** DBE is a design tool, not a coverage tool (see the DBE-as-design-tool and human-in-the-loop rules: *exit on solubility, not coverage*). An uncontested test, taken as a design step, reads as a driven outcome when it isn't. Such a test usually appears because the implementation ran **ahead** of its driving test. The cause is a default value, a conveyed keyword, or a prevention written incidentally while satisfying an earlier outcome. So the behavior was already present when its "own" outcome came up. The discipline is to notice that, and not take a confirming test as design.

**How to apply:** an outcome's implementation hinge may be a no-op, meaning its test would be uncontested. Do not take it as a design step, and move to the next outcome. The agent may suggest the test as an increase to coverage. Adding it is the engineer's decision, and a decision about coverage rather than a DBE design step.

**When the work is adding coverage, an uncontested test is expected and correct.** The activity is preventing a regression in existing behavior rather than designing new behavior. See the "TDD designs, coverage prevents" rule.

## Compressed

1. A test justifies itself in DBE by driving an implementation that did not exist.
2. DBE does not take an uncontested test as an outcome, and it is not part of the design loop.
3. The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this".
4. At a no-op implementation hinge, do not take the outcome as a design step. Move to the next outcome, rather than writing a test to confirm this one.
5. Behavior may already be present when its own outcome comes up. It may have come from a default value, a conveyed keyword, or a prevention written incidentally. Notice that the implementation ran ahead of its test, and do not take a confirming test as design.
6. Adding a test of existing behavior is a decision about coverage, and it is the engineer's.
7. The agent may suggest the test to the engineer as an increase to coverage, to accept or decline.

## Compression

- 2026-10-24, compressed: compression 0.22, change 0.64, solubility 68 → 81, clarity 0.58 → 0.75, 6 directives, 6 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, re-checked: 10 directives, 7 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-27, revised: *uncontested* replaces "passes when first run", a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 81 → 82, clarity 0.75 → 0.81; checked: 10 directives, 9 kept, 1 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When an implementation hinge finds that the existing code already satisfies the test*, which was not a safe one.

Until Sun Oct 25 2026 this rule was named no-green-on-arrival-tests and titled "Drop an outcome whose test is green-on-arrival — it drives no design".

Until Mon Oct 26 2026 this rule was named drop-an-outcome-whose-test-is-green-on-arrival and titled "Drop an outcome whose test is green on arrival".

Until Mon Oct 26 2026 this rule told the reader to drop an outcome whose test passes when first run, rather than keep the confirming test, and said the test dilutes the suite's signal. The engineer settled that a test of behavior that already exists is coverage, which has value and is a concern of testing rather than of DBE, and that the agent may suggest it as an increase to coverage. "Green-on-arrival" is replaced by the literal "passes when first run". The compressed text was rewritten to match.

Until Tue Oct 27 2026 this rule called such a test one that "passes when first run". The engineer settled on *uncontested*, reserved in the `testing` vocabulary.

Related:

- the DBE-as-design-tool rule
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule — exit on solubility
- the advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work rule
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the implementation hinge
- the testing package's vocabulary — verified, not green
- the `testing` vocabulary — *uncontested*

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:43:08 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:45 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:30:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:34:57 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:00:02 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
