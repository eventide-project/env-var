# Experiment — The block form of `unset`

**Tags:** [experiment]

## Question

Is the unset-with-block feature useful?

`EnvVar.push` already treats the environment as a stack for a *value*: it sets a variable
for the duration of a block and restores what was there before. The proposed feature is
the complement for *absence* — remove the variable for the duration of a block, then
restore it, where restoring an absent variable means it stays absent. The question is
whether that complement earns its place in the library.

## Setup

- **State:** Affirmed
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/unset-block-form`
- **Base:** `eaa70bb6763c827f727756f59bba1fde58b23990` (`eaa70bb`, "Waytide is installed"), from `master`

## Forecast

**No forecast was committed in advance.** The work ran as main-sequence development and
was reconstituted as an experiment afterward, on the developer's recognition that it had
been meant as one. Nothing was committed at that point, so the branch, the base, and the
upstream are exactly as the rule requires — but the forecast is not recoverable, because
by then the outcome had been seen.

This is stated rather than reconstructed. `agent-experiments-convention` holds that the
gap between forecast and outcome is the finding, and that it is trustworthy only if the
forecast was committed in advance; a forecast written after the fact would look like
evidence while being none. Unlike a loop record, which carries a **Backfill** marking for
retroactive reconstruction, the experiment convention offers no equivalent for a
forecast, and that omission reads as deliberate.

**What this costs:** the record can carry findings, but it cannot produce the
forecast-versus-outcome finding an experiment exists for. Treat the findings below as
observations from a build, not as a forecast tested.

## What happened

The feature was designed through Design By Efferent across ten passes, gated at every
hinge. The deliberation — each pass's hinge, the options put up, and the decision or
chat that resolved it — is recorded live (not backfilled) in the loop record
`waytide/loops/2026-07-24T16-59-40Z-unset-block-form.md`, which this record does not
restate.

The resulting shape: `unset(name, &action)` records the variable's value, removes the
variable, calls the block, and restores the recorded value in an `ensure` — through
`set` when there was a value, `ENV.delete` when there wasn't. It returns the prior value
with or without a block, so the no-block form is unchanged.

Suite: 24 tests, 24 passed, 0 failed.

## Findings

**The feature is cheap.** It adds no new public name, no new required argument, and no
new arity — an optional block on an existing operation. The no-block path is untouched.
The whole cost is nine lines in one method and three test files.

**Its own library's suite has no site that needs it.** Every "not already set" test in
this suite — `fetch/not_already_set.rb`, `push/not_already_set.rb`, and the
`not_already_set.rb` written during this work — obtains absence from a freshly generated
random variable name that has never been set. Absence is free there, so the block form
buys nothing. This is the strongest evidence against the feature found so far, and it was
not anticipated.

**The case that does need it is a fixed variable name that may already be set.** Random
names cannot help when the name under test is fixed by the code being tested and may be
present in the ambient environment — a developer's shell, or continuous integration (CI).
Exercising the absent path then requires removing that specific variable and putting it
back, which is exactly what the block form does and exactly the complement of what `push`
already does for values.

**Corrected on Sat Jul 25 2026:** this record originally named this project's own
`test/test_init.rb` as an instance of that shape, on the grounds that it defaults
`CONSOLE_DEVICE`, `LOG_TAGS`, `LOG_LEVEL`, and `TEST_BENCH_DETAIL` with `||=`. The
developer corrected it: `test_init.rb` is **test harness initiation, not a subject of
testing or verification**. Its defaults configure the run; they are not library behavior
with a contract to protect, and testing them would turn the instrument on itself. So it
is not a candidate use site, and the finding above stands without qualification — **this
repository contains no use site for the block form at all.** The case for the feature
rests entirely on code that consumes this library, where a fixed variable name set in the
ambient environment is the ordinary situation.

**"Unset" was made to mean absent, not empty.** The restoration branches on whether there
was a value rather than relying on `ENV[name] = nil` deleting the key. `ENV[name] = nil`
does delete the key in Ruby 4.0 — verified during the work — so `push`'s existing
restoration is correct as written; the branch in `unset` states the intent rather than
correcting a defect.

## Misses

- The already-unset, raising-block, and prior-value-return outcomes turned out to be
  green on arrival, carried in by the restoration implementation before their own
  outcomes came up. They were recognized only after the implementation was accepted, and
  became a coverage decision rather than design steps.
- The finding that the library's own suite has no use site emerged only when the record
  was being written, well after the feature was built.

## Lifecycle

**Confirmations recorded:**

- The developer directed the experiment be reconstituted after the work, accepting a
  record with no forecast, and was told plainly what that costs (options put through the
  selection UI, "Branch it, no forecast").
- The developer stated the experiment's question.
- The developer declared the experiment **affirmed** on Fri Jul 24 2026 at 11 AM PDT.
  No untested-merge confirmation was required: the suite passes, 24 tests, 0 failed.
- The developer chose a merge commit over a fast-forward, so the experiment's commits
  read as a unit in `master`'s history (options put through the selection UI).
- The developer confirmed **deleting the local `experiment/unset-block-form` branch**
  after the merge (options put through the selection UI). The branch had no remote
  counterpart, so no remote deletion was in play.

**Affirmed.** The block form of `unset` earns its place. The declaration is the
developer's, made on the evidence in this record rather than on a use site — none was
found within the library, and the finding that the suite has no site needing the feature
stands as recorded. What carried the affirmation is the shape of the case that does need
it (a fixed variable name that may be present in the ambient environment, of which this
project's own `test/test_init.rb` is an instance) together with the feature's low cost.

The decisions this experiment established were logged to `waytide/local/log/` as the work
proceeded, so the affirmation's log copy is the merge of this branch into `master`,
together with the entry recording the affirmation itself. The experiment produced
implementation, so the branch merges to `master` — its tests pass.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 10 AM PDT
Changed by Scott Bellware on Fri Jul 24 2026 at 11 AM PDT
Changed by Scott Bellware on Sat Jul 25 2026 at 10 AM PDT
Changed by Scott Bellware on Mon Jul 27 2026 at 3:31 PM PDT
