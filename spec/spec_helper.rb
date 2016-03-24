ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rack/test'
require 'rspec'

require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
    add_filter '.bundle/'
    add_filter 'vendor'
end

require 'rack/timetraveler'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
