class UsersController < ApplicationController
	before_action :authenticate_request, except: [:create,:index]
	before_action :set_user, only: [:show,:update, :destroy]


	def index
	    @users = User.all
	    if @user.present?
            render json: @users, each_serializer: UserSerializer
        else 
            render json: {error: "not content found"}, status: "204"
        end

	end

	def show
		if @current_user == @user
			render json: @user, each_serializer: UserSerializer,status: :ok
		else
			render json: {error: "you can't show other user"},status: "400"
		end
	end

	def create
		# debugger
		@user = User.new(user_params)

		if @user.save
			render json: @user, each_serializer: UserSerializer, status: :created

		else
			render json: {errors: @user.errors.full_messages}, 
			status: :unprocessable_entity
		end
	end

	def update
		@current_user == @user
		if @current_user.present?
			@current_user&.update(user_params)
			render json:{user:  @current_user, message: "user is updated successfully"}, status: :ok
		else
			render json:{message: "something went wrong"}, status: "422"
		end
	end


	def destroy
		@current_user == @user
		if @current_user.present?  
			@current_user.destroy
			render json: {message: "user is deleted successfully"}, status: :ok
		else
			render json: {Error: "User not found"}, status: "400"
		end
	end

	private

	def user_params
		params.permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render json: { errors: 'User not found' }, status: :not_found
	end
end
