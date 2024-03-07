class UserMailer < ApplicationMailer
  def user_confirmation(user)
    # debugger
    @user = user
    mail(to: user.email, subject: "Welcome to Ecommerce Application")
  end
end