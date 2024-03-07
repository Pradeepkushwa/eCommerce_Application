class AddColumn < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :user, null: false, foreign_key: true
    add_reference :orders, :address, null: false, foreign_key: true
    add_column :orders, :status, :integer, default: 0

  end
end
