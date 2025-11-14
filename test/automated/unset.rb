require_relative "automated_init"

context "Unset" do
  control_var_name = Controls::VariableName.random
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  ENV[control_var_name] = control_value

  EnvVar.unset(control_var_name)

  environment_value = ENV[control_var_name]

  context do
    detail "Value: #{environment_value.inspect}"

    test do
      assert(environment_value.nil?)
    end
  end
end
