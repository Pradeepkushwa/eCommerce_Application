class PasswordsController < ApplicationController
	before_action :authenticate_request
	def update
	    @user = @current_user
        if @user&.authenticate(params[:current_password])
			if @user.update(password: params[:new_password])
				render json: {message: "password change successfully"}
		    else
              render json: {errors: @user.error.full_messages}, status: :unprocessable_entity
            end
	    else
            render json: {error: "current password is incorrect"}, status: :unauthorized
        end
	end
end
