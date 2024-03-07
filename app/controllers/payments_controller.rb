class PaymentsController < ApplicationController
	before_action :authenticate_request

	def checkout
		@order = Order.find(params[:order_id])
		se = Stripe::Checkout::Session.create({
			line_items: [
				{
					price_data: {
						currency: 'usd',
		        # product_data: {name: "T-shirt"},
		        # unit_amount: 2000
		        product_data: {name: "#{@order.products.pluck(:title)}"},
		        unit_amount: @order.total_price.to_i * 100
		    },
		    quantity: 1,
		}
	],
	customer: @current_user.stripe_id,
		  # customer_email: @current_user.email,  # Include customer email
		  billing_address_collection: 'required',  # Collect billing address
		  shipping_address_collection: {
		  allowed_countries: ['US'],  # Specify allowed shipping countries
		},
		mode: 'payment',
		success_url: 'http://localhost:4242/success.html',
		cancel_url: 'http://localhost:4242/cancel.html',
	})
	
		Payment.create(user_id: @current_user.id, order_id: @order.id, checkout_session_id: se.id, payment_status: "inprogress")
		render json: se
	end
	def retrive_checkout
		checkout_session = Stripe::Checkout::Session.retrieve(params[:checkout_session_id])
		@current_user.payments.last.update(
			payment_status: checkout_session.payment_status,
			payment_intent_id: checkout_session.payment_intent)
		render json: {
			payment_status: checkout_session.payment_status,
			payment_intent_id: checkout_session.payment_intent
		}
	end
end
