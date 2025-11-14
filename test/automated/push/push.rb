require_relative "../automated_init"

context "Push" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  initial_value = SecureRandom.hex
  ENV[control_var_name] = initial_value

  environment_value = nil
  result = EnvVar.push(control_var_name, control_value) do
    environment_value = ENV[control_var_name]
  end

  context do
    comment "Value: #{environment_value.inspect}"
    detail "Control: #{control_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end

  context "Restored value" do
    restored_value = ENV[control_var_name]

    comment "#{restored_value.inspect}"
    detail "Control: #{initial_value.inspect}"

    test do
      assert(restored_value == initial_value)
    end
  end

  context do
    test do
      assert(result == initial_value)
    end
  end
end
