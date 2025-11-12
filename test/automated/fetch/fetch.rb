require_relative "../automated_init"

context "Fetch" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  ENV[control_var_name] = control_value

  environment_value = EnvVar.fetch(control_var_name)

  context do
    detail "Environment variable: #{ENV[control_var_name].inspect}"
    detail "Control: #{environment_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end
end
