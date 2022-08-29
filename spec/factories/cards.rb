require 'faker'

FactoryBot.define do
  factory :card do
    name { Faker::Name.name }
    cpf { Faker::Number.unique.number(digits: 11) }
    total_limit { 10_000 }
    available_limit { 10_000 }
  end
end
