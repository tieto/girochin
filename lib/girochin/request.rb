module Girochin
  class Request

    attr_accessor :headers

    def initialize(request)
      @headers = request.is_a?(Hash) ? request.inject({}) { |h, (k, v)| h[k.to_s.upcase] = v; h } :
                                       request.headers
    end

    def http_user_agent
      @headers['HTTP_USER_AGENT']
    end
    alias :user_agent :http_user_agent

    def browser
      'UNKNOWN'
    end
  end
end