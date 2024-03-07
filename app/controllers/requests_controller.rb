class RequestsController < ApplicationController
     before_action :authenticate_request
	def index
		# render json: @requests
	end

	def create
		debugger
		# @user = @current_user.find_by(id: params[:id])
		@request = @current_user.requests.new(request_params)

		if @request.save
			render json: @request, each_serializer: RequestSerializer, status: :created
		else
			render json: {errors: @request.errors.full_messages},
			status: :unauthorized
		end
	end

    def request_params
    	params.permit(:vendor_name,:vendor_email,:vendor_mobile,:vendor_address,:vendor_shopname,:document,:permit)
    end
	
end
