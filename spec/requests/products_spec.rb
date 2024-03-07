require 'rails_helper'

RSpec.describe "Products", type: :request do
  before do 
   @user = FactoryBot.create(:user)
   @product = FactoryBot.create(:product)
   @token = JsonWebToken.encode(user_id: @user.id)
 end
 describe "GET /index" do
  it "return a successful response" do
    get "/products",params:{token: @token}

    data = JSON.parse(response.body)
    expect(response).to have_http_status(200)
  end
end
describe "GET /show" do
 it "show product is successfully" do
   get "/products/#{@product.id}", params:{token: @token}
   expect(response).to have_http_status(200)
 end
 it "product is not found" do 
    # byebug
    get "/products/0", params:{token: @token}
    expect(response).to have_http_status(404)
  end
end
end
