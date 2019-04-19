module IpToEarth
  APIResult = Struct.new(:valid, :country, :country_code, :hostname,
                         :city, :ip, :latitude, :longitude, :region,
                         :continent_code, :country_code3, :currency_code) do

    # NOTE: yes, keyword_init: true exists but raises an error on unknown keywords!
    def initialize(args)
      members.each { |field| send("#{field}=", args[field.to_s]) }
    end
  end
end
