class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :payment_intent_id
      t.string :payment_status
      t.string :checkout_session_id
      t.bigint :user_id
      t.bigint :order_id
      t.timestamps
    end
  end
end
