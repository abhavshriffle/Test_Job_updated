class AddLineNameToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :line_name, :string
  end
end
