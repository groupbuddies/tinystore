class AddTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :products
    add_timestamps :stores
  end
end
