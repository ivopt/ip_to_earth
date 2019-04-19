module IpToEarth
  class IPToEarthClient
    def initialize(api_key: nil)
      @api_controller = APIController.new(api_key: api_key || Configuration.api_key)
    end

    def lookup(ip)
      @api_controller.lookup(ip)
    end
  end
end
