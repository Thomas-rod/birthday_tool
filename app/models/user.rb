class User < ApplicationRecord
  # Include default devise modules. Others available are:


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :friends, dependent: :destroy
  has_many :birthdays, through: :friends
  has_one :profil

  validates :email, uniqueness: true

  #---------------------------------#
  #              METHOD             #
  #---------------------------------#
      # today_birthdays = user.birthdays.select{ |b| b.start.day == Date.today.day && b.start.month == Date.today.month }

  def send_reminder_previous_day
    self.all.each do |user|
      tomorow_birthdays = user.birthdays.select{ |b| b.start.day == (Date.today.day + 1) && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_previous_day == true }
      unless tomorow_birthdays.empty?
        UserMailer.with(user: user, tomorow_birthdays: tomorow_birthdays).send_reminders_previous_day.deliver_now
      end
    end
  end

  def send_reminders_today_morning
    self.all.each do |user|
      today_birthdays = user.birthdays.select{ |b| b.start.day == Date.today.day && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_morning == true }
      unless today_birthdays.empty?
        UserMailer.with(user: user, today_birthdays: today_birthdays).send_reminders_today_morning.deliver_now
      end
    end
  end

  def send_reminders_today_noon
    self.all.each do |user|
      today_birthdays = user.birthdays.select{ |b| b.start.day == Date.today.day && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_noon == true }
      unless today_birthdays.empty?
        UserMailer.with(user: user, today_birthdays: today_birthdays).send_reminders_today_noon.deliver_now
      end
    end
  end

  def send_reminders_today_night
    User.all.each do |user|
      today_birthdays = user.birthdays.select{ |b| (b.start.day) == (Date.today.day) && b.start.month == Date.today.month && b.start.year == Date.today.year && b.friend.reminder_today_night == true }
      unless today_birthdays.empty?
        UserMailer.with(user: user, today_birthdays: today_birthdays).send_reminders_today_night.deliver_now
      end
    end
  end

    # PICK ALL USER
    # CHECK FOR EVERY USER IF THERE IS A FRIEND BIRTHDAY TODAY OR THE DAY AFTER
    # FOR EVERY BIRTHDAY SELECTED, CHECK THE REMINDER SELECTED
      # REMINDER DAY BEFORE -> SEND AN EMAIL TO PREVENT USER THERE IS A BIRTHDAY TOMOROW
      # REMINDER CURRENT DAY MORNING -> SEND AN EMAIL DO NOT FORGET THE BIRTHDAY
      # REMINDER CURRENT DAY NOON -> SEND AN EMAIL DO NOT FORGET THE BIRTHDAY
      # REMINDER CURRENT DAY NIGHT -> SEND AN EMAIL DO NOT FORGET THE BIRTHDAY

  def birthday_of_the_month
    self.birthdays.select { |b| (b.start.month == Date.today.month && b.start.year == Date.today.year)}
  end

  def counter_birthday_of_the_month
    counter = 0
    self.birthdays.each do |b|
      counter += 1 if (b.start.month == Date.today.month && b.start.year == Date.today.year)
    end
    return counter
  end
end
