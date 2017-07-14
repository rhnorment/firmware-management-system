class DailyMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def daily_email
    mail(to: 'hunt.norment@icloud.com', subject: 'Bluetooth Motion Head Daily Digest')
  end
end
