# What each hinge displays: the actuation is the anchor, the contexts are shown once

Each hinge of the cycle is handed to the human with a specific amount of the test on screen. The hinge-cycle rule owns the *sequence* of hinges and the acceptance mechanism. This rule owns what is *displayed* at each one.

| Hinge | Displays |
|---|---|
| 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
| 2 — **observation** | the actuation + the observation — no contexts |
| 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |
| 4 — **implementation** | at the gate, the candidates. Once one is accepted, **the implementation itself**, then the feature's test output |
| 5 — **naming** | the candidate names, and the test whose outcome they name |

Three principles generate the table.

**The actuation is the anchor at every downstream hinge.** A hinge is meaningful only in relation to the actuation. Take an observation shown alone, `assert(namespace == other_namespace)`. It does not reveal what is being read, or whether it witnesses the outcome. That depends entirely on the actuation that produced the value under observation.

Controls shown alone are inert. A top-level constant, an inner name, and a namespace name say nothing about whether they exercise the outcome. Their correctness is a function of how the actuation consumes them, meaning which argument each becomes.

It is *also* a function of what the observation then reads about the result. So the actuation rides along at hinges 2 and 3 — shown for context, not re-decided.

**The contexts are shown once, where they are decided, and elided after.** The actuation hinge is where the outcome's **structural placement** is established — which class/feature contexts it nests under, mirroring the test's folder path. Seeing the nesting at hinge 1 lets the human judge *where* the outcome lives before anything else is built. Once settled there, the contexts are fixed, and repeating them at the observation and controls hinges buries each hinge's actual concern in noise. The full nesting returns when the turn-one test file is assembled and shown after the three test hinges.

**The implementation is shown before the loop moves on from its hinge.** The implementation hinge is where **solubility** is judged, and an awkward implementation is the tell that the actuation is wrong. That tell is in the code. Showing the run alone reports that the behavior arrived, and withholds the thing the judgment is made on. The engineer would then be asked for a solubility verdict on an artifact they have not seen.

The implementation leads, because it is what the hinge is about. The test and the feature's output are shown with it. See the show-the-test-after-implementing and show-feature-test-output-after-implementation-hinge rules.

**Why:** each hinge is a distinct deliberation, and what is on screen decides what can be deliberated. Too little and the human is asked to judge something in isolation that has no meaning in isolation. The load-bearing linkage (do *these* controls, fed into *this* actuation, produce a result *this* observation reads, and does the whole thing exercise the outcome?) then has to be reconstructed mentally.

Too much and the hinge's own concern is buried in material already settled. The anchor principle fixes the first failure. The show-once principle fixes the second.

**How to apply:** render each hinge per the table. At hinge 1, the actuation within its full `context` nesting. At hinge 2, the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block. At hinge 3, the control declarations, then the actuation, then the observation. That is the complete test body, with the `context` blocks omitted.

At hinge 4, show the implementation once a candidate is accepted, ahead of the test and the feature's output. Do not advance to naming before it is on screen. Everything shown from an earlier hinge is context, not an invitation to re-decide it.

Related:

- the hinge-cycle rule — the sequence, the acceptance mechanism, and the requirement that an option be the artifact rather than a label
- the first-turn rule — the three test hinges produce turn one
- the show-the-test-after-implementing and show-feature-test-output-after-implementation-hinge rules — what accompanies the implementation at hinge 4
- the folder-mirroring rule
- the test-block-is-assertion-only rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
