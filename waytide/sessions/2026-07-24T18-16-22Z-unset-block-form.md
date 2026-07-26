# Session — The block form of `unset` (Jul 24 2026)

## Opening summary

The session began as ordinary feature work — giving `EnvVar.unset` a block form, the
complement of what `EnvVar.push` already does for values — worked through Design By
Efferent (DBE) across ten passes. Partway through it became something else: on the
developer's recognition that the work had been meant as an experiment, it was
reconstituted as one, on its own branch, with the honest admission that no forecast could
be recorded because the outcome had already been seen. It ended with the experiment
declared **affirmed**, merged to `master` under a merge commit, its branch deleted, and
`master` pushed.

## Framing note

This is the communicable record — the guided tour of the session, written to be read by a
person. It is not the source of truth. The durable records are: the loop record
(`waytide/loops/`), the experiment record (`waytide/experiments/`), the decision log
(`waytide/log/`), and the code and tests themselves. This narrative points to them; they
are authoritative.

**What is firsthand here, and what is not.** Sections 1 through 8 narrate work done
earlier in the day and are drawn from the loop record and experiment record, which were
written live during that work — they are reliable, but this retelling is a summary of
them, not an independent witness. Sections 9 and 10 are firsthand: the orientation,
affirmation, merge, and push happened in the exchange this record closes.

## 1. The feature, and how many names it takes

The proposal: `unset` gains a block form behaving as `push`'s does — record the
variable's value, remove the variable, run the block, restore the recorded value after.

The first hinge was the **actuation** — the efferent shape of the invocation. Three
candidates went up: one name returning the prior value; one name returning a one-entry
Hash, for symmetry with `push`; a name-or-list returning a Hash, for full symmetry with
`push`'s polymorphism.

The developer asked what the purpose of a Hash return was, and the question collapsed the
option set. In `push` the Hash is load-bearing because `push` accepts several variables at
once, so the return has to carry one original value per name; its single-name form returns
a Hash only because it normalizes internally. The uniformity is a *consequence* of the
polymorphism, not its purpose — so for a single-name `unset` a Hash carries nothing the
bare value does not. The middle option was cosmetic, and the real hinge underneath was
whether the block form takes one name or several.

Re-posed at that altitude, the developer chose **one name, returning the prior value**.
Unsetting several variables is several nested actuations.
→ `waytide/log/2026-07-24T16-59-41Z-unset-block-form-returns-the-prior-value.md`

## 2. How the test reads that the variable is unset

The **observation** hinge: refute the environment's key membership (`ENV.key?`), or assert
that the value is `nil`, as the existing tests read it. Both discriminate absence from
emptiness; the difference is whether the test *states* absence or *infers* it.

The developer reported that the selection interface was clipping the code the decision
rested on, so the prompt was re-posed with both candidate test bodies rendered in the
response body and the options reduced to plain labels. The choice was **key membership** —
the reading that states absence directly.
→ `waytide/log/2026-07-24T16-59-42Z-unset-is-observed-as-key-membership.md`

## 3. What the variable is seeded with

The **controls** hinge. Two things were settled without gating and recorded as such: the
variable must be seeded at all, since a variable that never existed is absent inside the
block whether or not `unset` did anything — an unseeded control makes the observation
non-discriminating; and the seeding goes to `ENV` directly rather than through
`EnvVar.set`, so the control does not lean on the unit under test.

The option was random hex, as the existing tests use, or `"some value"` per the
control-string-value rule. The *name* must be random, because environment variables are
process-global and the name is what keeps tests from colliding; the value carries no such
requirement. The developer chose **random hex**, holding to the suite's existing form.

The second case also made `unset` a multi-case feature, so `test/automated/unset.rb` became
the feature folder `unset/`.
→ `waytide/log/2026-07-24T16-59-43Z-unset-test-becomes-a-feature-folder.md`

## 4. Just enough, or the whole block form

The **implementation** hinge, with its consequence surfaced alongside the options: writing
restoration now would make the restoration outcome's test green on arrival, which the
no-green-on-arrival rule drops — leaving restoration unprotected unless the test were
deliberately kept.

The developer first selected the whole block form, then interrupted and asked for the
hinge to be posed again. Re-posed with both candidate implementations rendered in full,
the choice was **just enough**: delete, call the block, return the prior value.
Restoration was left unwritten so its own outcome would drive it.

## 5. Restoration, and what "unset" means

The restoration mechanism was where the design point got decided. Established first, by
direct verification: `ENV[name] = nil` does delete the key in Ruby 4.0 — so `push`'s
existing restoration genuinely removes the variable rather than leaving an empty value,
and every candidate mechanism behaves identically. The fork was not correctness but
whether the code *states* the intent or leans on that implicit behavior. The `ensure` was
not offered as a choice; restoration has to survive a raising block as `push`'s does.

