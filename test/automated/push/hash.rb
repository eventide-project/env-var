require_relative "../automated_init"

context "Push" do
  context "Hash" do
    control_var_name_1 = Controls::VariableName.random
    control_var_name_2 = Controls::VariableName.random
    control_value_1 = SecureRandom.hex
    control_value_2 = SecureRandom.hex

    initial_value_1 = SecureRandom.hex
    initial_value_2 = SecureRandom.hex
    ENV[control_var_name_1] = initial_value_1
    ENV[control_var_name_2] = initial_value_2

    comment "Environment Variable 1: #{control_var_name_1.inspect}"
    comment "Initial Value 1: #{initial_value_1.inspect}"

    comment "Environment Variable 2: #{control_var_name_2.inspect}"
    comment "Initial Value 2: #{initial_value_2.inspect}"

    control_hash = {
      control_var_name_1 => control_value_1,
      control_var_name_2 => control_value_2
    }

    comment "Control Hash: #{control_hash.inspect}"

    pushed_value_1 = nil
    pushed_value_2 = nil
    EnvVar.push(control_hash) do
      pushed_value_1 = ENV[control_var_name_1]
      pushed_value_2 = ENV[control_var_name_2]
    end

    context "Value 1" do
      context "Pushed Value" do
        comment pushed_value_1.inspect
        detail "Control: #{control_value_1.inspect}"

        test "Is the current environment value" do
          assert(pushed_value_1 == control_value_1)
        end
      end

      context "Restored Value" do
        restored_value_1 = ENV[control_var_name_1]

        comment "#{restored_value_1.inspect}"
        detail "Control: #{initial_value_1.inspect}"

        test "Is the initial value" do
          assert(restored_value_1 == initial_value_1)
        end
      end
    end

    context "Value 2" do
      context "Pushed Value" do
        comment pushed_value_2.inspect
        detail "Control: #{control_value_2.inspect}"

        test "Is the current environment value" do
          assert(pushed_value_2 == control_value_2)
        end
      end

      context "Restored Value" do
        restored_value_2 = ENV[control_var_name_2]

        comment "#{restored_value_2.inspect}"
        detail "Control: #{initial_value_2.inspect}"

        test "Is the initial value" do
          assert(restored_value_2 == initial_value_2)
        end
      end
    end
  end
end
