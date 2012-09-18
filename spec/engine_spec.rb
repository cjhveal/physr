require 'spec_helper'
require 'physr'

describe Engine do
  it 'should have a list of object types' do
    Engine::OBJECT_TYPES.should eq [Particle, Circle]
  end

  describe '#new' do
    subject { Engine.new }

    its(:objects) { should be_empty }
  end

  Engine::OBJECT_TYPES.each do |type|
    name = type.name.downcase
    describe "#add_#{name} to objects list" do
      let(:engine){ Engine.new }
      before { engine.send :"add_#{name}" }

      subject { engine.objects }

      its(:length) { should be 1 }
      its(:first) { should be_instance_of type }
    end
  end

  describe "#time_since_last" do
    let(:engine) { Engine.new }
    before(:all) { Timecop.freeze }

    subject { engine }

    specify { engine.time_since_last.should be 0 }

    it 'should record the time delta between calls in milliseconds' do
      engine.time_since_last.should be 0
      Timecop.travel(Time.now + 1)
      engine.time_since_last.should be 1000
    end

  end

  describe "#update!" do
    let(:engine) { Engine.new }

    before(:all) do
      mock = double('object')
      mock.should_receive(:update!).exactly(3).times
      engine.objects = [mock, mock, mock]
    end
  end

end
