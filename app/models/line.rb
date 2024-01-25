class Line < ApplicationRecord
  has_one :train, dependent: :destroy
  has_many :offers, dependent: :destroy

  enum :status, { available: 0, busy: 1 }
end
