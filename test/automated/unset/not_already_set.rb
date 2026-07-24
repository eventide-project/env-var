require_relative "../automated_init"

context "Unset" do
  context "Not already set" do
    control_var_name = EnvVar::Controls::VariableName.random
    control_value = SecureRandom.hex

    already_set = ENV.key?(control_var_name)

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Already Set: #{already_set.inspect}"

    EnvVar.unset(control_var_name) do
      ENV[control_var_name] = control_value
    end

    variable_exists = ENV.key?(control_var_name)

    comment "Variable Exists: #{variable_exists.inspect}"

    test "Still unset after the block" do
      refute(variable_exists)
    end
  end
end
