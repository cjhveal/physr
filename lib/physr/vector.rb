class Vector
  attr_accessor :x, :y

  def initialize x = 0, y = 0
    @x = x
    @y = y
  end

  def self.zero
    Vector.new
  end

  def == other
    other.is_a? Vector and @x == other.x and @y == other.y
  end

  def + a
    if a.is_a?(Vector)
      Vector.new @x + a.x, @y + a.y
    else
      Vector.new @x + a, @y + a
    end
  end

  def - a
    if a.is_a?(Vector)
      Vector.new @x - a.x, @y - a.y
    else
      Vector.new @x - a, @y - a
    end
  end

  def * a
    if a.is_a?(Vector)
      Vector.new @x * a.x, @y * a.y
    else
      Vector.new @x * a, @y * a
    end
  end

  def / a
    if a.is_a?(Vector)
      Vector.new @x / a.x, @y / a.y
    else
      Vector.new @x / a, @y / a
    end
  end

  def dot vec
    @x * vec.x + @y * vec.y
  end

  def mag_sq
    @x*@x + @y*@y
  end

  def mag
    Math.sqrt mag_sq
  end

  def dist_sq a
    dx, dy = a.x - @x, a.y - @y
    dx*dx + dy*dy
  end

  def dist a
    Math.sqrt dist_sq(a)
  end

  def norm
    Vector.new(@x,@y) / mag
  end

  def project_onto a
    a.norm * a.norm.dot(self)
  end
end
