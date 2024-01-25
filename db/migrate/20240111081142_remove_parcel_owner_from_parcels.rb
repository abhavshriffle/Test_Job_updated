class RemoveParcelOwnerFromParcels < ActiveRecord::Migration[7.0]
  def change
    remove_column :parcels, :parcel_owner, :string
  end
end
