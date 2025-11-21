module EnvVar
  Error = Class.new(StandardError)

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

  def self.push(name, value, &action)
    raise Error, "Push must be invoked with a block" if action.nil?

    original_value = get(name)

    begin
      set(name, value)

      action.call

      original_value
    ensure
      set(name, original_value)
    end
  end
end
