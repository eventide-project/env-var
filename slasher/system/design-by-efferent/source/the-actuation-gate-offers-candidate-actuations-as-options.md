# The actuation gate offers candidate actuations as options

**Trigger:** When presenting the actuation hinge of an outcome

At the actuation gate — the first gate, where the cradle is set — the AI does not commit a single actuation and proceed. It presents the human a small set of **candidate actuations** as options to choose among. The human then **chooses** the option that reads as the more soluble use.

This is how the highest-leverage hinge is handed over for deliberation, that hinge being the efferent shape of the actuation. The engineer compares concrete alternatives.

The form is deliberate. It is the form every hinge takes, and the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule states it and the result it rests on: the human produces the answer rather than approving one.

## A candidate varies what the use site states

**That is the whole test.** Two actuations are distinct candidates when a reader at the use site sees different words. Where the use site reads the same either way, the two are one candidate, and offering the two of them pads the gate.

**An omitted argument is a candidate.** `upload.(file)` beside `upload.(file, retries: 3)` is a real pair. The first makes the retry policy the object's own and leaves every use site identical. The second makes every use site state the count.

**Whether a value reaches the use site is the efferent decision.** So an absent parameter is a decision about the interface rather than the lack of one. This is the case most easily discarded, because the shorter shape reads as the other one with something missing.

**A chained construction is not an actuation.** `Upload.build(retries: 3).(file)` constructs and actuates in one expression. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line. Construction is the **controls** hinge's concern, so a construction offered here takes a decision out of the hinge that owns it. The chain also leaves an intermediate unbound, against the way every test file is written.

**A varied receiver is not a candidate.** `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways. Which interface carries the operation is a real question, and this hinge does not ask it.

**Why the test is worth stating.** The rule already refuses a cosmetic variant, and an agent that could tell a cosmetic variant from a real one would not have produced one. A named test gives the agent something to apply: hold the receiver constant, and ask what the use site states. Without it the gate fails in both directions at once. Three shapes are offered where one decision exists, and the omitted-argument shape is discarded as no shape at all.

**Why:** The actuation is the cradle and the highest-leverage hinge (human-in-the-loop rule, step 1: "the AI may propose the actuation… asks rather than averaging"). Concrete alternatives make the deliberation tractable, and they make the human produce the answer. They let the AI carry the proposing work without pulling the human's judgment down to the mean.

**How to apply:** At the first gate, generate a few genuinely distinct candidate actuations. They are different efferent shapes rather than cosmetic variants. Present each as it would read at the use site.

**Judge distinctness by what the use site states.** Keep a shape that omits an argument. Drop a chained construction and a varied receiver.

Offer them through the selection UI. See the present-every-prompt-to-the-engineer-through-the-selection-ui rule.

If the human chooses one, adopt it as the cradle. If the human writes their own instead, take that actuation or enter a dialogue. Settle the actuation before writing the test file. Do not proceed to the test body until the actuation is settled.

**A lone candidate is presented as every hinge presents one**, with no candidate manufactured to reach two. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.

## Compressed

1. At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed.
2. Present the human a small set of candidate actuations as options to choose among.
3. The human chooses the option that reads as the more soluble use.
4. This is the form every hinge takes. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for it and the result it rests on.
5. Present each candidate as it would read at the use site.
6. A chosen candidate becomes the cradle. Where the human writes their own instead, take that actuation or enter a dialogue.
7. Settle the actuation before writing the test file. Do not proceed to the test body until it is settled.

## A candidate varies what the use site states

1. Make the candidates genuinely distinct efferent shapes, not cosmetic variants. Two actuations are distinct candidates when a reader at the use site sees different words.
2. Where the use site reads the same either way, the two are one candidate. Do not offer both. That pads the gate.
3. An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair.
4. The first makes the retry policy the object's own. The second makes every use site state the count.
5. An absent parameter is an interface decision, not the lack of one. Do not discard the shorter shape as the other with something missing.
6. A chained construction is not an actuation. `Upload.build(retries: 3).(file)` constructs and actuates in one expression.
7. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line, leaving no intermediate unbound.
8. Do not offer a construction here. Construction belongs to the controls hinge.
9. A varied receiver is not a candidate. `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways.
10. This hinge does not ask which interface carries the operation.
11. To apply the test, hold the receiver constant and ask what the use site states.

## Compression

- 2026-10-24, compressed: compression 0.37, change 0.54, solubility 30 → 56, clarity 0.43 → 0.76, 25 directives, 25 kept, 0 less precise, 0 lost
- 2026-10-27, re-checked: 19 directives, 19 kept, 0 less precise, 0 lost
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 56 → 61, clarity 0.76 → 0.77; checked: 20 directives, 17 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 61 → 64, clarity 0.77 → 0.77; checked: 19 directives, 19 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 29 directives, 21 kept, 5 less precise, 3 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule

## History

Until Sun Oct 25 2026 this rule was named actuation-gate-options-or-chat and titled "The actuation gate: offer candidate actuations as options. The human selects one or writes their own".

Until Mon Oct 26 2026 this rule restated the mechanism every hinge follows: the candidates as options, the mandatory free-text option and its reasons, and a lone candidate beside `Explain`. The the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule states it, and this rule now cites it, keeping only what is particular to the actuation.

Until Thu Oct 29 2026 this rule offered the human the free-text option, supplied by the selection UI, to dictate the actuation or open a chat, and gave its being mandatory as one of the results the gate's form rests on. It also presented a lone candidate beside `Explain`.

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- human-in-the-loop
- first-turn
- DBE-as-design-tool
- present-every-prompt rules
- the DBE vocabulary
- the `testing` package's a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule — where the actuation is bound to an explaining variable
- the `ext/ruby-lang` package's no-inline-method-call-arguments rule — the same discipline in the library source

---

Authored by Scott Bellware on Sat Jun 27 2026 at 1 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 7:40:50 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:34:58 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:49:17 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:54:56 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:12 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:06 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:34:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:40:05 PM PT
