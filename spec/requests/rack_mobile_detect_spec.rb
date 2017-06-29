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

    it 'should not detect spurious profile header match' do
      env = test_env({ 'HTTP_X_PROFILE_FOO' => 'bar' })
      @rack.call(env)
      expect(env.key?(x_mobile)).to be_falsey
    end

    it 'should detect wap in Accept header' do
      env = test_env({ 'HTTP_ACCEPT' => 'text/html,application/xhtml+xml,application/vnd.wap.xhtml+xml,*/*;q=0.5' })
      @rack.call(env)
      expect(env[x_mobile]).to eql('true')

      env = test_env({ 'HTTP_ACCEPT' => 'application/vnd.wap.wmlscriptc;q=0.7,text/vnd.wap.wml;q=0.7,*/*;q=0.5' })
      @rack.call(env)
      expect(env[x_mobile]).to eql('true')
    end

    it 'should detect additional devices in catchall' do
      env = test_env({ 'HTTP_USER_AGENT' => blackberry })
      @rack.call(env)
      expect(env[x_mobile]).to eql('true')

      env = test_env({ 'HTTP_USER_AGENT' => samsung })
      @rack.call(env)
      expect(env[x_mobile]).to eql('true')

      env = test_env({ 'HTTP_USER_AGENT' => webos })
      @rack.call(env)
      expect(env[x_mobile]).to eql('true')

      env = test_env({ 'HTTP_USER_AGENT' => 'opera' })
      @rack.call(env)
      expect(env.key?(x_mobile)).to be_falsey
    end
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

