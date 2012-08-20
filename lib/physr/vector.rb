class Vector
  attr_accessor :x, :y

  def initialize x = 0, y = 0
    @x = x
    @y = y
  end

  def self.zero
    Vector.new
  end

  def self.dist_sq a, b
    dx, dy = b.x - a.x, b.y - a.y
    dx*dx + dy*dy
  end

  def self.dist a, b
    Math.sqrt dist_sq(a, b)
  end

  def self.project a, b
    b.norm * b.norm.dot(a)
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

  def mag_sq
    @x*@x + @y*@y
  end

  def mag
    Math.sqrt mag_sq
  end

  def dot vec
    @x * vec.x + @y * vec.y
  end

  def norm
    Vector.new(@x,@y) / mag
  end

  def project a
    a.norm * a.norm.dot(self)
  end
end
