class Bid < ApplicationRecord
  belongs_to :train_operator
  belongs_to :parcel

  validates :amount, presence: true
end
