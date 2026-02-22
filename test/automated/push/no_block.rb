require_relative "../automated_init"

context "Push" do
  context "No block" do
    control_var_name = EnvVar::Controls::VariableName.random
    control_value = SecureRandom.hex

    test "Is an error" do
      assert_raises(EnvVar::Error) do
        EnvVar.push(control_var_name, control_value)
      end
    end
  end
end

