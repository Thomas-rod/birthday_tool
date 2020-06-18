class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_reminders.subject
  #
  def send_reminders_previous_day
    @greeting = "Hi"
    @user = params[:user]
    @tomorow_birthdays = params[:tomorow_birthdays]
    mail(
      to: "rodiert17@gmail.com",
      subject: "Hey #{@user.first_name.capitalize}, big news ! Tomorow one of your friend had his birthday 🚀"
    )
  end

  def send_reminders_today_morning
    @greeting = "Hi"
    @user = params[:user]
    @today_birthdays = params[:today_birthdays]
    mail(
      to: @user.email,
      subject: "Hey #{@user.first_name.capitalize}, do not forget your friend's birthday today 🚀 !"
    )
  end
end
