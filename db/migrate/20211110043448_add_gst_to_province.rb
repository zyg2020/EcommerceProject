class AddGstToProvince < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :GST, :decimal
  end
end
