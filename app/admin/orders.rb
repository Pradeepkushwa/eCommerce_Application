ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :order_number, :total_mrp, :total_price, :discount, :tax, :payment_method, :address_id, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :order_number, :total_mrp, :total_price, :discount, :tax, :payment_method, :address_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  remove_filter :products
  remove_filter :payment
  
end
