class CreateJoinTableAddressToProducts < ActiveRecord::Migration[7.1]
  def change
create_join_table :addresses, :products do |t|
      t.index [:address_id, :product_id]
      t.index [:product_id, :address_id]
    end
  end
end
