require_relative "../automated_init"

context "Fetch" do
  context "Not Already Set" do
    control_var_name = Controls::VariableName.random

    previously_set = ENV.keys.include?(control_var_name)

    comment "Environment Variable: #{control_var_name.inspect}"
    comment "Already Set: #{previously_set.inspect}"

    test "Is an error" do
      assert_raises(KeyError) do
        EnvVar.fetch(control_var_name)
      end
    end
  end
end
