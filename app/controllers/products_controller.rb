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

  def import_csv
      begin
        raise 'No file attached' unless params.dig(:product, :csv_file).present?
        products = CsvHelper.convert_to_products(params[:product][:csv_file])
        Product.transaction do
          products.each(&:save!)
        end
        render json: {message: 'CSV imported successfully!', imported_products: products}
      rescue StandardError => e
        Rails.logger.error("CSV import failed: #{e.message}")
        render json: { error: 'CSV import failed! Check the template or contact a developer!' }
      end
  end


end