The developer directed that the branch use `ENV.delete(name)` rather than a recursive
`unset(name)`, which would re-enter the method being defined and log the restoration as a
fresh unset. That correction opened the other branch as a question, so the hinge was
re-posed with three candidates. The choice was **`set` when there was a value,
`ENV.delete` when there wasn't** — asymmetric, keeping the set half logged, and stating in
code that unset means the variable does not exist.
→ `waytide/log/2026-07-24T17-24-00Z-unset-restores-through-set-or-env-delete.md`

## 6. Three outcomes arrived green

Three behaviors the feature was to have — an already-unset variable staying unset, a
raising block still restoring, and the actuation returning the prior value — turned out to
be carried in by the restoration implementation before their own outcomes came up. The
no-green-on-arrival rule drops such outcomes as design steps: the design work was
finished, and anything further is coverage.

The developer asked for the rule to be stated before deciding. It was stated in full,
including the two bounds it places on itself — that keeping such a behavior is a
deliberate human decision rather than the default, and that the rule is a design concern
that does not reach coverage, where green on arrival is inevitable and correct. The
developer chose to cover **all three**.
→ `waytide/log/2026-07-24T17-24-01Z-unset-block-form-green-on-arrival-outcomes-are-covered.md`

For the already-unset coverage, the discrimination argument decided the block's content:
with an empty block the variable is absent before, during, and after, so the restore
branch could be deleted outright and the test would still pass. The developer chose **a
block that sets the variable**, which fails if the branch is removed.
→ `waytide/log/2026-07-24T17-24-02Z-already-unset-coverage-block-sets-the-variable.md`

## 7. Naming, at the feature's close

The fifth hinge, deferred to the end as DBE requires. Each outcome is a single assertion
over values already in scope, so the name went on the `test` itself rather than a wrapping
context — mechanical, not gated. The two refutations could not take the "Is" prefix, which
is reserved for value-equals comparisons. Three candidate names per outcome were put up;
the developer settled on "Does not exist within the block", "Restored to the recorded
value", "Is the value before unsetting", "Still unset after the block", and "Restored
despite the error".

## 8. The work is reconstituted as an experiment

The developer recognized that the work had been meant as an experiment and directed that
it be made one. Nothing had been committed, so the branch, its base, and its upstream came
out exactly as the convention requires — but the **forecast was not recoverable**, because
the outcome had already been seen.

The record states that plainly rather than reconstructing a forecast. A forecast written
after the fact would look like evidence while being none, and the experiment convention —
unlike the loop-record convention, which offers a **Backfill** marking — provides no
equivalent escape for a forecast. That omission reads as deliberate. What it costs is
stated in the record: it can carry findings, but not the forecast-versus-outcome finding
an experiment exists for.

Writing the record also produced the session's sharpest finding, and it emerged only then:
**the library's own suite has no site that needs the feature.** Every "not already set"
test obtains absence from a freshly generated random name that has never been set, so
absence is free and the block form buys nothing. The case that does need it is a *fixed*
variable name that may already be present in the ambient environment — a developer's shell
or continuous integration — and at the time, this project's own `test/test_init.rb` was
named as an instance of that shape.

**Corrected on Sat Jul 25 2026:** the developer corrected that citation. `test_init.rb` is
**test harness initiation, not a subject of testing or verification** — its defaults
configure the run rather than stating library behavior with a contract to protect, and
testing them would turn the instrument on itself. It is therefore not a candidate use
site, and the finding stands without qualification: **this repository contains no use site
for the block form at all.** The case for the feature rests entirely on code that consumes
this library. The experiment record carries the same correction.
→ `waytide/log/2026-07-24T17-38-42Z-unset-block-form-reconstituted-as-an-experiment.md`

## 9. Orientation, and the experiment's standing

The session resumed with "Where are we?" — answered from current files and a suite run
rather than recollection: the branch two commits ahead of `master`, 24 tests passing, the
feature built, the experiment's question open.

The developer then stated: **there is an experiment in effect.** The correction of emphasis
mattered — the experiment was not merely unconcluded but *active*, and active is not one of
the terminal states nor is it suspension. While it is in effect the branch is the working
line, DBE governs the work on it, and main-sequence work started elsewhere is to be
surfaced rather than allowed to diverge silently.

The developer then asked for the lifecycle states to be listed. They are the six in the
glossary below.

## 10. Affirmation, merge, and push

