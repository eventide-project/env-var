# A context block is used for a test block only when the test's outcome needs local instrumentation or local variables

Source: system/testing/source/a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables.md

Trigger: When creating or editing a file under `test/`

1. Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`.
2. Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly.
3. Local instrumentation means an explaining variable of the outcome's own.
4. Local instrumentation also means a `comment` or `detail` specific to that outcome.
5. Also use a named `context` where it is a leading `When …` condition, promoted to a context per the an-error-test-is-named-fails-and-its-condition-is-a-context rule.
6. The `When` exception covers only a leading `When …`.
7. A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test.
8. An outcome name that merely contains "when" is not a condition context. Examples are `"Created when the file is accepted"` and `"Located when the response carries a location"`.
9. Such a name is written as a directly named test, as in `test "Created when the file is accepted" do …`.
10. When the outcome is a single assertion over values already in scope, name the `test` directly and use no context.
11. Values already in scope are the shared controls and actuation.

```ruby
# No local setup needed → named test, no context
test "Is the location the response carries" do
  assert(location == control_location)
end

# Local explaining variable / detail needed → context holds it
context "Status" do
  status = result.status
  detail status.inspect
  test do
    assert(status == 201)
  end
end
```

12. When flattening an over-nested test, flatten only where there is no code between the context and the `test`, so the context holds nothing but the test.
13. Do not flatten a context that is a leading `When …` condition.
14. This is how the tests the agent writes are shaped. It is not a ban on a context that holds only a test.
15. Where the agent finds such a context, in a test it reads or is asked to change, it does not flatten it on its own. It warns the engineer instead.
16. The warning names the file and the context. It says that the context holds only a test, whose name could sit on the test.
17. The warning offers two choices: flatten the context, or suppress these warnings from then on.
18. Several such contexts found in one turn take one warning.
19. Flatten only on the engineer's choice.
20. On the choice to suppress, write `local/rules/<timestamp>-a-lone-test-context-is-not-warned-about.md`. It says that this project gives no warning of a context that holds only a test.
21. Local rules are read at every session start, so the suppression holds from then on. Deleting the file restores the warnings.
22. Where that local rule exists, give no warning. The tests the agent writes still take this rule's shape.
23. A leading `When …` condition context is never warned of.

# A control-built test value is prefixed with control_

Source: system/testing/source/a-control-built-test-value-is-prefixed-with-control.md

Trigger: When creating or editing a file under `test/`

1. In test code, a control is anything from `Controls::*`.
2. Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`.
3. This applies whenever you write or edit a test.
4. Do not give such a local a bare name, such as `value` or `name`.

# A control's string value starts with "some"

Source: system/testing/source/a-controls-string-value-starts-with-some.md

Trigger: When creating or editing a file under `test/`

1. A control may hold a string value: a literal used as test input, not a constant name.
2. The string value starts with "some", as in `control_file = "some file"`, not `"a file"`.
3. "some" marks the value as an arbitrary placeholder whose content does not matter.
4. A bare string value is lowercase: `"some file"`, `"some other file"`.
5. This differs from example constant names, which are capitalized: `"SomeModule"`, `"SomeOtherModule"`.
6. Write `control_file = "some file"` for a placeholder string value. Write each further placeholder in the "some other …" form, as in `"some other file"`.
7. Use specific string content only when the test actually depends on it.
8. Non-string placeholder values, such as a number, are not covered, because they have no "some" form.
9. "some …" names something that exists. A placeholder for something that does not exist takes the form "some missing …", as in `"some-missing-project"`.

# A feature with one case has one test file, named for the feature

Source: system/testing/source/a-feature-with-one-case-has-one-test-file-named-for-the-feature.md

Trigger: When creating or editing a file under `test/`

