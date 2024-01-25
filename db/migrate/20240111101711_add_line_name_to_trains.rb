class AddLineNameToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :line_name, :string
  end
end
