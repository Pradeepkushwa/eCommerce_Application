class RequestSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :vendor_name,:vendor_email,:vendor_mobile,:vendor_address,:vendor_shopname,:document,:permit

    def document
    host = Rails.application.routes.default_url_options[:host] = "http://localhost:3000/"
    if object.document.attached?
      host + Rails.application.routes.url_helpers.rails_blob_path(object.document, only_path: true)
    else
      "null"
    end
  end
end