class AddHotdealToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :hotdeal, :boolean
  end
end
