class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    # byebug
    @order = order
    mail(to: @order.user.email, subject: "order confirmation")
  end

  def order_update_confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: "order update confirmation")
  end
end