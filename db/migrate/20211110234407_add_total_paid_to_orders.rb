class AddTotalPaidToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_paid, :decimal
  end
end
