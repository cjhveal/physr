class AABB
  attr_accessor :x, :y, :width, :height

  def initialize opts={x: 0, y: 0, width: 0, height: 0}
    @x, @y = opts[:x], opts[:y]
    @width, @height = opts[:width], opts[:height]
  end

  def left
    @x
  end

  def right
    @x + @width
  end

  def top
    @y
  end

  def bottom
    @y + @height
  end
end
