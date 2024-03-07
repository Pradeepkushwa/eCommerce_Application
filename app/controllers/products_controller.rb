class ProductsController < ApplicationController
  before_action :authenticate_request

  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.present?
     render json: @product, each_serializer: ProductSerializer
    else
    render json: {error: "not found"}, status: :not_found
    end
  end

end
