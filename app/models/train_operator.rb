class TrainOperator < ApplicationRecord
  has_many :trains, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :bids, dependent: :destroy
end
