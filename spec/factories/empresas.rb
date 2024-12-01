FactoryBot.define do
  factory :empresa do    
    endereco { Faker::Address.full_address }
    cnpj { Faker::Company.brazilian_company_number }
    telefone { Faker::PhoneNumber.phone_number }
    nome { Faker::Company.name.between(from: 15, to: 20) }
  end
end

