class AddPstToProvince < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :PST, :decimal
  end
end
