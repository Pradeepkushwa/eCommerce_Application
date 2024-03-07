class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :vendor_name
      t.string :vendor_email
      t.bigint :vendor_mobile
      t.string :vendor_address
      t.string :vendor_shopname
      t.integer :permit , default: 0

      t.timestamps
    end
    add_reference :requests, :user, null: false, foreign_key: true
  end
end
