FactoryBot.define do
  factory :empresa do
    sequence(:id_empresa) { |n| n }
    endereco { Faker::Address.full_address }
    cnpj { Faker::Company.brazilian_company_number }
    telefone { Faker::PhoneNumber.phone_number }
    nome { Faker::Company.name.length(15) }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
