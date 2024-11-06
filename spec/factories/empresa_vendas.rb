FactoryBot.define do
  factory :empresa_venda do
    preco { Faker::Commerce.price(range: 100.0..10_000.0) }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
