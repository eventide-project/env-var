# The first implementation may run a contained red/green loop

When you reach the implementation of a unit **for the first time** (Design By Efferent —
new behavior being designed, not coverage of shipped behavior), a red/green
loop is permitted as two hinges around the real implementation:

- **Red (optional hinge).** Write the implementation so the new test **fails** — the
  natural first state that proves the test can discriminate. This hinge is *optional*,
  and permitted **only if the failure is contained to the new test** — i.e. its cause
  does not make any other **stable** (existing, passing) test fail.
- **Green (hinge).** Write the implementation so the new test **passes**.
- Then **proceed to the real implementation.**

**The governing constraint:** you may run the red/green loop **as long as the cause of
the test's failure does not cause other stable tests to fail.** If the deliberate red
would break other stable tests, do not do it.

**Why:** for genuinely new behavior, red-then-green is the honest first move — it proves
the test actually discriminates before the implementation makes it pass, and it keeps
the design driven from the test. The containment constraint is what keeps this distinct
from the prohibited move: you never destabilize a working surface to manufacture a red.
A red that is isolated to the new test costs nothing; a red that ripples into stable
tests is breakage.

**How to apply:**
- Only at the **first** implementation of a unit, and only for **design** (new behavior)
  — not for coverage of already-working behavior, which is green-on-arrival (see the
  "TDD designs, coverage protects" rule).
- Before writing a deliberate red, know that its failure cause is local to the new test.
  Run the full suite after the red; if a **stable** test fails, the red was not
  contained — back it out and reach a passing test directly.
- Treat red and green as their own hinges (present them through the selection UI like
  any other hinge/prompt).

**Reconciliation.** This refines "TDD designs, coverage protects — never break the
implementation." That rule forbids mutating a **working/shipped** implementation to
force a red (it breaks stable tests; it is final-inspection coverage, not design). This
rule permits a **contained** red/green while first designing new behavior, because there
the red is isolated to the not-yet-implemented unit. The line between them is exactly the
containment constraint: does the failure's cause reach other stable tests? If yes,
forbidden; if no, permitted. Related: the "TDD designs, coverage protects" rule, the
"hinges gate the design of a test" rule, the no-green-on-arrival rule, the hinge-cycle
rule, and the present-every-prompt rule.

---

Authored by Scott Bellware on Fri Jul 3 2026 at 9 AM PT
