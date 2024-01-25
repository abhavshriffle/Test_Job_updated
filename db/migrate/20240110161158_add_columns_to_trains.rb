class AddColumnsToTrains < ActiveRecord::Migration[7.0]
  def change
    add_reference :trains, :train_operator, null: false, foreign_key: true
    add_reference :trains, :line, null: false, foreign_key: true
    add_column :trains, :capacity, :integer
    add_column :trains, :cost, :integer
    add_column :trains, :status, :boolean
  end
end
