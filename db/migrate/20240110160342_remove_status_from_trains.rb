class RemoveStatusFromTrains < ActiveRecord::Migration[7.0]
  def change
    remove_column :trains, :status, :boolean
  end
end
