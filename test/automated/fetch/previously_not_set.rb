require_relative "../automated_init"

context "Fetch" do
  context "Previously Not Set" do
    control_var_name = "TEST_#{SecureRandom.hex}"

    context do
      detail "Environment variable: #{ENV[control_var_name].inspect}"

      assert_raises(KeyError) do
        EnvVar.fetch(control_var_name)
      end
    end
  end
end
