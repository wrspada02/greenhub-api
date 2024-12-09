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
    nome: loop do
      name = Faker::Name.name
      break name if name.length >= 15
    end,
    cpf: Faker::CPF.pretty,
    endereco: Faker::Address.full_address,       
    empresa_id: empresa.id
  )

  Pagamento.create!(
    tipo: Faker::Name.name,
    venda_id_empresa: empresa.id,
    compra_id_empresa: empresa.id,
  )
end

5.times do |i|
  Produto.create!(
    tipo: Faker::Name.name,
    peso: Faker::Number.number,
    nome: loop do
      name = Faker::Name.name
      break name if name.length >= 15
    end,
    estoque_id: i+1 
  )
end

Produto.all.each do |produto|
  Pagamento.all.each do |pagamento|
    ProdutoPagamento.create!(
      quantidade: Faker::Number.number,
      pagamento_id: pagamento.id,
      produto_id: produto.id
    )
  end
end
