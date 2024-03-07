class WishlistsController < ApplicationController
	before_action :authenticate_request

	def view_wishlist
		render json: @current_user.wishlist.products
	end

	def add_product_to_wishlist 
		wishlist = @current_user.wishlist.products
		select_product = Product.find(params[:id])

		if wishlist.include?(select_product)
		   render json: {message: "product has already added to your wishlist"}
		else
		   wishlist.push(select_product)
		   render json: {message: "product has been added successfully"}
		end
	end

	def remove_product_to_wishlist
      product = Product.find_by(id: params[:id])

      if product
      	wishlist = @current_user.wishlist
      	 if wishlist.products.include?(product)
      	 	wishlist.products.delete(product)
      	 	render json: {message: "product has removed successfully from the wishlist"}
      	 else
      	 	render json: {error: "product not found in the wishlist"}, status: :unprocessable_entity
      	 end
      else
      	render json: {error: "product not found"}, status: :not_found
      end
	end
end
