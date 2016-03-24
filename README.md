# Rack::TimeTraveler

[![Build Status](https://travis-ci.org/luckypool/rack-timetraveler.svg?branch=master)](https://travis-ci.org/luckypool/rack-timetraveler)
[![Coverage Status](https://coveralls.io/repos/github/luckypool/rack-timetraveler/badge.svg?branch=master)](https://coveralls.io/github/luckypool/rack-timetraveler?branch=master)
[![Dependency Status](https://gemnasium.com/luckypool/rack-timetraveler.svg)](https://gemnasium.com/luckypool/rack-timetraveler)
[![Gem Version](https://badge.fury.io/rb/rack-timetraveler.svg)](https://badge.fury.io/rb/rack-timetraveler)


Rack::TimeTraveler is a Rack::Middleware, and provides "time travel" capabilities.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-timetraveler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-timetraveler

## Usage

Simple usage 

```ruby
use Rack::TimeTraveler
```

If you needs customized usage

```ruby
@fetcher = lambda do |env|
  # You can fetch customized timestamp.
  # Default is fetch from ENV['RACK_TIME_TRAVELER_TIMESTAMP']
  0
end

use Rack::TimeTraveler,
  timestamp_fetcher: @fetcher,          # You can also fetch from cache/DB
  enabled_environments: [:development]  # enabled only development
```

#### Examples

See [examples/app_1.ru](./examples/app_1.ru)

    $ bundle exec rackup examples/app_1.ru
    $ curl localhost:9292
    $ curl localhost:9292 -H 'RACK_TIME_TRAVELER_TIMESTAMP:0'
    Time is 1970-01-01 09:00:00 +0900


## Contributing

1. Fork it ( https://github.com/luckypool/rack-timetraveler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
