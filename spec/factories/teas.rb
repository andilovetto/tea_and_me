FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temp { Faker::Number.within(range: 150..202) }
    brew_time { Faker::Number.between(from: 1, to: 10) }
  end
end