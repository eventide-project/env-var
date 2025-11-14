require_relative "automated_init"

context "Unset" do
  control_var_name = Controls::VariableName.random
  control_value = SecureRandom.hex

  ENV[control_var_name] = control_value

  comment "Environment Variable: #{control_var_name.inspect}"
  comment "Initial Value: #{control_value.inspect}"

  EnvVar.unset(control_var_name)

  environment_value = ENV[control_var_name]

  context "Environment value" do
    comment environment_value.inspect

    test do
      assert(environment_value.nil?)
    end
  end
end
