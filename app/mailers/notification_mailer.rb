class NotificationMailer < ActionMailer::Base
  default from: 'hopp.welcome@gmail.com'

  def notification_email(current_user_email)
    mail(to: current_user_email , subject: "Welcome to hopp!")
  end

end