The developer declared the experiment **affirmed**. The declaration rested on the recorded
evidence rather than on a use site — none was found within the library, and the finding
that the suite has no site needing the feature stands as recorded. What carried it was the
shape of the case that does need the feature, together with the feature's low cost: no new
public name, no new required argument, no new arity, and the no-block path untouched.

The affirmation was recorded in the experiment record with its confirmations, logged, and
committed. Two further decisions went through the selection interface: a **merge commit**
rather than a fast-forward, so the experiment's commits read as a unit in `master`'s
history; and **deleting** the local experiment branch, which the merge and the records
render redundant. Both confirmations were recorded in the experiment record, as the
lifecycle requires.

The suite was run before each commit decision — 24 tests, 24 passed, 0 failed. `master`
merged at `ff0b2a0`, the confirmations committed at `dab30f1`, the branch deleted, and
`master` pushed to `github.com:eventide-project/env-var.git`.
→ `waytide/log/2026-07-24T18-11-47Z-unset-block-form-experiment-is-affirmed.md`

## Takeaways

- **The Hash return was cosmetic, and the real hinge was underneath it.** Asking what the
  Hash was *for* collapsed three options into one genuine decision — one name or several.
  A hinge posed at the wrong altitude produces options that differ without deciding
  anything.
- **A control that does not discriminate asserts nothing.** It came up twice — the seeded
  variable in the block test, and the setting block in the already-unset coverage. Both
  times the test question was: if the implementation branch were deleted, would this still
  pass?
- **An experiment reconstituted after the fact cannot have a forecast.** Saying so is
  worth more than a plausible reconstruction, which would read as evidence while being
  none.
- **The library has no use site for its own new feature.** The affirmation was made in
  full view of that, on the shape of the case that does need it.
- **"Unset" means absent, not empty**, and the code now says so rather than relying on
  `ENV[name] = nil` deleting the key — which it does, verified directly.

## Glossary

Terms used with these meanings, from the framework's vocabularies and this session's work:

- **Design By Efferent (DBE)** — the design method followed here: the actuation is written
  before any implementation, forcing the interface outside-in; the AI generates straight
  through and gates at the hinges for the developer to deliberate.
- **actuation** — the invocation of the unit under test, from its use site; the first
  efferent reference to it.
- **observation** — what the test reads about the outcome of the actuation. An assertion is
  the mechanism, not the thing itself.
- **controls** — the known, deterministic inputs a test is built from, and the setup that
  establishes them.
- **hinge** — a decision the design turns on: subtle (the judgment lives in the person) and
  load-bearing (other work rests on it).
- **gate** — where the loop stops and hands a hinge to the developer.
- **green on arrival** — an outcome whose test passes the moment it is written. It drove no
  design, so DBE drops it; keeping one as regression protection is a deliberate decision.
- **unset** — in this library, that the variable does not exist in the environment; not
  that it carries an empty value.
- **the experiment lifecycle states** — **affirmed** (the question held), **refuted** (it
  was disproven), **inconclusive** (it ran without a verdict), **abandoned** (dropped
  before a verdict), **superseded** (replaced by another experiment), and **suspended**
  (paused, not ended). The first five end an experiment; the sixth pauses it.

## Where the durable records live

- **The loop record** — `waytide/loops/2026-07-24T16-59-40Z-unset-block-form.md`. Ten
  passes, each with its hinge, the options put up, and the decision or chat that resolved
  it. Written live, not backfilled. This is the detailed account of sections 1 through 7.
- **The experiment record** — `waytide/experiments/2026-07-24T17-38-41Z-unset-block-form.md`.
  The question, the setup, the missing forecast and what it costs, the findings, the
  misses, and the lifecycle with every confirmation. State: **Affirmed**.
- **The decision log** — eight entries under `waytide/log/`, dated
  `2026-07-24T16-59-41Z` through `2026-07-24T18-11-47Z`.
- **The code** — `lib/env_var/env_var.rb`, and `test/automated/unset/` with `unset.rb`,
  `block.rb`, `not_already_set.rb`, and `block_raises_error.rb`. The `README.md` documents
  the block form and states that unset removes the variable rather than emptying it.

## Closing note

The session's most useful product may not be the feature. The block form is nine lines and
three test files; the finding that the library's own suite has no place to use it is the
kind of thing that only surfaces when a record is written, and it surfaced late — well
after the feature was built and while the experiment record was being drafted. That it was
recorded as a miss rather than smoothed over is what keeps the record worth returning to
when the question of usefulness comes up again against a real use site.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 11 AM PDT
Changed by Scott Bellware on Sat Jul 25 2026 at 10 AM PDT
