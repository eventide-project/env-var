# What each hinge displays: the actuation is the anchor, the contexts are shown once

Each hinge of the cycle is handed to the human with a specific amount of the test on screen. The hinge-cycle rule owns the *sequence* of hinges and the acceptance mechanism; this rule owns what is *displayed* at each one.

| Hinge | Displays |
|---|---|
| 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
| 2 — **observation** | the actuation + the observation — no contexts |
| 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |

Two principles generate the table.

**The actuation is the anchor at every downstream hinge.** A hinge is meaningful only in relation to the actuation. An observation shown alone (`assert(namespace == other_namespace)`) doesn't reveal what is being read or whether it witnesses the outcome — that depends entirely on the actuation that produced the value under observation. Controls shown alone are inert: a top-level constant, an inner name, a namespace name say nothing about whether they exercise the outcome, because their correctness is a function of how the actuation consumes them (which argument each becomes) *and* what the observation then reads about the result. So the actuation rides along at hinges 2 and 3 — shown for context, not re-decided.

**The contexts are shown once, where they are decided, and elided after.** The actuation hinge is where the outcome's **structural placement** is established — which class/feature contexts it nests under, mirroring the test's folder path. Seeing the nesting at hinge 1 lets the human judge *where* the outcome lives before anything else is built. Once settled there, the contexts are fixed, and repeating them at the observation and controls hinges buries each hinge's actual concern in noise. The full nesting returns when the turn-one test file is assembled and shown after the three test hinges.

**Why:** each hinge is a distinct deliberation, and what is on screen decides what can be deliberated. Too little and the human is asked to judge something in isolation that has no meaning in isolation — the load-bearing linkage (do *these* controls, fed into *this* actuation, produce a result *this* observation reads, and does the whole thing exercise the outcome?) then has to be reconstructed mentally. Too much and the hinge's own concern is buried in material already settled. The anchor principle fixes the first failure; the show-once principle fixes the second.

**How to apply:** render each hinge per the table. At hinge 1, the actuation within its full `context` nesting. At hinge 2, the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block. At hinge 3, the control declarations, then the actuation, then the observation — the complete test body with the `context` blocks omitted. Everything shown from an earlier hinge is context, not an invitation to re-decide it. Related: the hinge-cycle rule (the sequence and the acceptance mechanism), the first-turn rule (the three test hinges produce turn one), the folder-mirroring rule, and the test-block-is-assertion-only rule.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
