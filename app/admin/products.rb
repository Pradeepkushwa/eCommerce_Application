ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :mrp, :price, :image, :csv_file
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :mrp, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    # importing the bulk data in rails using csv 
  action_item only: :index do
    link_to 'Upload CSV', action: 'import_csv'
  end

  collection_action :import_csv, method: [:get, :post] do
    if request.post?
      begin
        raise 'No file attached' unless params.dig(:product, :csv_file).present?

      # Validate if the attached file is a valid CSV file
      # file_extension = File.extname(params[:product][:csv_file].original_filename).downcase
      # raise 'Invalid file format' unless file_extension == '.csv'
        products = CsvHelper.convert_to_products(params[:product][:csv_file])
        Product.transaction do
          products.each(&:save!)
        end
        redirect_to({ action: :index }, notice: 'CSV imported successfully!')
      rescue StandardError => e
        Rails.logger.error("CSV import failed: #{e.message}")
        redirect_to({ action: :index },
          flash: { error: 'CSV import failed! Check the template or contact a developer.' })
      end
    else
      render 'products/import_csv'
    end
  end

  remove_filter :orders
  remove_filter :address
  remove_filter :carts
  remove_filter :quantities
  remove_filter :wishlists


  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :mrp
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :mrp
    column :image do |obj|
      obj.image.attached? ? (image_tag url_for(obj&.image), style: 'height: 40px; width: 50px;') : "no image"
    end 
    actions
  end

  show do 
    attributes_table do 
      row :title
      row :description
      row :price
      row :mrp 
      row :image do |obj|
      obj.image.attached? ? (image_tag url_for(obj&.image), style: 'height: 300px; width: 350px;') : "no image"
      end
    end 
  end
end