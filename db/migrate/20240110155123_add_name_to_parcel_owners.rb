class AddNameToParcelOwners < ActiveRecord::Migration[7.0]
  def change
    add_column :parcel_owners, :name, :string
  end
end
