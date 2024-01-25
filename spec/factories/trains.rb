FactoryBot.define do
  factory :train do
    association :train_operator
    association :line
    capacity { Faker::Number.between(from: 50, to: 500) }
    cost { Faker::Number.between(from: 50, to: 200) }
    status { true }
    line_name { Faker::Lorem.word }
    time { Faker::Time.forward(days: 23, period: :morning) }
    base_cost_per_unit_distance { Faker::Number.decimal(l_digits: 2) }
    additional_cost_factor { Faker::Number.decimal(l_digits: 2) }
    distance { Faker::Number.between(from: 10, to: 500) }
    weight { Faker::Number.between(from: 100, to: 500) }
    volume { Faker::Number.between(from: 50, to: 500) }
  end
end
