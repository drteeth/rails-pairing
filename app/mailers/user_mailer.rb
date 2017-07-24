class UserMailer < ApplicationMailer

  def welcome_new_user(user)
    mail to: user.email, subject: "welcome"
  end

end
