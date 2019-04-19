require 'openssl'
require 'json'
require 'http'
require 'addressable'

require_relative 'ip_to_earth/api_exception.rb'
require_relative 'ip_to_earth/configuration.rb'
require_relative 'ip_to_earth/client.rb'
require_relative 'ip_to_earth/api_controller.rb'
require_relative 'ip_to_earth/api_result.rb'

module IpToEarth
  def self.lookup(ip)
    Client.default.lookup(ip)
  end

  def self.with_api_key(key)
    Client.new(api_key: key)
  end
end
