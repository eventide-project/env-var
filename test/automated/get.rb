require_relative "automated_init"

context "Get" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  ENV[control_var_name] = control_value

  environment_value = EnvVar.get(control_var_name)

  context do
    comment ENV[control_var_name].inspect
    detail "Control: #{environment_value.inspect}"

    test do
      assert(environment_value == control_value)
    end
  end
end
