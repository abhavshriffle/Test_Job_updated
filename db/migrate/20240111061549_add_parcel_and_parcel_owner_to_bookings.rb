class AddParcelAndParcelOwnerToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :parcel_id, :integer
    add_column :bookings, :parcel_owner_id, :integer
  end
end


# db/migrate/timestamp_add_parcel_and_parcel_owner_to_bookings.rb

# class AddParcelAndParcelOwnerToBookings < ActiveRecord::Migration[7.0]
#   def change
#     create_table :bookings do |t|
#       t.integer :train_id, null: false
#       t.integer :parcel_id
#       t.integer :parcel_owner_id
#       t.boolean :status
#       t.datetime :created_at, null: false
#       t.datetime :updated_at, null: false

#       t.index [:train_id], name: 'index_bookings_on_train_id'
#       t.index [:parcel_id], name: 'index_bookings_on_parcel_id'
#       t.index [:parcel_owner_id], name: 'index_bookings_on_parcel_owner_id'
#     end

#     add_foreign_key :bookings, :trains, column: :train_id
#     add_foreign_key :bookings, :parcels, column: :parcel_id
#     add_foreign_key :bookings, :parcel_owners, column: :parcel_owner_id
#   end
# end
