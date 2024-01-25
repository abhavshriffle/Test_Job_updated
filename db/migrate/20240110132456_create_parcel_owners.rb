class CreateParcelOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :parcel_owners do |t|

      t.timestamps
    end
  end
end
