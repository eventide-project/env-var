require_relative "automated_init"

context "Get" do
  control_var_name = Controls::VariableName.random
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{control_value.inspect}"

  ENV[control_var_name] = control_value

  environment_value = EnvVar.get(control_var_name)

  context "Environment value" do
    comment environment_value.inspect
    detail "Control: #{control_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end
end
