module Girochin
  module Request

    attr_reader :http_user_agent, :remote_addr, :http_referer

    alias :user_agent :http_user_agent
    alias :ip_address :remote_addr

    def http_request=(request)
      @http_user_agent = request.headers['HTTP_USER_AGENT']
      @remote_addr     = request.headers['REMOTE_ADDR']
      @http_referer    = request.headers['HTTP_REFERER']
    end

    def browser_name
      @browser_name ||= case http_user_agent
        when /konqueror/i then 'Konqueror'
        when /chrome/i    then 'Chrome'
        when /safari/i    then 'Safari'
        when /msie/i      then 'Internet Explorer'
        when /opera/i     then 'Opera'
        when /firefox/i   then 'Firefox'
        else 'Unknown'
      end
    end

    def browser_version
      @browser_version ||= case browser_code_name
        when 'Chrome'
          $1 if http_user_agent =~ /chrome\/([\d\w\.\-]+)/i
        when 'Safari'
          $1 if http_user_agent =~ /version\/([\d\w\.\-]+)/i
        else
          $1 if http_user_agent =~ /#{browser_code_name}[\/ ]([\d\w\.\-]+)/i
      end
    end

    def user_os
      case http_user_agent
        when /windows nt 6\.0/i        then 'Windows Vista'
        when /windows nt 6\.\d+/i      then 'Windows 7'
        when /windows nt 5\.2/i        then 'Windows 2003'
        when /windows nt 5\.1/i        then 'Windows XP'
        when /windows nt 5\.0/i        then 'Windows 2000'
        when /os x (\d+)[._](\d+)/i    then "OS X #{$1}.#{$2}"
        when /android (\d+)[._](\d+)/i then "Android #{$1}.#{$2}"
        when /iPhone/i                 then "iOS"
        when /linux/i                  then 'Linux'
        else 'Unknown'
      end
    end

    alias :girochin_http_user_agent :http_user_agent
    alias :girochin_http_referer    :http_referer
    alias :girochin_ip_address      :ip_address
    alias :girochin_browser_name    :browser_name
    alias :girochin_browser_version :browser_version
    alias :girochin_user_os         :user_os

  private

    def browser_code_name
      @browser_code_name ||= browser_name == 'Internet Explorer' ? 'MSIE' : browser_name
    end
  end
end