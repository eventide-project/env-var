require_relative "automated_init"

context "Unset" do
  control_var_name = EnvVar::Controls::VariableName.random
  control_value = SecureRandom.hex

  ENV[control_var_name] = control_value

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{control_value.inspect}"

  result = EnvVar.unset(control_var_name)

  environment_value = ENV[control_var_name]

  context "Current value" do
    comment environment_value.inspect

    test do
      assert(environment_value.nil?)
    end
  end

  context "Result" do
    comment result.inspect
    detail "Control: #{control_value.inspect}"

    test "Is the value before unsetting" do
      assert(result == control_value)
    end
  end
end
