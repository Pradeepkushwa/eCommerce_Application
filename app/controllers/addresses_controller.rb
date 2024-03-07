class AddressesController < ApplicationController
	before_action :authenticate_request, except: [:create]
    before_action :authenticate_request
    def index
        @addresses = @current_user.addresses
        render json: @addresses, each_serializer: AddressSerializer
    end
      # You can customize your CanCan Ability class name here.

    def show
        @address = @current_user.addresses.find_by(id: params[:id])
        if @address.present?
           render json: @address, each_serializer: AddressSerializer
        else
           render json: {error: "current_user address not found"}, status: :unauthorized
        end
    end

    def create
        @address = Address.create(address_params.merge(user_id: @current_user.id))
        # puts "@address: #{@address.inspect}"
        if @address.save
           render json: @address, each_serializer: AddressSerializer
        else
           render json: {errors: @address.errors.full_messages}, 
           status: :unprocessable_entity
        end
    end

    def update
        @address = Address.find_by(id: params[:id], user_id: @current_user.id)
        if @address&.update(address_params)
           render json:{message: "address is updated successfully"}, status: :ok
        else
           render json:{notice: "you can't update other users address"}, status: :unauthorized
        end
    end

    def destroy
        @address = Address.find_by(id: params[:id])
        if @address&.destroy
           render json: {message: "address is deleted successfully"}, status: :ok
        else
           render json: {message: "already destroy"}, status: :unauthorized
        end
    end

    private 

    def address_params
        params.permit(:street_address, :city, :state, :zip_code)
    end

end
