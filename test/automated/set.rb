require_relative "automated_init"

context "Set" do
  control_var_name = Controls::VariableName.random
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  EnvVar.set(control_var_name, control_value)

  environment_value = ENV.fetch(control_var_name)

  context "Environment value" do
    comment environment_value.inspect
    detail "Control: #{control_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end
end
