class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :first_name, :last_name, :email, :phone, :password_digest, :stripe_id,:role, :image

  def image
    host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"
    if object.image.attached?
      host + Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    else
      "null"
    end
  end
end