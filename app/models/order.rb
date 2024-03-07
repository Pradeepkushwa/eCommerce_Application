class Order < ApplicationRecord
	# validates :payment_method, presence: true
	belongs_to :user
	belongs_to :address
	has_one_attached :image
	# after_create :send_notification_after_create_user
	after_create :send_notification 
	after_update :send_update_notification
	has_and_belongs_to_many :products

	has_one :payment,  dependent: :destroy

	enum :status, [:pending, :inprogress, :delivered, :shipped]
	private

	def send_notification
		Notification.create(user_id: self.user_id, message: "your order has been placed successfully")
	end
    
    def send_update_notification
		Notification.create(user_id: self.user_id, message: "your order has been #{self.status} successfully")
		OrderMailer.order_update_confirmation(self).deliver_now
	end
end