1. When a feature has only one case, its test is a single file named for the feature.
2. The file sits directly under the feature context. Example: `test/automated/upload/status.rb`, under `context "Upload" do; context "Status" do`.
3. Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`).
4. The folder-with-case-files form is reserved for features with multiple cases.
5. Examples: `rejected/empty.rb` with `rejected/refused.rb`, or `result/located.rb` with `result/unlocated.rb`.
6. In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`.
7. A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against.
8. You may start a feature's test wherever is convenient, before its case set is settled.
9. Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature.
10. When collapsing, fix the `require_relative` depth to match.
11. Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case.

# A feature's normal path and its exceptional paths are separate test files

Source: system/testing/source/a-features-normal-path-and-its-exceptional-paths-are-separate-test-files.md

Trigger: When creating or editing a file under `test/`

1. A feature's normal path is its ordinary, non-raising course through it.
2. The normal path's test and each exceptional path's test live in separate files.
3. A feature with one normal path and one exceptional path is two files. It is not one file with two contexts.
4. An exceptional path cannot share the normal path's actuation. Its actuation is inside an `assert_raises` and produces no result to observe.
5. Naming follows the existing file conventions.
6. The normal-path file is named for the feature.
7. Each exceptional-path file is named for the condition under which the actuation fails.
8. That condition is also promoted to a `context` inside the exceptional-path file.
9. The test in that context is named `Fails`. See the an-error-test-is-named-fails-and-its-condition-is-a-context rule.
10. An exceptional-path file holds only its one exceptional case.
11. An exceptional-path file does not re-prove the normal path.
12. Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating.
13. Discriminating means the raised error can be told from a different failure of the same class.
14. Do not add a second, raising actuation to a normal-path file.

# A high-level context names a behavior, never a method

Source: system/testing/source/a-high-level-context-names-a-behavior-never-a-method.md

Trigger: When creating or editing a file under `test/`

1. A test's high-level context names a behavior.
2. A high-level context does not name a method. A method name is an implementation.
3. A high-level context does not name a class's internal structure.
4. `context "Call"` names the method `call` and states nothing about what the unit does.

## The requirement is firm at the top and relaxes with depth

1. The requirement applies more firmly at higher contexts and more permissively at deeper ones.
2. The higher a context sits, the more firmly it names a behavior.
3. The unit's own context and the contexts directly under it must not name a method.
4. A deeper context may name an implementation element when it describes one part of how the behavior is carried out.
5. The a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate rule is that case. `context "Defined Predicate"` sits inside the behavior it qualifies.
6. No fixed level marks the change. The writer judges where a context has begun to describe the implementation.
7. Prefer a behavior at every level.
8. A deep context that can name a behavior still names one.

## Where the root test sits

1. A unit's root test has no second-level context.
2. The root test sits directly under the unit's own context.
3. The root test's outcome context carries the name of the unit's central behavior.
4. Each subsequent test takes a second-level context named for the behavior it covers.
5. A root test lives at `test/automated/<unit>.rb`.
6. A subsequent behavior lives at `test/automated/<unit>/<behavior>.rb`.

# A precondition documents the factors that decide a test's outcome, and its predicate reads inline

Source: system/testing/source/a-precondition-documents-the-factors-that-decide-a-tests-outcome-and-its-predicate-reads-inline.md

Trigger: When creating or editing a file under `test/`

1. A precondition is an `assert` or `refute` that is not a test.
2. It sits in a context beside the controls and the actuation, not inside a `test` block.
3. Its purpose is to state the factors that decide a test's outcome when the test script does not clearly express them.
4. Those factors are most often in the controls. A control is named for itself, not for the properties of the value it produces.
5. `Controls::Account::Sequence.example` says nothing about which positions that account has already processed. The definition that would say so is in another file.

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

