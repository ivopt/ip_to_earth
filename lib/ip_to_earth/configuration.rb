module IpToEarth
  class Configuration
    # The base Uri for API calls
    @base_uri = "https://iptoearth.expeditedaddons.com" || ENV['IPTOEARTH_URI']

    # Your API Key
    @api_key = ENV['IPTOEARTH_API_KEY']

    # create the getters and setters
    class << self
      attr_reader :base_uri, :api_key
    end
  end
end
