class DailySummaryMailer < ApplicationMailer
  default from: 'noreply@BTMH-EATON.com'

  def daily_summary(recipient)
    @recipient = recipient
    @date = 1.day.ago
    @requests = APIRequest.yesterday
    @count = @requests.count

    mail(to: recipient.email, subject: 'Bluetooth Motion Head Daily Digest')
  end

end