6. Here no event is written because the account has already processed that global position. The precondition states that factor where it is needed.
7. Write the deciding factor as an assertion, not as a comment. An assertion states the factor and also verifies it, so it cannot silently become false.
8. A precondition qualifies the test. It does not prevent a regression, and it observes nothing about the unit under test.
9. When a precondition fails, the test's result is meaningless, not wrong. The unit may be correct, but the test did not exercise what it claims to.
10. To decide whether one is warranted, ask what determines the outcome and whether the script shows it.
11. Where a deciding factor is legible on the page, do not add a precondition.
12. Where the factor sits inside a control, in a prior state, or in a derivation the reader cannot see, write a precondition that surfaces it.
13. Where a deciding factor is invisible, a test can pass without exercising what it names. Examples: a value already present, a connection already open, a search that finds nothing.
14. The criterion is whether the deciding factors are legible, not only the risk of a vacuous pass.

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

15. Write the predicate inline, with no explaining variable. The assertion's own expression carries the condition and reads as a sentence.
16. `refute(session.connected?)` reads as *the session is not connected*. `assert(account.processed?(deposit.metadata.global_position))` reads as *the account has processed that position*.
17. This is a deliberate exception to the a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context rule, which requires every operand inside a `test` block to be bound to an explaining variable.
18. That rule does not apply because a precondition has one operand, and a bound name would only restate the predicate.
19. Do not write `connected = session.connected?` in front of `refute(connected)`. A precondition carries no name, because its expression is the name.
20. Where the deciding factor is that an actuation completes, use `assert_raises` or `refute_raises` with a block. The block is the precondition's expression.
21. In that block, bind nothing and name nothing. Write the actuation in place, not behind a variable.
22. Place the precondition immediately before what it qualifies.
23. Place it before the actuation when it documents a factor in the controls or in a prior state.
24. Place it before the test when it documents a factor in a value derived from the result.

```ruby
deposit_message = write.one_message do |written|
  written.instance_of?(Messages::Commands::Deposit)
end

refute(deposit_message.nil?)

test "Deposit message follows previous message" do
  assert(deposit_message.follows?(previous_message))
end
```

25. A precondition may assert over the controls, a prior state, a derivation, or the actuation's completion where the controls decide it.
26. It never asserts over the unit's behavior as an outcome. It is not coverage, and a passing one establishes nothing about the unit.
27. It falls outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for.
28. Whether an assertion is a precondition or a test depends on its purpose, not on what it is written over.
29. `refute_raises` around an actuation is a precondition when the controls would ordinarily make the actuation fail, the setup averts that, and the script does not show it.
30. It is a test when whether the unit raises is the thing being established. Put that in a `test` block.

```ruby
control_destination = Controls::Constant.example(
  name: "Destination",
  inner_constants: [control_excluded_constant_name]
)

refute_raises do
  Constant::Import.(control_source, control_destination, except: control_excluded_constant_name)
end
```

31. Here the destination owns the excluded name, so without `except:` the import is refused. Nothing else in the script says so.
32. When writing or reading a test, look at the controls first, because their values are named rather than described.
33. Do not wrap a precondition in a `test` block. Do not name it, and do not bind its operand.
34. Do not write a deciding factor as a `comment` in place of a precondition.

# A predicate method's test context is its name followed by the word "Predicate"

Source: system/testing/source/a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate.md

Trigger: When creating or editing a file under `test/`

1. A predicate method is a `?`-suffixed, boolean-returning method.
2. Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate".
3. Titlecase the method's name before appending "Predicate".
4. `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.
5. Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".
6. Keep the `?` out of a `context` label.

# A test actuates its concern once, and asserts each outcome in its own context

Source: system/testing/source/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md

Trigger: When creating or editing a file under `test/`

1. A test file has three layers: a feature context, a shared control-and-actuation block at its top, and inner contexts that each establish one outcome.
2. The outer `context` names the feature.
3. Everything for the feature lives inside the outer context.
4. Set up the controls and actuate once, at the top of the outer context.
5. State the inputs just above the actuation, built through controls (`Controls::File.example()`) or stated as literals.
6. Actuate the unit under test a single time.
7. Bind the actuation's result to an explaining variable.
8. Write the actuation from the efferent side, as use would express it.
9. The variables read as the scenario.

```ruby
file = Controls::File.example()
upload = Controls::Upload.example()

