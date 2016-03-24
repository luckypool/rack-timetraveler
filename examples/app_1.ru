$:.unshift Pathname(__FILE__).dirname.parent + 'lib'

require 'rack'
require 'rack-timetraveler'

class App
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ["Time is #{Time.now.to_s}"]]
  end
end

use Rack::TimeTraveler
run App.new

# Check below:
#
# $ bundle exec rackup examples/app_1.ru
#
# $ curl localhost:9292
# $ curl localhost:9292 -H 'RACK_TIME_TRAVELER_TIMESTAMP:0'
