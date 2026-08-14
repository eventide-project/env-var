# A precondition documents the factors that decide a test's outcome, and its predicate reads inline

A **precondition** is an `assert` or `refute` that is **not** a test. It sits in a context
beside the controls and the actuation rather than inside a `test` block.

**Its purpose is to clarify the deciding factors.** A test's outcome is determined by
conditions and factors that are frequently **not clearly expressed in the test script** —
most often the **controls**. A control is named for itself, not for the properties of the value it produces. `Controls::Account::Sequence.example` says nothing about which positions
that account has already processed.

The definition that would say so lives in another file. The factor that actually decides the outcome is therefore absent from the script the
reader is reading. **A precondition puts it there.**

```ruby
handler = Handlers::Commands::Transactions.new

deposit = Controls::Commands::Deposit.example

account = Controls::Account::Sequence.example

assert(account.processed?(deposit.metadata.global_position))

handler.store.add(account.id, account)

handler.(deposit)

test "Deposited Event is not Written" do
  assert(deposited.nil?)
end
```

No event is written **because** the account has already processed that global position.
Nothing in `Controls::Account::Sequence.example` shows that, so without the precondition the
reader has the outcome and no account of what produced it. The precondition states the
deciding factor where it is needed.

**It documents by asserting, and that is why it is an assertion rather than a comment.** Prose narration could state the same factor, and would never be checked. It can drift from the control it describes and go on reading as true long after it stopped being so. An
assertion states the factor **and** verifies it, so this documentation cannot become false
without the suite saying so. Documentation that is checked is the whole reason a deciding
factor is written as an assertion.

**It qualifies the test rather than preventing a regression.** A test observes an outcome of the
unit under test and prevents its regression. A precondition observes nothing about
that unit — it states what must already be true for the test's observation to mean anything.
That decides how a failure reads: **when a precondition fails, the test's result is
meaningless, not wrong.** The unit may be perfectly correct. The test simply did not exercise
what it claims to.

**Where one is warranted:** ask what determines this outcome, and whether the script shows
it. Where a deciding factor is legible on the page, a precondition adds nothing. Where it sits
inside a control, in a prior state, or in a derivation the reader cannot see, surfacing it is
the precondition's job.

A consequence follows from the same gap, and it is worth naming because it is the sharpest
form of the problem. **Where a deciding factor is invisible, a test can pass without
exercising what it names.** A value is already present before the actuation set it. A connection
is already open. A search finds nothing, so the assertion is made against nothing and passes
vacuously.

Documenting the factor closes that too. But the criterion is the legibility of the
deciding factors, not only the risk of a vacuous pass.

```ruby
context "Database Connection" do
  session = MessageStore::Postgres::Session.build

  refute(session.connected?)

  test "Connects on first use" do
    refute_raises do
      session.execute('SELECT 1;')
    end
  end
end
```

**The predicate reads inline — no explaining variable.** The assertion's own expression
carries the condition, read as a sentence at the point it is written:
`refute(session.connected?)` is *the session is not connected*.
`assert(account.processed?(deposit.metadata.global_position))` is *the account has processed
that position*.

**This is a deliberate exception to the test-block-is-assertion-only rule**,
which requires every operand inside a `test` block to be bound to an explaining variable
first. Neither of that rule's reasons reaches a precondition: it has one operand, so nothing is buried in a nested expression to be parsed inside-out. A name bound for it would only restate the predicate — `connected = session.connected?` in front of `refute(connected)` adds a line and no information. **A precondition carries no name because its expression is the
name.**

**A block is an expression.** Where the deciding factor is that an actuation completes,
`assert_raises` and `refute_raises` take a block, and that block is the precondition's
expression. The discipline is unchanged: nothing is bound, nothing is named, and the
actuation is written in place rather than behind a variable.

**It sits immediately before what it qualifies.** Before the **actuation** when it documents a
factor in the controls or in a prior state. Before the **test** when it documents a factor in
a value derived from the result. The two are the same construct in the same relation — the
precondition stands directly ahead of the thing whose meaning depends on it.

```ruby
deposit_message = write.one_message do |written|
  written.instance_of?(Messages::Commands::Deposit)
end

refute(deposit_message.nil?)

test "Deposit message follows previous message" do
  assert(deposit_message.follows?(previous_message))
end
```

**It is not coverage, and it prevents nothing.** A precondition asserts over the controls, a
prior state, a derivation, or **the actuation's completion where the controls are what decide
it**. It never asserts over the unit's behavior as an outcome. So it is outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for. Nothing about
the unit is established by one passing.

**The line is what the assertion is for, not what it is written over.** `refute_raises`
around an actuation is a **precondition** in one case. The controls are set so the actuation
would ordinarily fail, something in that setup averts it, and the script does not show
as much. It is a **test** when whether the unit raises is the thing being established. The
same expression serves the two of them, and only its purpose separates them.

```ruby
control_destination = Controls::Constant.example(
  name: "Destination",
  inner_constants: [control_excluded_constant_name]
)

refute_raises do
  Constant::Import.(control_source, control_destination, except: control_excluded_constant_name)
end
```

The destination owns the excluded name, so without `except:` the import is refused. Nothing
else in the script says so, and every outcome below depends on it.

**Why:** a test script is read to learn what its outcome depends on. The controls convention deliberately
puts the construction of example values behind a name. So the factors that decide the outcome are
frequently the ones least visible at the test. A test whose deciding factors are invisible cannot be read. The reader sees an outcome asserted and no account of what produced it. In its worst form it passes without exercising what it
names, and reports prevention that is not there.

Writing the factor as an assertion rather than
a comment is what makes the clarification trustworthy. A comment claims, and an assertion is
checked. So the documentation and the fact cannot drift apart in silence.

Keeping it a bare assertion rather than a named test is what keeps the two legible as different things. A named
test claims the unit behaves a certain way. A precondition claims only that the ground the
test stands on is the ground it appears to.

**How to apply:** when writing or reading a test, ask what determines its outcome. Ask whether
the script shows it. Look first at the controls, whose values are named rather than
described.

Where a deciding factor is not expressed, write a bare `assert` or `refute` stating
it. Where the factor is that an actuation completes, write a bare `assert_raises` or
`refute_raises` instead. Read its predicate inline, with no explaining variable.

Place it
immediately before what it qualifies. That is the actuation for a factor in the controls or a prior state. It is the test for a factor in a derived value.

Do
not wrap it in a `test` block, do not name it, and do not bind its operand. Do not write it as a
`comment` instead. An unchecked statement of a deciding factor is the thing this replaces.

An actuation's completion may be the thing being established, rather than the ground a later observation stands on. That is a test. It belongs
in a `test` block.

Related:

- the controls-not-factories-fixtures-arrange rule and the `control_` test-variable prefix rule — the controls whose values a precondition most often documents
- the test-block-is-assertion-only rule — the explaining-variable discipline this is a stated exception to
- the tdd-test-structure rule — the control → actuate → observe shape a precondition sits within
- the context-only-for-local-instrumentation rule — the other thing a context holds beside a test
- the do-not-test-the-platform rule — the boundary a precondition is not to be confused with

---

Authored by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 4:20:47 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:08:21 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:34:58 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
