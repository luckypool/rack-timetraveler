module Rack
  module TimeTraveler
    SIGNATURE = [0, 0, 1]
    VERSION   = SIGNATURE.join('.')
    def self.version
      VERSION
    end
  end
end
