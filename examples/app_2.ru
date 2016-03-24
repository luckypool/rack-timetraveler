$:.unshift Pathname(__FILE__).dirname.parent + 'lib'

require 'rack'
require 'rack-timetraveler'

class App
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ["Time is #{Time.now.to_s}"]]
  end
end

@fetcher = lambda do |env|
  # You can fetch customized timestamp.
  # Default is fetch from ENV['RACK_TIME_TRAVELER_TIMESTAMP']
  0
end

use Rack::TimeTraveler,
  timestamp_fetcher: @fetcher,
  enabled_environments: [:development]

run App.new
