module IpToEarth
  class APIController
    HEADERS = {
      accept: 'application/json'
    }.freeze

    def initialize(api_key: Configuration.api_key)
      @lookup_url_template =
        Addressable::Template.new("#{Configuration.base_uri}/{?ip,api_key}")
                             .partial_expand(api_key: api_key)
    end

    def lookup(ip)
      query_url = lookup_url_template.expand(ip: ip)

      response = Http.headers(HEADERS).get(query_url)

      fail_on_bad_response(response)
      parse_response(response)
    end

    private

    attr_reader :lookup_url_template

    def fail_on_bad_response(response)
      return unless [403, 404, 429, 500].include?(response.code)

      error_message = case response.code
                      when 429 then "Rate limit exceeded"
                      when 404 then "Endpoint not found"
                      when 500 then "Endpoint application error"
                      when 403 then "API Key not found or invalid"
                      end

      raise APIException.new(error_message, response.code, response.body)
    end

    def parse_response(response)
      APIResult.new(response.parse(:json))
    rescue JSON::ParserError
      raise APIException.new("Invalid JSON returned.", response.code, response.to_s)
    end
  end
end
