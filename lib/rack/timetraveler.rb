require 'rack'
require 'timecop'

class Rack::TimeTraveler
  attr_reader :app, :options

  def initialize(app, options = {})
    @app, @options = app, options

    default_fetcher = lambda { |env| fetch_from_env(env) }
    @options[:timestamp_fetcher] ||= default_fetcher

    @options[:enabled_environments] ||= [:development, :test]
  end

  def call(env)
    return @app.call(env) unless enabled?

    time = validate_timestamp(env)

    return @app.call(env) if time.nil?

    Timecop.travel(time) { @app.call(env) }
  end

  private

  def enabled?
    @options[:enabled_environments].map(&:to_s).include?(ENV['RACK_ENV'])
  end

  def validate_timestamp(env)
    timestamp = fetch_timestamp(env)
    return if timestamp.nil?
    Time.at(Integer(timestamp))
  rescue
    nil
  end

  def fetch_timestamp(env)
    fetcher = @options[:timestamp_fetcher]
    fetcher.call(env)
  end

  def fetch_from_env(env)
    env['HTTP_RACK_TIME_TRAVELER_TIMESTAMP'] ||
      env['RACK_TIME_TRAVELER_TIMESTAMP']
  end
end