result = upload.(file)
```

10. Right after the actuation, narrate the salient values with `comment` for the reader of test output.
11. The narrated values are the inputs and the actuation result.
12. Write one inner `context` per outcome.
13. Each inner context establishes one distinct outcome of that single actuation.
14. Each inner context's title states the outcome it establishes.
15. Each inner context derives an explaining variable from the result.
16. An inner context may narrate its variable locally with `detail`.
17. Each inner context asserts its variable in a single `test` block.

```ruby
context "Status" do
  status = result.status
  detail status.inspect
  test do
    assert(status == 201)
  end
end
```

18. `comment` narrates scenario-wide values near the actuation.
19. `detail` narrates a value local to one inner context.
20. Each `test` block's assertion confirms the outcome its inner context's title states.

# A test block holds only the assertion, and its values are declared in the enclosing context

Source: system/testing/source/a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context.md

Trigger: When creating or editing a file under `test/`

1. Never inline a method call in an assertion.
2. Assign every value the assertion examines to an explaining variable first. This includes the actuation result and whatever it is compared against.
3. The assertion references only those explaining variables and the comparison itself.
4. A `test` block contains only the assertion: exactly one `assert`.
5. A `test` block contains no controls setup, no actuation, no variable assignment, and no value-producing method calls.
6. Declare explaining variables in the enclosing `context` block.
7. When a test introduces explaining variables, encase its `test` block in a `context` block that declares them.
8. In the enclosing `context`, declare the controls.
9. In the enclosing `context`, bind the actuation to an explaining variable.
10. In the enclosing `context`, bind any compared-against or expected value to its own explaining variable.
11. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion.

```ruby
# No — method call inlined in the assertion
test do
  assert(result == Upload::Result.build(control_response))
end

# Yes — operands are explaining variables declared in the context; test asserts only
context "..." do
  control_response = Controls::HTTP::Response.example
  control_file = Controls::File.example

  upload = Controls::Upload.example
  result = upload.(control_file)
  expected_result = Upload::Result.build(control_response)

  test do
    assert(result == expected_result)
  end
