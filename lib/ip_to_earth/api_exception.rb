module IpToEarth
  class APIException < StandardError
    attr_reader :response_code, :response_body

    def initialize(reason, response_code, response_body)
      super(reason)
      @response_code = response_code
      @response_body = response_body
    end
  end
end
