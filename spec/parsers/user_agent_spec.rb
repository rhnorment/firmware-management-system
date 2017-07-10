require 'rails_helper'
require 'net/http'

RSpec.describe AgentOrange::UserAgent do
  describe 'safari' do
    it 'detects the safari browser' do
      user_agent_string = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; de-at) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1'
      ua = AgentOrange::UserAgent.new(user_agent_string)

      device = ua.device
      expect(device.type).to eql(:computer)
      expect(device.name).to eql('Computer')
      expect(device.is_mobile?).to eql(false)
    end
  end
end