end
```

# A test file named with a leading underscore is suspended

Source: system/testing/source/a-test-file-named-with-a-leading-underscore-is-suspended.md

Trigger: When taking a test out of the suite, finding a failing test to set aside, or writing the code that selects a suite's test files

1. A leading underscore on a test file's name means the file is suspended.
2. `_upload.rb` is suspended and `upload.rb` is not.
3. A suite run does not run a suspended file.
4. To suspend a test, rename its file with a leading underscore. Suspending is a rename and nothing else.
5. The file stays where it is.
6. Change nothing inside the file.
7. To take the test back into the suite, remove the underscore.
8. Do not delete a test to get it out of the suite.
9. Do not leave a failing test in the suite.

## Suspended here means paused, not stopped

1. This is the `Suspended` state's sense: paused, not ended.
2. The file is kept, and it is expected to run again.
3. It is not a suspension in the sense of the `foundation` a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule. That rule governs something done, stopped, and removed.
4. A suspended test is removed from nothing.
5. Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed.
6. Suspending a test is an ordinary decision. The log's own trigger applies to it like any other.

## The mark is in the filename because that is what a suite reads

1. The suspension mark goes in the filename, not inside the file.
2. A suite selects its files by name, by expanding a pattern over the test directory.
3. The underscore does not exclude itself. Expect this failure.
4. A shell glob skips a leading dot but not a leading underscore. `*.rb` returns `_upload.rb` along with the rest.
5. A language's own test-file discovery usually does not skip the underscore either.
6. Whatever runs the suite excludes files whose names begin with an underscore.
7. Write that exclusion explicitly, because the pattern does not do it.
8. Do not use a dot-prefixed name for suspension. It would hide the file from directory listings and editor file trees.
9. A suspended test should stay visible and be passed over.

# A test report classifies the suite and prints its context hierarchy

Source: system/testing/source/a-test-report-classifies-the-suite-and-prints-its-context-hierarchy.md

Trigger: When the user asks for a test report, as with `/test report` or `/test-report`

1. This rule applies when the user asks for a **test report**.
2. Classify the automated suite along the lenses below.
3. Then print the context hierarchy two levels deep.
4. Re-derive everything from the current files, the context hierarchy included.
5. Read the tests and recompute membership and counts.
6. Do not report stale buckets from memory.
7. The lenses are fixed. The buckets are whatever the current suite yields.
8. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out), rather than asserting it.
9. Produce the sections below, in the order given.
10. Keep each section tight.
11. Do not write the report to a file.

## 1. Generations / styles

1. The suite may have coexisting conventions, an older style alongside a newer one.
2. Split the files by which convention they follow.
3. Name the cleanest mechanical tell.
4. One such tell is actuation placement: captured in the controls, or performed inside the test block.
5. If the suite is uniform, say so and skip this section.

## 2. By subject under test

1. Group by the unit each test targets.
2. Give the file count per group.

## 3. By structural style

1. Use these styles:
   - single-outcome leaf — one capability, one assertion
   - multi-outcome with fan-out — a loop generating one sub-context per case
   - multi-outcome flat — sibling outcomes, no loop

## 4. By assertion kind

1. Classify as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`.
2. Note the error classes in play.

## 5. Other factors

1. Report topology pairs (e.g. top-level vs nested for the same method).
2. Report normal-path vs error outcomes.
3. Report controls usage.

## 6. Context hierarchy, two levels deep

1. Show each distinct top-level context, with its distinct second-level contexts nested beneath.
2. Render it as an indented tree (`├─`/`└─`), as the status-report rule (in `foundation`) describes.
3. Stop at two levels.
4. Do not run the suite for this report.
5. Take the hierarchy from the `context "…"` declarations as written.
6. A dynamic `context <expr> do` shows as its expression.
7. A bare unnamed `test do` adds no context line.
8. A report on what a run produced is the test-tree command's, not this one's.

# A test run asked for runs the automated suite, or the interactive test named

Source: system/testing/source/a-test-run-asked-for-runs-the-automated-suite-or-the-interactive-test-named.md

Trigger: When the engineer asks for a test run, as with `/test` or `/test interactive`

1. `/test` runs the automated suite, every test under `test/automated/`, by the command the project's stack sets. Skip a file whose name begins with an underscore.
2. Report the automated tests passing or failing, never *the tests*. Where there are interactive tests, say they were not run. Report a failure with the test that failed and what it reported.
3. `/test interactive <test>` runs the one interactive test named, from `test/interactive/`. With none named, list them through the selection interface and ask which to run.
4. Run an interactive test only when the engineer asks for it. No other command runs one.
5. Report what an interactive test brought back. The engineer judges whether it passed.
6. `/test report` and `/test tree` run the test-report and test-tree commands. `/test-report` and `/test-tree` are their aliases.
7. With no automated suite, `/test` runs nothing, and says the project has no automated tests. That is not a failure.

# An error test is named Fails, and its condition is a context

Source: system/testing/source/an-error-test-is-named-fails-and-its-condition-is-a-context.md

Trigger: When writing or naming a test that asserts an actuation raises an error or does not raise

1. When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails".
2. When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail".
3. Do not put the condition under which the actuation fails, or doesn't, in the test name.
4. Promote that condition to a `context` that encloses the test and names the condition as a "When …" clause.
5. A test name that wants the word "when" signals a condition. Lift that "when" clause into an enclosing `context`, and name the test "Fails" or "Doesn't fail".

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

