FactoryBot.define do
  factory :funcionario do
    cpf { Faker::Alphanumeric.alphanumeric }
    endereco { Faker::Address.full_address }
    nome do
      loop do
        name = Faker::Name.name
        break name if name.length >= 15 && name.length <= 40
      end
    end
    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
    association :empresa
  end
end
