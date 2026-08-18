# Loop record — The block form of `unset`

`EnvVar.unset` gains a block form that behaves as `push`'s block form does: record the
environment variable's value, unset the variable, execute the block, and restore the
recorded value after the block. When the variable was already unset, the restored state
is that the variable is still unset. Throughout, "unset" means the variable does not
exist in the environment — not that it carries an empty value.

## Pass 1 — Actuation

**Hinge** — the efferent shape of the block form: how many names it takes, and what it
returns.

**Options** — three were put up initially: one name returning the prior value; one name
returning a one-entry Hash (symmetry with `push`); a name-or-list returning a Hash (full
symmetry with `push`'s name-or-Hash polymorphism).

**Decision / chat** — the developer asked what the purpose of a Hash return was. The
answer clarified the option set and collapsed it: in `push` the Hash is load-bearing
because `push` accepts a Hash of several variables, so the return must carry one original
value per name; `push`'s single-name form returns a Hash only because it normalizes the
single name into a one-entry Hash internally. The uniformity is a consequence of the
polymorphism, not its purpose. For a single-name `unset`, a Hash return therefore carries
nothing the bare value does not — the middle option was cosmetic, and the real hinge
underneath it was whether the block form takes one name or several.

Re-posed at that altitude, the developer chose **one name, returning the prior value** —
`unset(name, &action)` returning a String, or `nil` when the variable was already unset.
`unset` then returns the same thing with a block as without one, and unsetting several
variables is several nested actuations.

## Pass 2 — Observation

**Hinge** — how the test reads that the variable is unset inside the block.

**Options** — refuting the environment's key membership (`ENV.key?`), or asserting that
the environment's value is `nil` (`ENV[name]`, as the existing `unset` and `push` tests
read it). Both discriminate absence from emptiness, since `ENV[name]` is `nil` only for
an absent key and `""` for an empty value; the difference is whether the test *states*
absence or *infers* it.

**Decision / chat** — the developer reported that the selection UI's preview panel was
clipping the code the decision rested on. The prompt was re-posed with both candidate
test bodies rendered in the response body and the options reduced to plain labels. The
developer chose **key membership** — the reading that states absence directly, matching
the design point that unset means the variable does not exist in the environment.

## Pass 3 — Controls

**Hinge** — the form of the value the variable is seeded with before the actuation.

Two things were settled without gating and are recorded here as such: the variable must
be seeded at all, because a variable that never existed is absent inside the block
whether or not `unset` did anything — an unseeded control makes the observation
non-discriminating; and the seeding goes to `ENV` directly rather than through
`EnvVar.set`, so the control does not lean on the unit under test.

**Options** — `SecureRandom.hex`, as the existing `unset` and every `push` test use, or
`"some value"` per the control-string-value rule. The name must be random because
environment variables are process-global and the name is what keeps tests from
colliding; the value carries no such requirement, so its randomness in the existing
tests is incidental to the name's.

**Decision / chat** — the developer chose **random hex**, holding to the suite's
existing form.

## Pass 4 — Implementation

**Hinge** — how much of the block form is written now: only enough to satisfy the
outcome on the table, or the whole block form (delete, call inside an `ensure`, restore)
in one step.

The consequence was surfaced with the options: writing restoration now makes the
restoration outcome's test green on arrival, which the no-green-on-arrival rule drops —
leaving restoration unprotected unless the test is deliberately kept as regression
protection.

**Options** — just enough, or the whole block form. The developer first selected the
whole block form, then interrupted and asked for the hinge to be posed again. It was
re-posed with both candidate implementations rendered in full, and with the note that
the restoration mechanism is its own hinge — `set(name, nil)` deletes the key in Ruby, so
it happens to work, but it states the intent implicitly and logs a set of `nil`.

**Decision / chat** — on the second posing the developer chose **just enough**:
`unset(name, &action)` deletes, calls the block when one is given, and returns the prior
value. Restoration is left unwritten so its own outcome drives it.

**Outcome** — `EnvVar.unset` accepts an optional block and calls it after deleting the
variable. `test/automated/unset.rb` moved to `test/automated/unset/unset.rb` and the new
case is `test/automated/unset/block.rb`, since a second case makes `unset` a feature
folder. Suite: 20 tests, 20 passed, 0 failed. The test is left unnamed — naming is the
fifth hinge, deferred to the feature's close. Not yet committed.

## Pass 5 — Observation, the restoration outcome

**Hinge** — what the restored environment value is compared against.

**Options** — the control value (the independent known input, so the observation cannot
pass on a unit that recorded the wrong value and restored it faithfully), or the
actuation's return (states the contract directly — what the block form recorded is what
it puts back — but couples two behaviors that could be wrong together).

