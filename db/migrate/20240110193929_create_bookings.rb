class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :train, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
