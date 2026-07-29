require_relative "../automated_init"

context "Unset" do
  context "Block" do
    control_var_name = Controls::VariableName.random
    control_value = SecureRandom.hex

    ENV[control_var_name] = control_value

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Initial Value: #{control_value.inspect}"

    variable_exists = nil

    original_value = EnvVar.unset(control_var_name) do
      variable_exists = ENV.key?(control_var_name)
    end

    restored_value = ENV[control_var_name]

    comment "Original Value: #{original_value.inspect}"
    comment "Restored Value: #{restored_value.inspect}"

    test "Does not exist within the block" do
      refute(variable_exists)
    end

    test "Restored to the recorded value" do
      assert(restored_value == original_value)
    end

    test "Is the value before unsetting" do
      assert(original_value == control_value)
    end
  end
end
