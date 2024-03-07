class CartSerializer < ActiveModel::Serializer
    attributes :user_id, :quantity 
end