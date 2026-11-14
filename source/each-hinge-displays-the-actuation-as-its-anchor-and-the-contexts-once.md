# Each hinge displays the actuation as its anchor, and the contexts once

**Trigger:** When presenting a hinge to the engineer

Each hinge of the cycle is handed to the human with a specific amount of the test on screen. The the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule owns the *sequence* of hinges and the acceptance mechanism. This rule owns what is *displayed* at each one.

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

The implementation leads, because it is what the hinge is about. The test and the feature's output are shown with it. See the after-any-implementation-hinge-show-the-test-output-for-the-current-feature rule.

**Why:** each hinge is a distinct deliberation, and what is on screen decides what can be deliberated. Too little and the human is asked to judge something in isolation that has no meaning in isolation. The load-bearing linkage (do *these* controls, fed into *this* actuation, produce a result *this* observation reads, and does the whole thing exercise the outcome?) then has to be reconstructed mentally.

Too much and the hinge's own concern is buried in material already settled. The anchor principle fixes the first failure. The show-once principle fixes the second.

**How to apply:** render each hinge per the table. At hinge 1, the actuation within its full `context` nesting. At hinge 2, the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block. At hinge 3, the control declarations, then the actuation, then the observation. That is the complete test body, with the `context` blocks omitted.

At hinge 4, show the implementation once a candidate is accepted, ahead of the test and the feature's output. Do not advance to naming before it is on screen. Everything shown from an earlier hinge is context, not an invitation to re-decide it.

## Compressed

1. Each hinge shows the human a specific amount of the test on screen.
2. The the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule owns the sequence of hinges and the acceptance mechanism. This rule owns what is displayed at each hinge.
3. Render each hinge per this table:

| Hinge | Displays |
|---|---|
| 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
| 2 — **observation** | the actuation + the observation — no contexts |
| 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |
| 4 — **implementation** | at the gate, the candidates. Once one is accepted, **the implementation itself**, then the feature's test output |
| 5 — **naming** | the candidate names, and the test whose outcome they name |

## The actuation is the anchor at every downstream hinge

1. Show the actuation at hinges 2 and 3, because what each one decides has no meaning apart from it.
2. The actuation shown at hinges 2 and 3 is context. It is not re-decided there. Everything shown from an earlier hinge is context, not an invitation to re-decide it.
3. At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block.
4. At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted.

## The contexts are shown once, where they are decided, and elided after

1. Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path.
2. Show the full `context` nesting at hinge 1, so the human judges where the outcome lives before anything else is built.
3. Do not repeat the contexts at the hinges after the first.
4. The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges.

## The implementation is shown before the loop moves on from its hinge

1. Hinge 4 is where solubility is judged. An awkward implementation signals that the actuation is wrong.
2. Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on.
3. Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output.
4. Show the test and the feature's output with the implementation, per the after-any-implementation-hinge-show-the-test-output-for-the-current-feature rule.
5. Do not advance to naming before the implementation is on screen.

## Compression

- 2026-10-24, compressed: compression 0.29, change 0.52, solubility 36 → 52, clarity 0.43 → 0.52, 13 directives, 13 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 52 → 47, clarity 0.52 → 0.50; checked: 18 directives, 17 kept, 1 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 47 → 50, clarity 0.50 → 0.47; checked: 14 directives, 14 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named what-each-hinge-displays and titled "What each hinge displays: the actuation is the anchor, the contexts are shown once".

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the sequence, the acceptance mechanism, and the requirement that an option be the artifact rather than a label
- the first-turn rule — the three test hinges produce turn one
- the after-any-implementation-hinge-show-the-test-output-for-the-current-feature rule — the feature's test output that accompanies the implementation at hinge 4
- the folder-mirroring rule
- the a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 8:55:06 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:11 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:42 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
