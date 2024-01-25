class Parcel < ApplicationRecord
  belongs_to :parcel_owner, optional: true, class_name: 'ParcelOwner', foreign_key: 'parcel_owner_id'
  has_many :parcels, dependent: :destroy
end
