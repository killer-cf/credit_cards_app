FactoryBot.define do
  factory :transaction do
    value { 100 }
    order { "ASDFG1234567" }
    cpf { "12345678901" }
    number { "1234567890123456" }
  end
end
