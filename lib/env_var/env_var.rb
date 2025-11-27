module EnvVar
  Error = Class.new(StandardError)

  def self.get(name)
    ENV[name]
  end

  def self.fetch(name)
    ENV.fetch(name)
  end

  def self.set(name, value)
    ENV[name] = value
  end

  def self.unset(name)
    ENV.delete(name)
  end

  def self.push(name_or_hash, value=nil, &action)
    raise Error, "Push must be invoked with a block" if action.nil?

    hash = nil
    if name_or_hash.respond_to?(:to_hash)
      hash = name_or_hash.to_hash
    else
      name = name_or_hash
      hash = { name => value }
    end

    original_values = {}

    hash.each do |name, value|
      original_values[name] = get(name)

      set(name, value)
    end

    begin
      action.call

      original_values
    ensure
      original_values.each do |name, original_value|
        set(name, original_value)
      end
    end
  end
end
