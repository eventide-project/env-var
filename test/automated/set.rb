require_relative "automated_init"

context "Set" do
  control_var_name = EnvVar::Controls::VariableName.random
  control_value = SecureRandom.hex

  initial_value = ENV[control_var_name]

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{initial_value.inspect}"

  result = EnvVar.set(control_var_name, control_value)

  environment_value = ENV.fetch(control_var_name)

  context "Set value" do
    comment environment_value.inspect
    detail "Control: #{control_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end

  context "Result" do
    comment result.inspect
    detail "Control: #{control_value.inspect}"

    test "Is the set value" do
      assert(result == control_value)
    end
  end
end
