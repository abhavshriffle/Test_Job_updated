FactoryBot.define do
  factory :offer do
    train_operator { association :train_operator }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    line { association :line }
  end
end
