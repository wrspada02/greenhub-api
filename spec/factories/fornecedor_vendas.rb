FactoryBot.define do
  factory :fornecedor_venda do
    preco { Faker::Commerce.price(range: 10.0..1000.0) }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
