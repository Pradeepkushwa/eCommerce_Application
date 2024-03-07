class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|

      t.timestamps
    end
    add_reference :carts, :user, null: false, foreign_key: true
  end
end
