5.times do
  Empresa.create!(
    endereco: Faker::Address.full_address,
    cnpj: Faker::Company.brazilian_company_number,
    telefone: Faker::PhoneNumber.phone_number,
    nome: 
      loop do
        name = Faker::Company.name
        break name if name.length >= 15
      end
  )
end

Empresa.all.each do |empresa|
  Estoque.create!(
    endereco: Faker::Address.full_address,
    empresa_id: empresa.id
  )

  Funcionario.create!(
    nome: Faker::Name.name,
    cpf: Faker::CPF.pretty,
    endereco: Faker::Address.full_address,       
    empresa_id: empresa.id
  )
end

