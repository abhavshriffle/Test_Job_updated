class AddColumnToParcel < ActiveRecord::Migration[7.0]
  def change
    add_column :parcels, :weight, :integer
    add_column :parcels, :volume, :integer
  end
end
