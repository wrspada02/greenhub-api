FactoryBot.define do
  factory :funcionario do
    sequence(:id_funcionario) { |n| n }

    nome { Faker::Name.name }
    cpf { Faker::Alphanumeric }
    endereco { Faker::Address.full_address }
    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
