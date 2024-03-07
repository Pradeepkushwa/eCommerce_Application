ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :phone, :password_digest
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :phone, :password_digest]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  remove_filter :cart
  remove_filter :orders
  remove_filter :addresses
  remove_filter :payments
  remove_filter :quantities
  remove_filter :notifications
  remove_filter :wishlist
  remove_filter :requests

  
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :password
      # f.input :image, as: :file
    end
    f.actions
  end

   index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone
    column :role
    # column :image do |obj|
    #   obj.image.attached? ? (image_tag url_for(obj&.image), style: 'height: 100px; width: 50px;') : "no image"
    # end 
    actions
  end


  show do 
     attributes_table do
         row :first_name
         row :last_name
         row :email
         row :phone
         row :role
        #  row :image do |obj|
        # obj.image.attached? ? (image_tag url_for(obj&.image), style: 'height: 500px; width: 350px;') : "no image"
        #  end
     end
  end
  
end
