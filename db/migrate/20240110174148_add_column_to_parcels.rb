class AddColumnToParcels < ActiveRecord::Migration[7.0]
  def change
    add_column :parcels, :parcel_owner_id, :integer
  end
end
