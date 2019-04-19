module IpToEarth
  class Configuration
    @base_uri = "https://iptoearth.expeditedaddons.com" || ENV['IPTOEARTH_URI']

    @api_key = ENV['IPTOEARTH_API_KEY']

    class << self
      attr_reader :base_uri, :api_key
    end
  end
end
