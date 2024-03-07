require 'rails_helper'

RSpec.describe "Carts", type: :request do
  before do 
   @user    = FactoryBot.create(:user)
   @product = FactoryBot.create(:product)
   @cart    = FactoryBot.create(:cart, user_id: @user.id)
   @token   = JsonWebToken.encode(user_id: @user.id)
 end

 describe "POST /add_product" do
  it "product add to cart successfully" do
    post "/add_product/#{@product.id}",params:{token: @token}
    expect(response).to have_http_status(200)
  end
  it "product is not found" do 
    post "/add_product/0",params:{token: @token}
    expect(response).to have_http_status(404)
  end
end

describe "DELETE /remove_product" do
  it "product is removed from cart is successfully" do
    @user.cart.products << @product
    delete "/remove_product/#{@product.id}", params:{token: @token}
    expect(response).to have_http_status(200)
  end
  it "product is not found" do
    delete "/remove_product/0",params:{token: @token}
    expect(response).to have_http_status(404)
  end
end
end
