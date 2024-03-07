require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  before do 
   @user    = FactoryBot.create(:user)
   @cart    = FactoryBot.create(:cart, user_id: @user.id)
   @product = FactoryBot.create(:product)
   @address = FactoryBot.create(:address, user_id: @user.id)
   @token   = JsonWebToken.encode(user_id: @user.id)
 end
 describe "GET /index" do
    # byebug
    it "data is response successfully" do 
      get "/addresses",params:{token: @token}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do 
    # byebug
    it "show address is successfully"  do
      get "/addresses/#{@address.id}",params: {token: @token}
      expect(response).to have_http_status(200)
    end
    it "address is not found" do 
      get "/addresses/0",params: {token: @token}
      expect(response).to have_http_status(401)
    end
  end

  describe "POST /create" do
    # byebug
    it "address is created successfully" do 
      post "/addresses",params:{token: @token, street_address: "string_add", state: "string_state", city: "bhopa", zip_code: 123456}
      expect(response).to have_http_status(200)
    end
    it "address is not created successfully" do
      post "/addresses",params: {token: @token,street_address: "string_add", state: "string_state", city: "bhopa", zip_code: nil}
      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /update" do
    it "address is updated sucessfully" do
      patch "/addresses/#{@address.id}",params: {token: @token}
      expect(response).to have_http_status(200)
    end
    it "address is not found" do 
      patch "/addresses/0",params: {token: @token}
      expect(response).to have_http_status(401)
    end
  end

  describe "DELETE /destroy" do
    debugger
    it "address is deleted successfully" do
      delete "/addresses/#{@address.id}", params: {token: @token}
      expect(response).to have_http_status(200)
    end
    it "address is not found" do
      delete "/addresses/0",params: {token: @token}
      expect(response).to have_http_status(401)
    end
  end

end

