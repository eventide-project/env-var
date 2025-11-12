module EnvVar
  def self.set(name, value)
    ENV[name] = value
  end

  def self.unset(name)
    ENV.delete(name)
  end

  def self.get(name)
    ENV[name]
  end

  def self.fetch(name)
    ENV.fetch(name)
  end
end
