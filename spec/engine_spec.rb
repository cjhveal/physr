require 'spec_helper'
require 'physr'

describe Engine do
  it 'should have a list of object types' do
    Engine::OBJECT_TYPES.should eq [Particle, Circle]
  end

  describe '#objects' do
    subject { Engine.new.objects }
    it { should be_empty }
  end

  it 'should add helper methods to add all object types' do
    Engine::OBJECT_TYPES.each do |type|
      Engine.new.tap do |e|
        e.send :"add_#{type.name.downcase}"
        e.objects.length.should eq 1
        e.objects.first.should be_instance_of type
      end
    end
  end
end
