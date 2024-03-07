ActiveAdmin.register Payment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :payment_intent_id, :payment_status, :checkout_session_id, :user_id, :order_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:payment_intent_id, :payment_status, :checkout_session_id, :user_id, :order_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :order
  # remove_filter :payment
  
end
