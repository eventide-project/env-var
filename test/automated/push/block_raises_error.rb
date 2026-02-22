require_relative "../automated_init"

context "Push" do
  context "Block raises an error" do
    control_var_name = EnvVar::Controls::VariableName.random
    control_value = SecureRandom.hex

    initial_value = SecureRandom.hex
    ENV[control_var_name] = initial_value

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Initial Value: #{initial_value.inspect}"

    begin
      EnvVar.push(control_var_name, control_value) do
        raise
      end
    rescue
    end

    context "Restored value" do
      restored_value = ENV[control_var_name]

      comment "#{restored_value.inspect}"
      detail "Control: #{initial_value.inspect}"

      test "Is the initial value" do
        assert(restored_value == initial_value)
      end
    end
  end
end

