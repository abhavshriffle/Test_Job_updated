class AddTimeToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :time, :string
  end
end
