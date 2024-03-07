ActiveAdmin.register Request do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :id,:vendor_name, :vendor_email, :vendor_mobile, :vendor_address, :vendor_shopname,:document, :permit
  #
  # or
  #
  # permit_params do
  #   permitted = [:vendor_name, :vendor_email, :vendor_mobile, :vendor_address, :vendor_shopname, :permit]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



  actions :all, except:[:new, :edit, :destroy]

  form do |f|
    f.inputs 'Request Details' do
      f.input :vendor_name
      f.input :vendor_mobile
      f.input :vendor_email
      f.input :vendor_address
      f.input :vendor_shopname
      f.input :document, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :vendor_name
    column :vendor_mobile
    column :vendor_email
    column :vendor_address
    column :vendor_shopname
    column :document do |obj|
      obj.document.attached? ? (image_tag url_for(obj&.document), style: 'height: 40px; width: 50px;') : "no document"
    end
    actions
    column :permit do |request|
    status_tag(request.permit, class: "#{request.permit.downcase}-status")
    end
    actions do |request|
      if request.Pending?
        link_to('Accept', accept_admin_request_path(request), method: :put) +' '+ 
        link_to('Reject', reject_admin_request_path(request), method: :put)
      end
    end
  end

  member_action :accept, method: :put do
    resource.update(permit: 'Accept')
    resource.user.update(role: "Vendor")
    redirect_to admin_requests_path, notice: 'Request accepted successfully.'
  end

  member_action :reject, method: :put do
    resource.update(permit: 'Reject')
    redirect_to admin_requests_path, notice: 'Request rejected successfully.'
  end

end



