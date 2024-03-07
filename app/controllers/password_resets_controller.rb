class PasswordResetsController < ApplicationController
# before_action :authenticate_request, except: [:create]
  def new
    # @user = User.new
  end
    
  def create
    @user = User.find_by(email: params[:user_email])
    if @user.present?
      @user.generate_reset_password_token
      PasswordMailer.reset_password(@user).deliver_now
      render json: {notice: "Reset password email sent successfully"}, status: :ok
    else
      render json: {notice: "Invalid email address"} , status: :unprocessable_entity 
    end
  end

  def show_error
  end

  def edit
    @user = User.find_by(reset_password_token: params[:id])
  # if @user.nil?
  # flash[:alert] = 'Invalid reset password token.'
  # redirect_to root_path # or any other appropriate path
  # end
  end

  def update
    @user = User.find_by(reset_password_token: params[:id])
    if @user && @user.reset_password_period_valid?
      if @user.update(password_params)
        @user.mark_reset_password_as_used
        redirect_to new_password_reset_path, notice: 'Password reset successful'
      else
          redirect_to edit_error_password_resets_path: 'Password update failed'
      end
      else
        redirect_to show_error_password_resets_path, notice: 'invalid or expired tocken'

        # redirect_to show_password_reset_path, notice: 'invalid or expired tocken'
        end
    end

  private 
  def password_params
      params.require(:user).permit(:password, :password_confirmation)
  end
end