**Decision / chat** — the developer chose **the actuation's return**. The control seeding
keeps the observation non-vacuous: `original_value` is the seeded value, so a
restoration that did not happen leaves `restored_value` at `nil` and fails.

## Pass 6 — Implementation, the restoration mechanism

**Hinge** — how the prior value is restored, which is where the design point about the
already-unset case gets decided.

Established before the options were put up: `ENV[name] = nil` deletes the key in Ruby
4.0, verified directly. So `push`'s existing restoration does genuinely remove the
variable rather than leave an empty value, and every candidate mechanism behaves
identically — the fork is whether the code states the intent or leans on that implicit
behavior. The `ensure` was not offered as a choice; restoration has to survive a raising
block as `push`'s does.

**Options** — first put up as two: restoring through `set` unconditionally as
`push_values` does, or branching between `set` and a recursive `unset(name)` call.

**Decision / chat** — the developer directed that the branch use `ENV.delete(name)`
rather than `unset(name)`, which would re-enter the method being defined and log the
restoration as a fresh unset operation. That correction opened a question about the other
branch, so the hinge was re-posed with three candidates: `set` / `ENV.delete` (the
asymmetric form the developer directed, keeping the set half logged), both branches
direct to `ENV` (symmetric, treating restoration as bookkeeping internal to the block
form), or `set` unconditionally. The developer chose **`set` / `ENV.delete`**.

## Pass 7 — The remaining outcomes are green on arrival

**Hinge** — not a design hinge. Three behaviors the feature was to have — an already-unset
variable staying unset, a raising block still restoring, and the actuation returning the
prior value — were all carried in by the restoration implementation accepted at pass 6,
verified by running them directly. The no-green-on-arrival rule therefore drops them as
design steps: the feature's design work was finished, and any further test is coverage.

**Options** — which of the three get regression coverage, the deliberate exception the
no-green-on-arrival rule reserves to the human. `push` protects the two parallel cases
(`push/not_already_set.rb`, `push/block_raises_error.rb`).

**Decision / chat** — the developer asked for the no-green-on-arrival rule to be stated
before deciding. It was stated in full, including the two bounds the rule places on
itself: keeping such a behavior is a deliberate human decision rather than the default,
and the rule is a design concern that does not reach coverage, where green-on-arrival is
inevitable and correct. The developer then chose to cover **all three**.

## Pass 8 — Controls, the already-unset coverage

**Hinge** — what the block does in the already-unset coverage test.

**Options** — an empty block (the literal reading of the described behavior), a block
that sets the variable, or both as two cases. The discrimination argument was decisive:
with an empty block the variable is absent before, during, and after, so the
implementation's `ENV.delete(name)` restore branch could be deleted outright and the test
would still pass; with a block that sets the variable, removing that branch fails it.

**Decision / chat** — the developer chose **the block sets the variable**.

The return-value coverage was generated straight through as mechanical rather than gated:
same actuation, same controls, settled observation form, one assertion added to the
existing test file.

## Pass 9 — Observation, the raising-block coverage

**Hinge** — what the raising-block coverage test observes. The comparison against the
control value is forced rather than chosen, since the actuation raises through and has no
return value to compare against.

**Options** — restoration only (matching `push/block_raises_error.rb`, keeping the two
block forms' coverage symmetric), or restoration and the error's propagation out of
`unset`, protecting the block form's error transparency against a later `ensure`-to-`rescue`
change.

**Decision / chat** — the developer chose **restoration only**.

## Pass 10 — Naming

**Hinge** — the name of each of the five outcomes. Each is a single assertion over values
already in scope, so the context-only-for-local-instrumentation rule puts the name on the
`test` itself rather than in a wrapping context — that placement was mechanical, not
gated. The two refutations could not take the "Is" prefix, which the test-name-is-prefix
rule reserves for value-equals comparisons.

**Options** — three candidate names per outcome.

**Decision / chat** — the developer chose "Does not exist within the block", "Restored to
the recorded value", "Is the value before unsetting" (the name the existing `unset.rb`
already uses for the same outcome of the no-block form), "Still unset after the block",
and "Restored despite the error".

## Outcome

`EnvVar.unset` takes an optional block. It records the variable's value, removes the
variable from the environment, calls the block, and restores the recorded value
afterward — through `set` when there was a value, `ENV.delete` when there wasn't — inside
an `ensure`, so a raising block still restores. It returns the prior value, with or
without a block.

`test/automated/unset.rb` moved to `test/automated/unset/unset.rb`, joined by
`block.rb`, `not_already_set.rb`, and `block_raises_error.rb`. The README documents the
block form and states that unset removes the variable rather than emptying it.

Suite: 24 tests, 24 passed, 0 failed.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 9 AM PDT
Changed by Scott Bellware on Fri Jul 24 2026 at 9 AM PDT
