class ParcelOwner < ApplicationRecord
  has_many :parcels, dependent: :destroy
end
