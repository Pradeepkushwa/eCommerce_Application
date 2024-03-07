class User < ApplicationRecord
  require "securerandom"
  self.table_name = "users"
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :phone, presence: true
  validates :email, uniqueness: true
  
  has_one_attached :image
  has_many :quantities
  has_one :wishlist, dependent: :destroy 
  # has_many :wishlist_products, through: :wishlists, source: :product

  has_many :requests, dependent: :destroy

  enum role: {"Customer" => 0, "Vendor" => 1}
  
  has_many :payments, dependent: :destroy
  has_one :cart, dependent: :destroy 
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :notifications, dependent: :destroy
  after_create :send_notification_after_create_user

  after_create :create_cart
  after_create :create_stripe_account

  # def register_notification(token)
  #   notifications.create(fcm_token: token)
  # end

  def generate_reset_password_token
    update(reset_password_token: Devise.token_generator.generate(User, :reset_password_token),
     reset_password_sent_at: Time.now,
     reset_password_used: false)
  end

  def reset_password_period_valid?
    reset_password_sent_at && reset_password_sent_at > 2.minutes.ago && !reset_password_used
  end

  def mark_reset_password_as_used
    update(reset_password_used: true)
  end

  def  create_cart
    Cart.create(user_id: self.id)
  end

  def create_stripe_account
    # Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.create(
      email: self.email,
      )

    self.update(stripe_id: customer.id)
  end

  private
  def send_notification_after_create_user
    UserMailer.user_confirmation(self).deliver_now
  end

  def self.user_message
    puts 'hello'
  end
end
