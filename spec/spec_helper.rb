require 'rspec'

spec_path = File.expand_path File.dirname __FILE__
Dir["#{spec_path}/support/**/*.rb"].each {|f| require f}
