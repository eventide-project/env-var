module EnvVar
  module Controls
    module VariableName
      def self.random
        "TEST_#{SecureRandom.hex}"
      end
    end
  end
end
