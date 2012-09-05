class Particle
  attr_accessor :name, :mass, :pos, :vel, :acc

  def initialize args={}
    defaults = {name: nil, mass:1, pos: Vector.zero, vel: Vector.zero, acc: Vector.zero}
    opts = defaults.merge args
    @name = opts[:name]
    @mass = opts[:mass]
    @pos = opts[:pos]
    @vel = opts[:vel]
    @acc = opts[:acc]
  end

  def update!
    @vel += @acc
    @pos += @vel
    self
  end
end
