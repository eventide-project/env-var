require_relative "automated_init"

context "Unset" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  ENV[control_var_name] = control_value

  EnvVar.unset(control_var_name)

  context do
    detail "Value: #{ENV[control_var_name].inspect}"

    test do
      assert(ENV[control_var_name].nil?)
    end
  end
end
