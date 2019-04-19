module IpToEarth
  class Client
    def self.default
      @default_instance ||= new
    end

    def initialize(api_key: Configuration.api_key)
      @api_controller = APIController.new(api_key: api_key)
    end

    def lookup(ip)
      @api_controller.lookup(ip)
    end
  end
end
