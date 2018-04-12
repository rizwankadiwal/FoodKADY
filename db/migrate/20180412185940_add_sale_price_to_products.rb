class AddSalePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sale_price, :boolean
  end
end
