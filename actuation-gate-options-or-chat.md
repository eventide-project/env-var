# The actuation gate: offer candidate actuations as options. The human selects one or writes their own

At the actuation gate — the first gate, where the cradle is set — the AI does not commit a single actuation and proceed. It presents the human a small set of **candidate actuations** as options to choose among. The human then either:

- **chooses** the option that reads as the more soluble use, or
- takes the **free-text option** — dictating the actuation outright, or opening a chat to work out what it should be.

This is how the highest-leverage hinge is handed over for deliberation, that hinge being the efferent shape of the actuation. The engineer compares concrete alternatives. The free-text option, always there, covers the case where the right shape is not among the options.

The form is deliberate. It is the operationalization of the two results the gates rest on (see the DBE vocabulary):

- **Make the human produce the answer, not approve one — so present alternatives, not a fait accompli.** A single proposed actuation ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer. It exerts mean-bias and lowers the human toward the average. Offering several genuine options keeps the human producing an answer — comparing real candidate shapes for solubility — rather than ratifying.
- **The best options are ones the AI can't produce — so the free-text option is mandatory.** The option set is the AI's own, drawn from the average. The best actuation is often one only the human can produce, and showing a closed list tempts the human to pick from it instead of producing their own. The free-text option is what keeps the human above the AI's mean — never boxed into the AI's option set.

## A candidate varies what the use site states

**That is the whole test.** Two actuations are distinct candidates when a reader at the use site
sees different words. Where the use site reads the same either way, the two are one candidate, and
offering the two of them pads the gate.

**An omitted argument is a candidate.** `upload.(file)` beside `upload.(file, retries: 3)` is a
real pair. The first makes the retry policy the object's own and leaves every use site identical.
The second makes every use site state the count.

**Whether a value reaches the use site is the
efferent decision.** So an absent parameter is a decision about the interface rather than the lack of
one. This is the case most easily discarded, because the shorter shape reads as the other one with
something missing.

**A chained construction is not an actuation.** `Upload.build(retries: 3).(file)` constructs and
actuates in one expression. The actuation in it is `upload.(file)`, with the constructed object
bound to an explaining variable on its own line. Construction is the **controls** hinge's concern,
so a construction offered here takes a decision out of the hinge that owns it. The chain also
leaves an intermediate unbound, against the way every test file is written.

**A varied receiver is not a candidate.** `Upload.(file, retries: 3)` beside
`upload.(file, retries: 3)` is one shape reached two ways. Which interface carries the operation is
a real question, and this hinge does not ask it.

**Why the test is worth stating.** The rule already refuses a cosmetic variant, and an agent that
could tell a cosmetic variant from a real one would not have produced one. A named test gives the
agent something to apply: hold the receiver constant, and ask what the use site states. Without it
the gate fails in both directions at once. Three shapes are offered where one decision exists, and the
omitted-argument shape is discarded as no shape at all.

**Why:** The actuation is the cradle and the highest-leverage hinge (human-in-the-loop rule, step 1: "the AI may propose the actuation… asks rather than averaging"). Concrete alternatives make the deliberation tractable, and they make the human produce the answer. The mandatory free-text option keeps the human above the AI's mean when the right actuation is one the AI couldn't produce. Together they let the AI carry the proposing work without pulling the human's judgment down to the mean.

**How to apply:** At the first gate, generate a few genuinely distinct candidate actuations. They are different efferent shapes rather than cosmetic variants. Present each as it would read at the use site.

**Judge distinctness by what the use site states.** Keep a shape that omits an argument. Drop a chained construction and a varied receiver.

Offer them through the selection UI, which supplies the free-text option. Do not add one of your own. See the present-every-prompt rule.

If the human chooses one, adopt it as the cradle. If the human writes their own instead, take that actuation or enter a dialogue. Settle the actuation before writing the test file. Do not proceed to the test body until the actuation is settled.

**When a hinge has no genuinely distinct candidates, do not manufacture them.** Present the one candidate as the option, in the form every other option takes, with the free-text option still there.

**Do not replace it with an `Accept` label.** The option is the artifact, and the single case changes nothing about that. See the hinge-cycle rule.

This mechanism is the candidates as options, with the free-text option. It applies at **every** hinge of the cycle, not only the actuation: actuation, observation, controls, implementation, and naming. See the hinge-cycle rule.

Related:

- the hinge-cycle
- human-in-the-loop
- first-turn
- DBE-as-design-tool
- present-every-prompt rules
- the DBE vocabulary
- the `testing` package's tdd-test-structure rule — where the actuation is bound to an explaining variable
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
