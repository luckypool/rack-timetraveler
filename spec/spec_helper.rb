ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rack/test'
require 'rspec'
require 'rack/timetraveler'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
