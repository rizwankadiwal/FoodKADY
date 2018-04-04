class AddPhoneNoToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :phone_no, :string
    add_column :customers, :int, :string
  end
end
