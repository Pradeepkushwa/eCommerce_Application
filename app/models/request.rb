class Request < ApplicationRecord
    self.table_name = "requests"
    enum permit: {"Pending" => 0, "Accept" => 1, "Reject" => 2}
	validates :vendor_name, presence: true
	validates :vendor_email, presence: true
	validates :vendor_mobile, presence: true
	validates :vendor_address, presence: true
	validates :vendor_shopname, presence: true

	has_one_attached :document
	belongs_to :user
end
