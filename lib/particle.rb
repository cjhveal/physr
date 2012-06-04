class Particle
  attr_accessor :name, :pos, :vel, :acc

  def initialize name=nil, px = 0, py = 0, vx = 0, vy = 0, ax = 0, ay = 0
    @name = name
    @pos = Vector.new px, py
    @vel = Vector.new vx, vy
    @acc = Vector.new ax, ay
  end

  def update
    @vel += @acc
    @pos += @vel
    self
  end


end

