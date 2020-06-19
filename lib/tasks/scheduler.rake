desc "This task is called by the Heroku scheduler add-on"

task :send_reminders_previous_day => :environment do
  User.all.each do |user|
    tomorow_birthdays = user.birthdays.select{ |b| b.start.day == (Date.today.day + 1) && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_previous_day == true }
    UserMailer.with(user: user, tomorow_birthdays: tomorow_birthdays).send_reminders_previous_day.deliver_now
  end
end

task :send_reminders_today_morning => :environment do
  User.all.each do |user|
    today_birthdays = user.birthdays.select{ |b| b.start.day == Date.today.day && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_morning == true }
    UserMailer.with(user: user, today_birthdays: tomorow_birthdays).send_reminders_today_morning.deliver_now
  end
end

task :send_reminders_today_noon => :environment do
  User.all.each do |user|
    tomorow_birthdays = user.birthdays.select{ |b| b.start.day == Date.today.day && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_noon == true }
    UserMailer.with(user: user, tomorow_birthdays: tomorow_birthdays).send_reminders_today_noon.deliver_now
  end
end

task :send_reminders_today_night => :environment do
  User.all.each do |user|
    tomorow_birthdays = user.birthdays.select{ |b| (b.start.day) == (Date.today.day) && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_night == true }
    UserMailer.with(user: user, tomorow_birthdays: tomorow_birthdays).send_reminders_today_night.deliver_now
  end
end

task :update_feed => :environment do
  puts "Updating feed..."
  puts "done."
end
