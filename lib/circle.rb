class Circle < Particle
  attr_accessor :r

  def initialize args={}
    defaults = {r: 1}
    opts = defaults.merge args
    @r = opts[:r]
    super opts
  end

  def collides? obj
    if obj.is_a? Circle
      collides_circle? obj
    elsif obj.is_a? AABB
      collides_aabb? obj
    end
  end

  def circle_collision circle
    circle_collision_resolution circle if circle_collides? circle
  end

  def circle_collision_resolution circle
    n = (@pos - circle.pos).norm

    a1 = n.dot @vel
    a2 = n.dot circle.vel

    p = 2*(a1-a2)/(@mass+circle.mass)

    @vel -= n * (p*circle.mass)
    circle.vel += n * (p*@mass)
  end

  def circle_collides? circle
    rv = @vel - circle.vel # relative velocity

    c = circle.pos - @pos # vec between centers

    d1 = c.mag # distance between centers
    sumr = @r + circle.r
    d2 = d1 - sumr

    return false if @vel.mag < d2 # not fast enough

    return false if rv.dot(c) < 0 # wrong directions

    d = c.project(rv)

    c_mag, d_mag = c.mag, d.mag
    f = c_mag * c_mag - d_mag * d_mag

    return false if Math.sqrt(f) > sumr

    t = (sumr * sumr) - f
    return false if t < 0

    dist = d_mag - Math.sqrt(t)
    return false if rv.mag < dist

    ratio = dist / rv.mag

    @pos += @vel * ratio
    circle.pos += circle.vel * ratio

    true
  end

  def aabb_collision aabb
    aabb_collision_x(aabb) and aabb_collision_y(aabb)

  end

  def aabb_collision_x aabb
    right, left = aabb.right, aabb.left
    vel, pos = @vel.x, @pos.x

    if (pos + vel) > (right - @r)
      @pos.x = right - @r
      @vel.x *= -1
    elsif (pos + vel) < (left + @r)
      @pos.x = left + @r
      @vel.x *= -1
    end
  end

  def aabb_collision_y aabb
    top, bottom = aabb.top, aabb.bottom
    vel, pos = @vel.y, @pos.y

    if (pos + vel) > (down - @r)
      @pos.x = down - @r
      @vel.x *= -1
    elsif (pos + vel) < (top + @r)
      @pos.x = top + @r
      @vel.x *= -1
    end
  end
end
