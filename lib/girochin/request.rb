module Girochin
  class Request

    attr_accessor :headers

    def initialize(request)
      @headers = request.headers
    end

    def user_agent
      @headers['HTTP_USER_AGENT']
    end

    def browser
      'UNKNOWN'
    end
  end
end
