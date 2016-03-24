require 'spec_helper'

describe Rack::TimeTraveler do
  def build_app(options = {})
    Rack::Builder.new {
      use Rack::TimeTraveler, options
      run lambda {|env| [200, {}, ["Time is #{Time.now.to_i}"]]}
    }.to_app
  end

  def app
    build_app
  end

  context 'when using default fetcer (using HEADER)' do
    let(:timestamp) { 0 }
    it 'travels to the epocktime' do
      get '/', {}, 'RACK_TIME_TRAVELER_TIMESTAMP' => timestamp
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq "Time is #{timestamp}"
    end

    context 'given invalid timestamp' do
      let(:timestamp) { 'invalid' }
      it 'travels to the epocktime' do
        get '/', {}, 'RACK_TIME_TRAVELER_TIMESTAMP' => timestamp
        expect(last_response.status).to eq 200
        expect(last_response.body).to eq "Time is #{Time.now.to_i}"
      end
    end
  end


  context 'when disabled traveling' do
    def app
      build_app(enabled_environments: [:not_test])
    end

    it 'travels to the epocktime' do
      get '/', {}, 'RACK_TIME_TRAVELER_TIMESTAMP' => 0
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq "Time is #{Time.now.to_i}"
    end
  end

  context 'when using custom fetcher' do
    def app
      fetcher = lambda { |env| 0 }
      build_app(timestamp_fetcher: fetcher)
    end

    let(:timestamp) { 0 }
    it 'travels to the epocktime' do
      get '/'
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq "Time is #{timestamp}"
    end
  end
end
