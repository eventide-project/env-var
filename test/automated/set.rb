require_relative "automated_init"

context "Set" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  EnvVar.set(control_var_name, control_value)

  environment_value = ENV["control_var_name"]

  test do
    assert(environment_value == control_value)
  end
end
