class AddHstToProvince < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :HST, :decimal
  end
end
