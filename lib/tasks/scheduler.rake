namespace :scheduler do
  desc 'This task is called by the Heroku Scheduler add-on'
  task send_daily_summary: :environment do
    puts 'checking to see any requests occurred yesterday...'

    EmailRecipient.find_each do |recipient|
      DailySummaryMailer.daily_summary(recipient).deliver_now
    end

    puts 'daily summary successfully sent.'
  end
end