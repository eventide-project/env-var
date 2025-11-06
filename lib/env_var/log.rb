module EnvVar
  class Log < ::Log
    def tag!(tags)
      tags << :env_var
    end
  end
end
