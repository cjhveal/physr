RSpec::Matchers.define :be_vector do
  def is_vector? object
    object.is_a? Vector
  end

  def x_match? vector
    vector.x == @x
  end

  def y_match? vector
    vector.y == @y
  end

  def values_match? vector
    x_match?(vector) and y_match?(vector)
  end

  chain :with_values do |x,y|
    @chained = true
    @x, @y = x, y
  end


  match do |object|
    if @chained
      is_vector?(object) and values_match?(object)
    else
      is_vector?(object)
    end
  end

  failure_message_for_should do |object|
    if not is_vector? object
      "Expected #{object.inspect} to be a vector"
    elsif not values_match? object
      "Expected #{object.inspect} to have values x: #{@x}, y: #{@y}"
    end
  end

  failure_message_for_should_not do |object|
    if is_vector? object
      "Expected #{object.inspect} not to be a vector"
    elsif values_match? object
      "Expected #{object.inspect} not to have values x: #{@x}, y: #{@y}"
    end
  end
end

RSpec::Matchers.define :be_particle do
  def is_particle? object
    object.is_a? Particle
  end

  def has_attributes? object
    @attributes.all? do |attr, value|
      object.send(attr) == value
    end
  end

  def unmatched_attributes object
    @attributes.select do |attr, value|
      object.send(attr) != value
    end
  end

  chain :with_values do |attributes|
    @attributes = attributes
  end

  match do |object|
    if @attributes
      is_particle? object and has_attributes? object
    else
      is_particle? object
    end
  end

  failure_message_for_should do |object|
    if not is_particle? object
      "Expected #{object.inspect} to be a particle"
    elsif not has_attributes? object
      "Expected #{object.inspect} to have the following values: #{unmatched_attributes(object).inspect}"
    end
  end

  failure_message_for_should do |object|
    if is_particle? object
      "Expected #{object.inspect} not to be a particle"
    elsif has_attributes? object
      "Expected #{object.inspect} not to have the following values: #{unmatched_attributes(object).inspect}"
    end
  end
end
