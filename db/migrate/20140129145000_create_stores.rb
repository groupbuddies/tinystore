class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user
      t.string :name, null: false
      t.string :slug, null: false
      t.string :email, null: false
      t.string :logo
      t.text :description
    end
  end
end