6. Several conditions over the same actuation may sit as sibling `When …` contexts, each with its own `test "Fails"`.
7. An error test always takes an enclosing context, because the context carries the condition.

# Assert an error message only when it alone confirms the error

Source: system/testing/source/assert-an-error-message-only-when-it-alone-confirms-the-error.md

Trigger: When writing an `assert_raises` or deciding whether to assert an error's message

1. Assert an error's message content only when the message is the only way to confirm the correct error was raised under the expected conditions.
2. Otherwise, do not assert the message.
3. Ordinarily, `assert_raises(SomeClass)` plus the test's condition setup already confirms the right error. The class identifies the failure, and the setup fixes the condition.
4. A message assertion in that ordinary case tests presentation, not behavior. A harmless reword would break it.
5. The message is the sole discriminator in only one situation: the same error class can be raised from multiple sites reachable in the same execution path.
6. In that situation, the class cannot show which site raised. The error may come from the intended condition or from an incidental one elsewhere in the path.

## Deciding for each `assert_raises`

1. For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*
2. If no, class and condition suffice. Assert no message.
3. Example of no: the empty-file guard's lone `Upload::Error`, with one `raise` site on the empty-file path.
4. Example of no: a response check that always raises from a single line.
5. If yes, the message is the discriminator. Assert its exact content.
6. Example of yes: a multi-part `Upload#call` can raise `Upload::Error` at the head part or the tail part. The message (which part, which response) confirms the intended failure.
7. Example of yes: a two-step upload can raise `Upload::Error` from the initial post's "rejected" site or the finalize step's "rejected" site.

# Do not test the platform

Source: system/testing/source/do-not-test-the-platform.md

Trigger: When creating or editing a file under `test/`

1. Test the library's own behavior and decisions, not the language or system it sits on.
2. A unit is a transparent pass-through on a path only when it just forwards to a platform primitive. It adds no branch, guard, normalization, or policy there.
3. On such a path, the unit's behavior is the platform's, so a test there tests the platform, not the library.
4. The signal: you can state the expected behavior only through the primitive's guarantee ("`String#empty?` returns true for an empty string").
5. When that signal holds and the unit adds nothing of its own on that path, nothing of ours is at risk, so write no test.
6. Example: `Upload#empty?(file)` is `file.empty?`, which forwards to the string primitive and adds no branch, guard, or normalization.
7. Its emptiness behavior is therefore `String#empty?`'s exactly: true for `""` and false for any other content.
8. Once `#empty?` has been decided to stay transparent to Ruby, there is no library emptiness behavior. An "empty string is empty" test would only test Ruby.
9. When a unit has been decided to stay transparent to the platform, the resolution is that decision, not a test.
10. When a unit adds a policy, that policy is the library's own decision, and it must be tested.
11. Example policies that must be tested: `Upload#call`'s guard `raise Error, "File is empty" if file.empty?`, which raises `Upload::Error` on an empty file. Others are a coercion that normalizes the file, and a suppressed warning.
12. Do not test the bare forwarding to the primitive underneath a tested policy, such as the `file.empty?` beneath those policies.

# Start a test name with "Is" only for a value-equals-comparator assertion

Source: system/testing/source/start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion.md

Trigger: When creating or editing a file under `test/`

1. Begin a test or context name with "Is" only when the test asserts that a value is some other comparator.
2. Such an assertion is an equality or identity comparison of a value against another value.
3. Do not begin the name with "Is" for any other kind of assertion.
4. Other kinds include a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect.
5. Name such a test for what it establishes.
6. Good examples, each asserting `value == <comparator>`:
   - `context "Is the final segment of the qualified name as a String"` → `assert(name == control_inner_constant_name.to_s)`
   - `context "Is the whole name as a String"` → `assert(name == control_value.name)`
