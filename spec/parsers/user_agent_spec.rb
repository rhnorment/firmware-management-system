require 'rails_helper'

describe AgentOrange::UserAgent do
  describe 'iPhone' do
    string = 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'
    let(:ua) { AgentOrange::UserAgent.new(string) }

    it 'shoud have a device type of :mobile' do
      expect(ua.device.type).to eql(:mobile)
    end

    it 'should not have the device type of :computer' do
      expect(ua.device.is_computer?).to be_falsey
    end

    it 'should have a platform type of :apple' do
      expect(ua.device.platform.type).to eql(:apple)
    end

    it 'should have a platform name of :iphone' do
      expect(ua.device.platform.version.major).to eql('iPhone')
    end

    it 'should expect the operating system to be Apple iOS 5.0' do
      expect(ua.device.operating_system.to_s).to eql('Apple iOS 5.0')
    end
  end

  describe 'iPad' do
    string = 'Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/34.0.1847.18 Mobile/11D201 Safari/9537.53 (000540)'
    let(:ua) { AgentOrange::UserAgent.new(string) }

    it 'should have a device type of :mobile' do
      expect(ua.device.type).to eql(:mobile)
    end

    it 'should not have the device type of :computer' do
      expect(ua.device.is_computer?).to be_falsey
    end

    it 'should have a platform type of :apple' do
      expect(ua.device.platform.type).to eql(:apple)
    end

    it 'should have a platform name of :iphone' do
      expect(ua.device.platform.version.major).to eql('iPad')
    end
  end

  describe 'Android' do
    string = 'Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36'
    let(:ua) { AgentOrange::UserAgent.new(string) }

    it 'should have a device type of :mobile' do
      expect(ua.device.type).to eql(:mobile)
    end

    it 'should not have the device type of :computer' do
      expect(ua.device.is_computer?).to be_falsey
    end

    it 'should have a platform type of :pc' do
      expect(ua.device.platform.type).to eql(:pc)
    end

    it 'should expect the operating system to be Apple iOS 5.0' do
      expect(ua.device.operating_system.to_s).to eql('Android 6.0.1')
    end
  end

end
