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
    context 'from request object' do
      let(:girochin_request) { Girochin::Request.new request }

      its(:headers)         { should_not be_empty               }
      its(:headers)         { should include 'HTTP_USER_AGENT'  }
    end

    context 'from hash' do
      let(:girochin_request) do
        Girochin::Request.new({
          http_user_agent: 'DUMMY_HTTP_USER_AGENT'
        })
      end

      its(:headers)         { should_not be_empty                 }
      its(:headers)         { should include 'HTTP_USER_AGENT'    }
      its(:headers)         { should_not include :http_user_agent }
    end

    describe 'user agent' do
      its(:http_user_agent) { should eq 'DUMMY_HTTP_USER_AGENT' }
      its(:user_agent)      { should eq 'DUMMY_HTTP_USER_AGENT' }
      its(:browser)         { should eq 'UNKNOWN'               }
    end

    describe '#serialize' do
      subject     { girochin_request.serialize      }
      its(:keys)  { should include :http_user_agent }
    end
  end

  describe 'Chrome' do
    let(:http_user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19' }
    its(:browser)         { should eq 'Chrome' }
  end
end