class AddQuantityToCartsProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :quantities do |t|
      t.integer :quantity
      t.bigint :product_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
