class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.references :province, null: false, foreign_key: true
      t.string :postal_code
      t.string :telephone
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
