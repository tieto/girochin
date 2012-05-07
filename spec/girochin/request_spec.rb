require 'girochin.rb'

Request = Struct.new(:headers)

class MyClass
  include Girochin::Request
end

describe Girochin::Request do

  let(:http_user_agent) { 'DUMMY_HTTP_USER_AGENT' }

  let(:request) do
    Request.new({
      'HTTP_USER_AGENT' => http_user_agent,
      'REMOTE_ADDR' => '127.0.0.1',
      'HTTP_REFERER' => 'www.rubylang.org'
    })
  end

  let(:my_instance) do
    a = MyClass.new
    a.http_request = request
    a
  end

  subject { my_instance }

  describe 'user agent' do
    its(:http_user_agent) { should eq 'DUMMY_HTTP_USER_AGENT' }
    its(:user_agent)      { should eq 'DUMMY_HTTP_USER_AGENT' }
    its(:browser_name)    { should eq 'Unknown'               }
  end

  describe 'ip address' do
    its(:remote_addr) { should eq '127.0.0.1' }
    its(:ip_address)  { should eq '127.0.0.1' }
  end

  its(:http_referer) { should eq 'www.rubylang.org' }

  describe 'Browsers' do
    context 'Chrome' do
      let(:http_user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19' }
      its(:browser_name)    { should eq 'Chrome'        }
      its(:browser_version) { should eq '18.0.1025.168' }
      its(:user_os)         { should eq 'OS X 10.6'     }
    end

    context 'IE' do
      let(:http_user_agent) { 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; MS-RTC LM 8)' }
      its(:browser_name)    { should eq 'Internet Explorer' }
      its(:browser_version) { should eq '8.0'               }
      its(:user_os)         { should eq 'Windows XP'        }
    end

    context 'Win/Firefox' do
      let(:http_user_agent) { 'Mozilla/5.0 (Windows NT 5.1; rv:12.0) Gecko/20100101 Firefox/12.0' }
      its(:browser_name)    { should eq 'Firefox'    }
      its(:browser_version) { should eq '12.0'       }
      its(:user_os)         { should eq 'Windows XP' }
    end
  end
end