class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :train_operator, null: false, foreign_key: true
      t.integer :price
      t.references :line, null: false, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
