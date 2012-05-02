require 'girochin.rb'

Request = Struct.new(:headers)

describe Girochin::Request do

  let(:http_user_agent) { 'DUMMY_HTTP_USER_AGENT' }

  let(:request) do
    Request.new({
      'HTTP_USER_AGENT' => http_user_agent
    })
  end

  let(:girochin_request) { Girochin::Request.new request }

  subject { girochin_request }

  describe 'headers' do
    its(:headers)    { should_not be_empty               }
    its(:headers)    { should include 'HTTP_USER_AGENT'  }
    its(:user_agent) { should eq 'DUMMY_HTTP_USER_AGENT' }
    its(:browser)    { should eq 'UNKNOWN'               }
  end

  describe 'Chrome' do
    let(:http_user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19' }
    its(:browser)         { should eq 'Chrome' }
  end
end