require 'rails_helper'

RSpec.describe "Users", type: :request do

  before do
   @user = FactoryBot.create(:user)
   @token = JsonWebToken.encode(user_id: @user.id)
 end
 describe "GET /index" do
  it "return a successful response" do 
    get "/users"
    data = JSON.parse(response.body)
    expect(response).to have_http_status(200)
  end
end

describe "GET /show" do 
 it "show user is successfully" do
   get "/users/#{@user.id}", params:{token: @token}
   expect(response).to have_http_status(200)
 end
 it "user is not found" do
   get "/users/0", params:{token: @token}
   expect(response).to have_http_status(404)
 end
end

describe "POST /create" do
  it "data is created successfully"  do 
    post "/users", params:{first_name: "first", last_name: "last", email: "pradeep.kushwaha@poolstack.in", phone: "6260261764" , password: "123456", confirm_password: "123456"}
    expect(response).to have_http_status(201)
  end
  
  it "data is not created" do 

    post "/users", params:{last_name: nil, email: "pradeep.kushwaha@poolstack.in", phone: "6260261764" , password: "123456", confirm_password: "123456"}
    expect(response).to have_http_status(422)
  end
end

describe "PATCH /update" do
    # debugger
    it "user updated sucessfully" do
      patch "/users/#{@user.id}", params: {first_name: "last", last_name: "first", email: "pradeep.kushwaha@poolstack.in", phone: "6260261764" , password: "123456", confirm_password: "123456"} , params:{token: @token}
      expect(response).to have_http_status(200)
    end
    it "user not found" do
      patch "/users/0"
      expect(response).to have_http_status(401)
    end

  end

  describe "DELETE /destroy" do 
   it "user is deleted successfully" do
     delete "/users/#{@user.id}", params:{token: @token}
     expect(response).to have_http_status(200)
   end

   it "user is not found" do
     delete "/users/0"
     expect(response).to have_http_status(401)
   end
 end
end
