class AddressSerializer < ActiveModel::Serializer
   
 attributes :id, :street_address, :city, :state, :zip_code, :user_id

 def image	
    host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"
    if object.image.attached?
      host + Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
   else
      "null"
   end
end
end