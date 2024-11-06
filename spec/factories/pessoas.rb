FactoryBot.define do
  factory :pessoa do
    sequence(:id_pessoa) { |n| n }
    nome { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    endereco { Faker::Address.full_address }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
