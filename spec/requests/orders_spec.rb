require 'rails_helper'

RSpec.describe "Orders", type: :request do
  before do 
   @user    = FactoryBot.create(:user)
   @product = FactoryBot.create(:product)
   @cart    = FactoryBot.create(:cart, user_id: @user.id)
   @address = FactoryBot.create(:address, user_id: @user.id)
   @order   = FactoryBot.create(:order,user_id: @user.id, address_id: @address.id)
   @token   = JsonWebToken.encode(user_id: @user.id)
 end
 describe "GET /index" do
    # byebug
    it "data is response successfully"  do 
      get "/orders",params: {token: @token}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end 
  end

  describe "GET /show"  do
    # byebug
    it "show order is successfully" do
      get "/orders/#{@order.id}", params: {token: @token}
      expect(response).to have_http_status(200)
    end
    it "show order is not found" do 
      get "/orders/0", params: {token: @token}
      expect(response).to have_http_status(401)
    end
  end

  describe "POST /create" do 
    # byebug
    it "order is created successfully" do
      post "/orders",params:{ token: @token, payment_method: "upi",address_id: @address.id}
      expect(response).to have_http_status(200)
    end
    it "order is not created successfully" do
      post "/orders",params: {token: @token, payment_method: nil, address_id: nil}
      expect(response).to have_http_status(422)
    end
  end
end
