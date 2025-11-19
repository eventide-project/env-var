require_relative "../automated_init"

context "Push" do
  context "Non-existing environment variable" do
    control_var_name = "TEST_#{SecureRandom.hex}"
    control_value = SecureRandom.hex

    comment "Environment Variable: #{control_var_name.inspect}"

    environment_value = nil
    result = EnvVar.push(control_var_name, control_value) do
      environment_value = ENV[control_var_name]
    end

    context "Pushed Value" do
      comment environment_value.inspect
      detail "Control: #{control_value.inspect}"

      test "Is the current environment value" do
        assert(environment_value == control_value)
      end
    end

    context "Restored value" do
      restored_value = ENV[control_var_name]

      comment "#{restored_value.inspect}"

      test "Is nil" do
        assert(restored_value.nil?)
      end
    end

    context "Result" do
      comment result.inspect

      test "Is nil" do
        assert(result.nil?)
      end
    end
  end
end
