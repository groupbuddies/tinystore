class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :store
      t.string :name, null: false
      t.money :price, null: false
      t.string :picture
      t.string :description, null: false
    end
  end
end
