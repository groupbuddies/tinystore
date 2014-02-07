class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :store
      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart, null: false
      t.references :product, null: false
      t.integer :amount, null: false, default: 1
      t.timestamps
    end
  end
end
