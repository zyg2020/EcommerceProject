class RenameProvinceTaxRateToTotalTaxRateInOrders < ActiveRecord::Migration[6.1]
  def up
    rename_column :orders, :province_tax_rate, :total_tax_rate
  end

  def down
    rename_column :orders, :total_tax_rate, :province_tax_rate
  end
end
