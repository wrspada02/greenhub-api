RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  factory :empresa do
    id_empresa { Faker::Number.number(digits: 8) }
    endereco { Faker::Address.full_address }      
    cnpj { Faker::Company.brazilian_company_number }
    telefone { Faker::PhoneNumber.phone_number }
    nome { Faker::Company.name }
  end
end