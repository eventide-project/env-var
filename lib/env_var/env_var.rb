module EnvVar
  def self.set(name, value)
    ENV[name] = value
  end
end
