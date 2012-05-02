require 'girochin.rb'

Request = Struct.new(:headers)

describe Girochin::Request do

  let(:request) do
    Request.new({
      "HTTP_USER_AGENT" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19"
    })
  end

  let(:girochin_request) { Girochin::Request.new request }

  subject { girochin_request }

  its(:headers) { should_not be_empty }

  its(:user_agent) { should eq 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19' }
end