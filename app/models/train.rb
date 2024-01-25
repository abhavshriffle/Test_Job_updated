class Train < ApplicationRecord
  belongs_to :train_operator, optional: true
  belongs_to :line, optional: true
  has_many :bookings, dependent: :destroy

  delegate :name, to: :line, prefix: true, allow_nil: true

  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