7. Counter-examples, where "Is" is not used:
   - a predicate result — `context "Defined"` → `assert(defined)`
   - a returned value — `context "The defined constant is returned"`
   - a raised error — named `Fails`, per the an-error-test-is-named-fails-and-its-condition-is-a-context rule
   - an exclusion — `context "Excludes non-module inner constants"`
8. Before naming a context "Is …", look at its assertion.
9. If the assertion is `assert(a == b)`, or an identity comparison, "Is …" fits.
10. Otherwise, name the context for the outcome it establishes: the predicate, the presence, the exclusion, or the behavior.
11. Name a context for a raised error "Fails", per the an-error-test-is-named-fails-and-its-condition-is-a-context rule.

# Test context nesting mirrors the folder hierarchy

Source: system/testing/source/test-context-nesting-mirrors-the-folder-hierarchy.md

Trigger: When creating or editing a file under `test/`

1. A test file's context nesting mirrors the hierarchy of its folder path.
2. Each directory segment under `test/automated/` becomes a context.
3. Scenario contexts nest inside the folder contexts.
4. Test blocks nest inside the scenario contexts.
5. A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context.
6. A test at `test/automated/upload/retried.rb` opens `"Upload"` → `"Retried"`.
7. Do **not** flatten the hierarchy into a single combined context, such as `"Upload Rejected"`.
8. Leaf files within a feature folder, such as `rejected/empty.rb` and `rejected/refused.rb`, are distinct cases of the same feature.
9. Those leaf files share the folder-mirrored context nesting.
10. Leaf files are distinguished by their outcome-context titles.
11. Do not add an extra per-file context layer.
12. Nest the file's contexts in this order: one `context` per folder segment, then the scenario contexts, then the test blocks.
13. Each test block may have an optional context that scopes a local variable or a comment.
14. Keep the suite consistent with the existing `upload/` tests.

# Test values are controls, never factories, fixtures, or arrange

Source: system/testing/source/test-values-are-controls-never-factories-fixtures-or-arrange.md

Trigger: When creating or editing a file under `test/`

1. The known, deterministic inputs a test is built from are all **controls**.
2. Helpers that build example values are **controls**, never "factories".
3. The example values they produce, and any literal known inputs, are **controls** or control values, never "fixtures".
4. The setup phase, which establishes the known inputs before the actuation, is the **control** of the test.
5. Never call the setup phase "arrange" or "arrangement". The noun form carries the same meaning as the verb.
6. A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed.
7. Apply this in prose, comments, docs, and dialogue.
8. In talk about tests, never say "factory", "factories", "fixture", "fixtures", "arrange", or "arrangement".
9. Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures.

# The test tree command prints the suite's context tree

Source: system/testing/source/the-test-tree-command-prints-the-suites-context-tree.md

Trigger: When the user gives the command "test tree", or types `/test tree` or `/test-tree`

1. When the user gives the command **"test tree"**, or types `/test tree` or `/test-tree`, run the automated suite.
2. Print its structure as a **single normalized tree**.
3. The tree is the whole suite's `context`/`test` hierarchy.
4. Merge **duplicate outer context headings**, so each context path appears **once**.
5. Each outer context appears once, with each sub-feature once beneath it.
6. Show individual tests as leaves with a `•` prefix.
7. Put the pass/fail summary line at the end.
8. **Produce the tree from the run's output, not the source.**
9. Run the suite with narration output suppressed, capture the output, and parse that output.
10. Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate.
11. A dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder.
12. A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.
13. Use a durable script, so the command is reproducible in every session, rather than rebuilding a parser each time.
14. **Which script, and where it lives, is the project's stack's concern.**
15. The script runs the project's suite, suppresses that runner's narration, and parses that framework's output.
16. For a Ruby project, the `ext/ruby-lang` package's rule on running the suite settles the script.
17. This rule fixes only what the tree is and where it is derived from.
18. On a "test tree" request, run the project's durable tree script and present its output.
