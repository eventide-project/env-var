require_relative "../automated_init"

context "Push" do
  context "Not Already set" do
    control_var_name = "TEST_#{SecureRandom.hex}"
    control_value = SecureRandom.hex

    already_set = ENV.keys.include?(control_var_name)

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Already Set: #{already_set.inspect}"

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
