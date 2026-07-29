require_relative "../automated_init"

context "Unset" do
  context "Block raises an error" do
    control_var_name = Controls::VariableName.random
    control_value = SecureRandom.hex

    ENV[control_var_name] = control_value

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Initial Value: #{control_value.inspect}"

    begin
      EnvVar.unset(control_var_name) do
        raise
      end
    rescue
    end

    restored_value = ENV[control_var_name]

    comment "Restored Value: #{restored_value.inspect}"

    test "Restored despite the error" do
      assert(restored_value == control_value)
    end
  end
end
