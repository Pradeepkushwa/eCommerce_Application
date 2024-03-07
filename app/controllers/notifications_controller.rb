class NotificationsController < ApplicationController
    before_action :authenticate_request
    before_action :set_notification, only: [:show,:update,:destroy]

	def index
		# puts "@current_user: #{@current_user.inspect}"
		@notifications = @current_user.notifications.order(created_at: :desc)
		render json: @notifications, status: :ok
	end

	def show
		render json: @notification
	end


	def update

		if @notification.update(notification_params)
			render json: @notification
		else
			render json: {errors: @notification.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@notification.destroy
		render json: {message: "notification delete successfully"}
	end

	private

	def set_notification
		@notification = @current_user.notifications.find(params[:id])
	end

	def notification_params
		params.permit(:message,:read)
	end

end
