require 'spec_helper'
require 'physr/vector'

# TODO: create custom matcher for matching vectors by x,y
describe Vector do
  it 'should default to zero vector' do
    v = Vector.new
    v.should be_vector.with_values(0, 0)
  end

  it 'should generate a zero vector' do
    v = Vector.zero
    v.should be_vector.with_values(0, 0)
  end

  it 'should compare two vectors' do
    u, v = Vector.zero, Vector.zero
    u.should eq v

    u, v = Vector.new(2,2), Vector.new(2,2)
    u.should eq v
  end

  describe 'arithmetic' do
    let(:operators) { [:+, :-, :*, :/] }
    let(:base_vector) { Vector.new 2, 2 }

    it 'should perform vector arithmetic' do
      operators.each do |op|
        v = base_vector.send op, base_vector
        value = 2.send op, 2
        v.should be_vector.with_values(value, value)
      end
    end

    it 'should perform scalar arithmetic' do
      operators.each do |op|
        v = base_vector.send op, 2
        value = 2.send op, 2
        v.should be_vector.with_values(value, value)
      end
    end
  end

  it 'should calculate the dot product of two vectors' do
    v, w = Vector.new(2,3), Vector.new(4,5)
    v.dot(w).should eq (v.x * w.x + v.y * w.y)
  end

  it 'should calculate the square of the magnitude' do
    v = Vector.new 3, 4
    v.mag_sq.should eq 25

    v = Vector.new 6, 8
    v.mag_sq.should eq 100
  end

  it 'should calculate the magnitude' do
    v = Vector.new
    v.stub(:mag_sq => 100)

    v.mag.should eq 10
  end

  it 'should calculate the square of the distance from a vector' do
    u, v = Vector.new(1, 1), Vector.new(4, 5)

    u.dist_sq(v).should eq 25
  end

  it 'should calculate the distance from a vector' do
    u, v = Vector.new, Vector.new
    u.stub(:dist_sq => 25)

    u.dist(v).should eq 5
  end

  it 'should normalize' do
    v = Vector.new(0, 100).norm

    v.mag.should be_within(10 ** -15).of(1)
    v.should be_vector.with_values 0, 1
  end

  it 'should project onto another vector' do
  end
end
