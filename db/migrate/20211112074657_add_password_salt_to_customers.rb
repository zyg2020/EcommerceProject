class AddPasswordSaltToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :password_salt, :string
  end
end
