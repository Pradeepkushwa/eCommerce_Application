class CartsController < ApplicationController
	before_action :authenticate_request
	def view_cart
	 	render json: @current_user.cart.products
	end

	def add_product
		cart = @current_user.cart.products
		select_product = Product.find(params[:id])

		if cart.include?(select_product)
			qul = select_product.quantities.where(user_id: @current_user.id).last
			qul.quantity += 1
			qul.quantity = params[:quantity] if params[:quantity].present?
			qul.update(quantity: qul.quantity)
		else
		   qul = Quantity.create(product_id: select_product.id, quantity:(params[:quantity] || 1), user_id: @current_user.id)
		   cart.push(select_product)
		end
		   render json: {items: select_product, quantity: qul.quantity, message: "product has been added successfully"}
	end
 
	def remove_product
	    unless @current_user
	 	 render json: {error: "User not authenticated"}, status: :unauthorized
	 	 return
	    end

	    unless @current_user.cart
	 	 render json: {error: "user doest not have a cart"}, status: :unprocessable_entity
	 	 return 
	    end

        product = Product.find_by(id: params[:id])

        if product
      	    cart = @current_user.cart
      	    if cart.products.include?(product)
      	 	   cart.products.delete(product)
      	 	   render json: {message: "product has removed successfully from the cart"}
      	    else
      	 	   render json: {error: "product not found in the cart"}, status: :unprocessable_entity
      	    end
        else
      	    render json: {error: "product not found"}, status: :not_found
        end
    end
end
