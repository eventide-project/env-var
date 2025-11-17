# Notes

- Set an env var value
- Push/pop from stack
- Block form of pushing and popping
- Pushing sets
- Popping unsets
- Pushing saves the previous value of the env var
- Popping restores an env var to its saved value
- Restoring an env var that did not originally exist will ENV.delete the variable
- Unset an env var value (ENV.delete('MY_VARIABLE'))
- accept either a single key/value, or a hash
- Consider alternatives for "push" that convey that we're more or less establishing a context, and then restoring the prior context from the saved value (there may be no better name than "push", but this deserves some thought. Pablo suggests "set".)

Storage
- A hash whose keys are env var names (strings) and values are arrays
- The arrays will be treated like stacks with Array.push and Array.pop

Exceptional cases
- Boolean values (support false, "false", "0", "on")
- nil deletes the env var (does this matter?)
- Key error when using fetch, ie: 'fetch': key not found: "something" (KeyError)
- Data types must be string (perhaps subject of future elaboration)

Example

EnvVar.push("USER", "something")
previously_pushed_value = EnvVar.pop("USER")



EnvVar.push("USER", "something") do
  test do
    # ...
  end
end # <- pop happens here

EnvVar.push("USER", "something") do
  EnvVar.push("SECRET", "something else") do
    test do
      # ...
    end
  end
end

env_vars = {
  "USER": "something",
  "SECRET": "something else"
}

EnvVar.push(env_vars) do
  test do
    # ...
  end
end


Work Sequence
√- EnvVar.set
  - generate a random env var name so that we're not concerned with original value (test) (controls: EnvVar::Random.example (eg: TEST_HJJKGG678675BGGG)
  - set it (test setup)
  - retrieve (operational)
  - check it (test)
  - restore it to original value (test)
√- EnvVar.unset
  - generate a random env var name so that we're not concerned with original value (test) (controls: EnvVar::Random.example (eg: TEST_HJJKGG678675BGGG)
√- EnvVar.get
√- EnvVar.fetch

=> - Clarify usability of test output
  - Review the output objectively
  - Assess solubility

- EnvVar.push
  √- Case: Without block
    - Raise an argument error

  √- Case: Push to existing env var (use stable var name)
    - generate a random env var name so that we're not concerned with original value (test)
    - set the env var to a control value
    - push a new control value
    - check: use block to test that the variable has the new value
    - check: environment has reset to original value

  =>- Case: Push to non-existing env var (use random var name)
    - generate a random env var name so that we're not concerned with original value (test)
    - do not set the env var to a control value
    - push a new control value
    - check: environment has reset to original value

    - set it (operational)
    - check recorded value in EnvVar's data (test)
    - check value of env var in the environment (test)
    - restore it to original value (test)

  - Case: Block raises an error
      - Ensure reset if exception happens in block

  - Push a hash. Treat each key/value as an individual env var.

- "Previously" is grandiose
  - Maybe just "already"
