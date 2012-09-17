class Engine
  OBJECT_TYPES = [Particle, Circle]

  attr_accessor :objects
  def initialize
    @objects = [1]
  end

  OBJECT_TYPES.each do |type|
    define_method "add_#{type.name.downcase}" do |*args|
      @objects << type.new(*args)
    end
  end
end
