class AddCostFieldsToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :base_cost_per_unit_distance, :decimal
    add_column :trains, :additional_cost_factor, :decimal
  end
end
