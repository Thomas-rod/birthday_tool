desc "This task is called by the Heroku scheduler add-on"

task :send_reminders_previous_day => :environment do
  User.send_reminders_previous_day
end

task :send_reminders_today_morning => :environment do
  User.send_reminders_today_morning
end

task :send_reminders_today_noon => :environment do
  User.send_reminders_today_noon
end

task :send_reminders_today_night => :environment do
  User.send_reminders_today_night
end

task :update_feed => :environment do
  puts "Updating feed..."
  puts "done."
end
