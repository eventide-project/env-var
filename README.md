# EnvVar

Temporarily set environment variable values by treating the environment as a stack, and using blocks to control scope

## Example

```ruby
ENV["SomeEnvVar"] = "some original value"

EnvVar.push("SomeEnvVar", "some new value") do
  # The SomeEnvVar environment value is "some new value" inside this block
  p ENV["SomeEnvVar"] # => "some new value"
end

# The SomeEnvVar environment value is restored to the original value at the end of the block
p ENV["SomeEnvVar"] # => "some original value"
```

## Pushing a Change to an Environment Variable

```ruby
push(variable_name, value, &action)
```

```ruby
EnvVar.push("SomeEnvVar", "some new value") do
  # The SomeEnvVar environment value is "some new value" inside this block
end
```

If the environment variable already exists in the environment, its value will be preserved and then restored at the conclusion of the action block. If the environment variable does not already exist, then it will be declared in the environment, and then unset at the conclusion of the action block.

**Returns**

A dictionary of the environment variable name and the environment variable's original value. The dictionary's type is `Hash`.

**Parameters**

| Name | Description | Type |
| --- | --- | --- |
| variable_name | The name of the environment variable whose value will be affected | String |
| value | The value to assign to the environment variable | String |
| action | The block to be executed in the context of the new environment variable value | Proc |

## Pushing a Change to a Set of Environment Variables

```ruby
push(hash, value, &action)
```

```ruby
new_values = {
  "SomeEnvVar" => "some new value",
  "SomeOtherEnvVar" => "some other new value",
}

EnvVar.push(new_values) do
  # The SomeEnvVar environment value is "some new value" inside this block
  # The SomeOtherEnvVar environment value is "some other new value" inside this block
end
```

If an environment variable already exist in the environment, its value will be preserved and then restored at the conclusion of the action block. If an environment variable does not already exist, then it will be declared in the environment, and then unset at the conclusion of the action block.

**Returns**

A dictionary of the environment variable names and the environment variables' original values. The dictionary's type is `Hash`.

**Parameters**

| Name | Description | Type |
| --- | --- | --- |
| hash | The dictionary of environment variable names whose values will be affected, and the new values | Hash |
| action | The block to be executed in the context of the new environment variable values | Proc |

## License

The `EnvVar` library is released under the [MIT License](https://github.com/eventide-project/env_var/blob/master/MIT-License.txt).
