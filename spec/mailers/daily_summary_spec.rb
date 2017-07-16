require 'rails_helper'

RSpec.describe DailySummaryMailer, type: :mailer do
  let(:api_request) { mock_model(APIRequest) }
  let(:email_recipient) { mock_model(EmailRecipient, name: 'Test User', email: 'test_user@example.com') }
  let(:mail) { described_class.daily_summary(email_recipient).deliver_now }

  it 'renders the subject' do
    expect(mail.subject).to eql('Bluetooth Motion Head Daily Digest')
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(['noreply@BTMH-EATON.com'])
  end

  it 'renders the receiver email' do
    expect(mail.to).to eql(['test_user@example.com'])
  end



end
