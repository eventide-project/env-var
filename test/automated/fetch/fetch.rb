require_relative "../automated_init"

context "Fetch" do
  control_var_name = EnvVar::Controls::VariableName.random
  control_value = SecureRandom.hex

  ENV[control_var_name] = control_value

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{control_value.inspect}"

  environment_value = EnvVar.fetch(control_var_name)

  context "Fetched value" do
    comment environment_value.inspect
    detail "Control: #{control_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end
end
