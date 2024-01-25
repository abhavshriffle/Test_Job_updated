class AddNameToTrainOperators < ActiveRecord::Migration[7.0]
  def change
    add_column :train_operators, :name, :string
  end
end
