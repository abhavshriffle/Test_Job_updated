class AddDistanceToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :distance, :integer
  end
end
