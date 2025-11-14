require_relative "../automated_init"

context "Fetch" do
  context "Previously Not Set" do
    control_var_name = Controls::VariableName.random

    comment "Environment Variable: #{control_var_name.inspect}"

    test "Is an error" do
      assert_raises(KeyError) do
        EnvVar.fetch(control_var_name)
      end
    end
  end
end
