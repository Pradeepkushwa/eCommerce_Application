class Quantity < ApplicationRecord
	self.table_name = "quantities"
	belongs_to :product
	belongs_to :order , optional: true	
end