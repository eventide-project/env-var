module EnvVar
  Error = Class.new(StandardError)

  def self.logger
    Log.get(self)
  end

  def self.get(name)
    logger.trace("Getting environment variable (Name: #{name.inspect})")
    value = ENV[name]
    logger.debug("Got environment variable (Name: #{name.inspect}, Value: #{value.inspect})")

    value
  end

  def self.fetch(name)
    logger.trace("Fetching environment variable (Name: #{name.inspect})")
    value = ENV.fetch(name)
    logger.debug("Fetched environment variable (Name: #{name.inspect}, Value: #{value.inspect})")

    value
  end

  def self.set(name, value)
    logger.trace("Setting environment variable (Name: #{name.inspect}, Value: #{value.inspect})")
    ENV[name] = value
    logger.debug("Set environment variable (Name: #{name.inspect}, Value: #{value.inspect})")

    value
  end

  def self.unset(name)
    logger.trace("Unsetting environment variable (Name: #{name.inspect})")
    value = ENV.delete(name)
    logger.debug("Unset environment variable (Name: #{name.inspect}, Value: #{value.inspect})")

    value
  end

  def self.push(name_or_hash, value=nil, &action)
    raise Error, "Push must be invoked with a block" if action.nil?

    hash = nil
    if name_or_hash.respond_to?(:to_hash)
      hash = name_or_hash.to_hash
      logger.trace("Pushing environment variables (#{hash.inspect})")
    else
      name = name_or_hash
      logger.trace("Pushing environment variable (Name: #{name.inspect}, Value: #{value.inspect})")
      hash = { name => value }
    end

    original_values = {}

    hash.each do |name, value|
      original_values[name] = get(name)

      set(name, value)
    end

    begin
      action.call

      logger.debug("Pushed environment variables (#{hash.inspect})")

      original_values
    ensure
      original_values.each do |name, original_value|
        set(name, original_value)
      end
    end
  end
end
