class DailyMailer < ApplicationMailer
  default from: 'daily_digest@BTMH-EATON.com'

  def daily_email
    mail(to: 'hunt.norment@icloud.com', subject: 'Bluetooth Motion Head Daily Digest')
  end
end
