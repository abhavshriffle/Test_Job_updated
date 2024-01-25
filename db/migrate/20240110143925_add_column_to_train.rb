class AddColumnToTrain < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :status, :boolean
  end
end
