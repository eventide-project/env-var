module EnvVar
  def self.set(name, value)
    ENV[name] = value
  end

  def self.unset(name)
    ENV.delete(name)
  end
end
