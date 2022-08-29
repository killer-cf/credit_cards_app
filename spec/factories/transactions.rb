FactoryBot.define do
  factory :transaction do
    status { 1 }
    value { "9.99" }
    order { "MyString" }
    cpf { "MyString" }
    number { "MyString" }
  end
end
