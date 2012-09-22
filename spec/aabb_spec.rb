require 'spec_helper'
require 'physr'

describe AABB do
  describe '#initialize' do
    subject { AABB.new }

    attrs = [:x, :y, :height, :width]
    attrs.each do |attr|
      its(attr) { should be 0 }
    end
  end

  describe "#left" do
    subject { AABB.new x: 100}
    its(:left) { should be 100 }
  end

  describe "#right" do
    subject { AABB.new x: 50, width: 100}
    its(:right) { should be 150 }
  end

  describe "#top" do
    subject { AABB.new y: 100}
    its(:top) { should be 100 }
  end

  describe "#bottom" do
    subject { AABB.new y: 50, height: 100}
    its(:bottom) { should be 150 }
  end
end
