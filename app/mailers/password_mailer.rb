class PasswordMailer < ApplicationMailer
    
  def reset_password(user)
    # debugger
      @user = user
      if @user.present? && @user.reset_password_token.present?
      @reset_password_url = edit_password_reset_url(@user.reset_password_token)
      mail(to: @user.email, subject: 'Reset Your Password')
      else
      Rails.logger.error "Trying to send reset password email for invalid user: #{@user.inspect}"
      end
  end

end