require_relative "automated_init"

context "Unset" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  ENV[control_var_name] = control_value

  EnvVar.unset(control_var_name)

  context do
    detail "Environment variable: #{ENV[control_var_name].inspect}"
    detail "Control: #{control_var_name.inspect}"

    test do
      assert(ENV[control_var_name].nil?)
    end
  end
end
