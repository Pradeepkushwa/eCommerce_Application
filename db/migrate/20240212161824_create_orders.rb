class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_number
      t.decimal :total_mrp
      t.decimal :total_price
      t.decimal :discount
      t.decimal :tax
      t.string :payment_method

      t.timestamps
    end
  end
end
