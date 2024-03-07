class OrderSerializer < ActiveModel::Serializer
    attributes :user_id, :order_number, :total_mrp, :total_price, :discount, :tax, :payment_method, :address_id,:status

  #   attribute :address do |object, params|
  #       if @object.present?
  #          {
  #           # id: @object.address&.id,
  #           street_address: @object.address.street_address,
  #           city: @object.address.city,
  #           state: @object.address.state,
  #           zip_code: @object.address.zip_code
  #          }
  #       else
  #         nil
  #       end
  #   end

  #    attribute :products do |object|
  #    if @object.present?
  #       @object.products.map do |product|
  #       {
  #         id: product.id,
  #         title: product.title,
  #         description: product.description,
  #         mrp: product.mrp,
  #         price: product.price
  #       }
  #     end
  #   else
  #     []
  #   end
  # end

    # attribute :product do |object, params|
    #     # byebug
    #     if @object.present?
    #       product = Product.find_by(id: @object.products)
    #     else
    #         nil
    #     end
    # end

    # attribute :address do |object|
    #     # byebug
    #     if @object.present?
    #       address = Address.find_by(id: @object.address.id)
    #     else
    #       nil
    #     end
    # end    
end