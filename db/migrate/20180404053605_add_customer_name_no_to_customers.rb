class AddCustomerNameNoToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :full_name, :string
    add_column :customers, :string, :string
  end
end
