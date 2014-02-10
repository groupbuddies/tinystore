class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.references :store, null: false
      t.references :cart, null: false
      t.money :price, null: false
      t.string :client_name, null: false
      t.string :client_email, null: false
      t.text :notes

      t.timestamps
    end
  end
end
