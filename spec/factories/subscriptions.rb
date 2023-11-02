FactoryBot.define do
  factory :subscription do
    customer_id { 1 }
    tea_id { 1 }
    title { Faker::Tea.variety }
    price { Faker::Number.decimal(l_digits: 2) }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 0, to: 2) }
  end
end