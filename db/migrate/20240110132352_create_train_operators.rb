class CreateTrainOperators < ActiveRecord::Migration[7.0]
  def change
    create_table :train_operators do |t|

      t.timestamps
    end
  end
end
