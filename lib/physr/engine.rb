class Engine
  OBJECT_TYPES = [Particle, Circle]

  attr_accessor :objects
  def initialize
    @objects = []
  end

  OBJECT_TYPES.each do |type|
    define_method "add_#{type.name.downcase}" do |*args|
      @objects << type.new(*args)
    end
  end

  def time_since_last
    last_time, @time = @time, Time.now
    return 0 unless last_time

    1000 * (@time.to_i - last_time.to_i)
  end

end
