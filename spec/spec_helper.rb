require 'bundler'
Bundler.require(:test)
require 'rspec/expectations'

spec_path = File.expand_path File.dirname __FILE__
Dir["#{spec_path}/support/**/*.rb"].each {|f| require f}

# Reset Timecop after each test
RSpec.configure do |config|
  config.after(:each) do
    Timecop.return
  end
end
