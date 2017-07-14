require 'rails_helper'

RSpec.describe DailyMailer, type: :mailer do
  let(:email_recipient) { mock_model(EmailRecipient, name: 'Test User', email: 'test_user@example.com') }
  let(:mail) { described_class.daily_email.deliver_now }

  it 'renders the subject' do
    expect(mail.subject).to eql('Bluetooth Motion Head Daily Digest')
  end

  it 'renders the receiver email'

  it 'assigns @name'

  it 'assigns @api_requests'

end
