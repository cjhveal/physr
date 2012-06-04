class Particle
  attr_accessor :name, :mass, :pos, :vel, :acc

  def initialize opts={name: nil, mass:1, px: 0, py: 0, vx: 0, vy: 0, ax: 0, ay: 0}
    @name = opts[:name]
    @mass = opts[:mass]
    @pos = Vector.new opts[:px], opts[:py]
    @vel = Vector.new opts[:vx], opts[:vy]
    @acc = Vector.new opts[:ax], opts[:ay]
  end

  def update
    @vel += @acc
    @pos += @vel
    self
  end

end

