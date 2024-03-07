class JoinTableWishlist < ActiveRecord::Migration[7.1]
  def change
      create_join_table :wishlists, :products do |t|
      t.index [:wishlist_id, :product_id]
      t.index [:product_id, :wishlist_id]
    end
  end
end
