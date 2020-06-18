# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_reminders_previous_day
  def send_reminders_previous_day
    UserMailer.send_reminders_previous_day
  end

end
