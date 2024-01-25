class AddWeightAndVolumeToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :weight, :integer
    add_column :trains, :volume, :integer
  end
end
