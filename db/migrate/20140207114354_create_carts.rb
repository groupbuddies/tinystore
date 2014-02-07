class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :store
      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart
      t.references :product
      t.integer :amount
      t.timestamps
    end
  end
end
