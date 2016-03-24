$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rack/test'
require 'rspec'

require 'simplecov'
require 'coveralls'

Coveralls.wear!

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
    add_filter '.bundle/'
    add_filter 'vendor'
end

require 'rack/timetraveler'

RSpec.configure do |conf|
  ENV['RACK_ENV'] ||= 'test'
  conf.include Rack::Test::Methods
end
