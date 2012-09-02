RSpec::Matchers.define :be_vector do
  chain :with_values do |x,y|
    @x, @y = x, y
  end

  match do |object|
    matched = object.is_a? Vector
    if @x and @y
      matched and object.x == @x and object.y == @y
    else
      matched
    end
  end

  failure_message_for_should do |object|
    error = "Object #{object.inspect} should be a vector"
    if @x and @y
      "#{error} with values x: #{@x}, y: #{@y}"
    else
      error
    end
  end

  failure_message_for_should_not do |object|
    error = "Object #{object.inspect} should not be a vector"
    if @x and @y
      "#{error} with values x: #{@x}, y: #{@y}"
    else
      error
    end
  end
end
