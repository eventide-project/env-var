require_relative "../automated_init"

context "Push" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  initial_value = SecureRandom.hex
  ENV[control_var_name] = initial_value

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{initial_value.inspect}"

  pushed_value = nil
  result = EnvVar.push(control_var_name, control_value) do
    pushed_value = ENV[control_var_name]
  end

  context "Pushed Value" do
    comment pushed_value.inspect
    detail "Control: #{control_value.inspect}"

    test "Is the current environment value" do
      assert(pushed_value == control_value)
    end
  end

  context "Restored value" do
    restored_value = ENV[control_var_name]

    comment "#{restored_value.inspect}"
    detail "Control: #{initial_value.inspect}"

    test "Is the initial value" do
      assert(restored_value == initial_value)
    end
  end

  context "Result" do
    initial_values = { control_var_name => initial_value }

    comment result.inspect
    detail "Control: #{initial_values.inspect}"

    test "Is the initial values" do
      assert(result == initial_values)
    end
  end
end
