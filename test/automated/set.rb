require_relative "automated_init"

context "Set" do
  control_var_name = "TEST_#{SecureRandom.hex}"
  control_value = SecureRandom.hex

  comment "Environment Variable: #{control_var_name.inspect}"

  EnvVar.set(control_var_name, control_value)

  begin
    environment_value = ENV.fetch(control_var_name)

    context do
      comment "Value: #{environment_value.inspect}"
      detail "Control: #{control_value.inspect}"

      test do
        assert(environment_value == control_value)
      end
    end
  ensure
    ENV.delete(control_var_name)
  end
end
