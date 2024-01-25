FactoryBot.define do
  factory :bid do
    association :train_operator
    association :parcel
    amount { Faker::Number.decimal(l_digits: 2) }
  end
end
