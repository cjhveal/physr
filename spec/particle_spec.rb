require 'spec_helper'
require 'physr'

describe Particle do
  it 'should have defaults' do
    defaults = {name: nil, mass: 1, pos: Vector.zero, vel: Vector.zero, acc: Vector.zero}
    Particle.new.should be_particle.with_values defaults
  end

  it 'should update and return itself' do
    p = Particle.new acc: Vector.new(2,1), vel: Vector.new(2,2)

    p.update!.should eq p

    p.vel.should be_vector.with_values 4, 3
    p.pos.should be_vector.with_values 4, 3
  end
end
