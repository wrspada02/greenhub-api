FactoryBot.define do
  factory :empresa do    
    endereco { Faker::Address.full_address }
    cnpj { Faker::Company.brazilian_company_number }
    telefone { Faker::PhoneNumber.phone_number }
    nome do
      loop do
        name = Faker::Company.name
        break name if name.length >= 15
      end
    end
  end
end

