class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.decimal :province_tax_rate

      t.timestamps
    end
  end
end
