class AddPasswordHashToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :password_hash, :string
  end
end
