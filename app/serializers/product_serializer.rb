class ProductSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :description, :mrp, :price, :image

  def image
    host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"
    if object.image.attached?
      host + Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    else
      "null"
    end
  end
end 
