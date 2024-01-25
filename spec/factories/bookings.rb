FactoryBot.define do
  factory :booking do
    association :train
    is_withdraw { false }
    parcel_id { 2 }
    parcel_owner_id { 2 }
    line_name { 'LineA' }
  end
end
