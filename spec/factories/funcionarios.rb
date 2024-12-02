FactoryBot.define do
  factory :funcionario do
    nome { Faker::Name.name }
    cpf { Faker::Alphanumeric }
    endereco { Faker::Address.full_address }
    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }

    association :empresa
  end
end
