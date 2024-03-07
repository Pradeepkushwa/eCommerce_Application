class Product < ApplicationRecord
	self.table_name = "products"
	# has_and_belongs_to_many :orders
	has_one_attached :image
    has_and_belongs_to_many :address
    has_and_belongs_to_many :carts
    has_many :quantities
    has_and_belongs_to_many :wishlists

end
