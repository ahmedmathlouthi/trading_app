FactoryBot.define do
  factory :trade do
    time { Faker::Time.between(from: DateTime.now.yesterday, to: DateTime.now) }
    value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
