require 'rails_helper'

RSpec.describe 'Mobile Detect', type: :request do
  context 'an app with mobile device defaults' do
    before do
      @app = test_app
      @rack = Rack::MobileDetect.new(@app)
    end

    it 'should not detect a non-mobile device' do
      env = test_env
      @rack.call(env)
      expect(env.key?(x_mobile)).to be_falsey
    end

    it 'should detect all default targeted devices' do
      env = test_env({ 'HTTP_USER_AGENT' => iphone })
      @rack.call(env)
      expect(env[x_mobile]).to eql('iPhone')

      env = test_env({ 'HTTP_USER_AGENT' => android })
      @rack.call(env)
      expect(env[x_mobile]).to eql('Android')

      env = test_env({ 'HTTP_USER_AGENT' => ipad })
      @rack.call(env)
      expect(env[x_mobile]).to eql('iPad')
    end

    it 'should detect UAprof device'

    it 'should not detect spurious profile header match'

    it 'should detect wap in Accept header'

    it 'should detect additional devices in catchall'

  end

end

# Expected x_header
def x_mobile
  Rack::MobileDetect::X_HEADER
end

# User agents for testing
def ipad
  'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10'
end

def ipod
  'Mozilla/5.0 (iPod; U; CPU iPhone OS 2_2 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5G77 Safari/525.20'
end

def iphone
  'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7C144 Safari/528.16'
end

def android
  'Mozilla/5.0 (Linux; U; Android 2.0; ld-us; sdk Build/ECLAIR) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17'
end

def blackberry
  'BlackBerry9000/4.6.0.167 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/102'
end

def samsung
  'Mozilla/4.0 (compatible; MSIE 6.0; BREW 3.1.5; en )/800x480 Samsung SCH-U960'
end

def webos
  'Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pre/1.1'
end


def test_app()
  Class.new { def call(app); true; end }.new
end

def test_env(overwrite = {})
  {
      'GATEWAY_INTERFACE'=> 'CGI/1.2',
      'HTTP_ACCEPT'=> 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'HTTP_ACCEPT_CHARSET'=> 'ISO-8859-1,utf-8;q=0.7,*;q=0.7',
      'HTTP_ACCEPT_ENCODING'=> 'gzip,deflate',
      'HTTP_ACCEPT_LANGUAGE'=> 'en-us,en;q=0.5',
      'HTTP_CONNECTION'=> 'keep-alive',
      'HTTP_HOST'=> 'localhost:4567',
      'HTTP_KEEP_ALIVE'=> 300,
      'HTTP_USER_AGENT'=> 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3) Gecko/20090920 Firefox/3.5.3 (Swiftfox)',
      'HTTP_VERSION'=> 'HTTP/1.1',
      'PATH_INFO'=> '/',
      'QUERY_STRING'=> '',
      'REMOTE_ADDR'=> '127.0.0.1',
      'REQUEST_METHOD'=> 'GET',
      'REQUEST_PATH'=> '/',
      'REQUEST_URI'=> '/',
      'SCRIPT_NAME'=> '',
      'SERVER_NAME'=> 'localhost',
      'SERVER_PORT'=> '4567',
      'SERVER_PROTOCOL'=> 'HTTP/1.1',
      'SERVER_SOFTWARE'=> 'Mongrel 1.1.5',
      'rack.multiprocess'=> false,
      'rack.multithread'=> true,
      'rack.request.form_hash'=> '',
      'rack.request.form_vars'=> '',
      'rack.request.query_hash'=> '',
      'rack.request.query_string'=> '',
      'rack.run_once'=> false,
      'rack.url_scheme'=> 'http',
      'rack.version'=> '1: 0'
  }.merge(overwrite)
end
