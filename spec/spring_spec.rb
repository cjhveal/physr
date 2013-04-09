require 'spec_helper'
require 'physr'

describe Spring do
  describe '#initialize' do
    subject { Spring.new }

    its(:spring_constant) { should be 1 }
    its(:length) { should be 100 }
  end
end
