FactoryBot.define do
  factory :parcel do
    association :parcel_owner
    weight { Faker::Number.decimal(l_digits: 2) }
    volume { Faker::Number.between(from: 1, to: 100) }
  end
end
